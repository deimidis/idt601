# ¿Qué hace cada celda del notebook? — Explicación en lenguaje sencillo

> Complemento de `actividad_pipeline_nocodb.ipynb` · Para leer antes, durante o después de la clase

## La idea grande en una frase

El notebook hace lo mismo que haría un empleado muy ordenado: **pide datos a dos sitios de internet, los deja todos con el mismo formato y los guarda en tu tabla de NocoDB**. Cada celda es un paso de ese pedido.

---

## Celda 0 — Configuración y secretos

**¿Qué hace?** Guarda las tres cosas privadas que el notebook necesita para trabajar:
- `TABLA_ID`: el "número de departamento" de la tabla en NocoDB hacia donde se van a escribir los datos.
- `NOCODB_TOKEN`: tu llave para escribir en NocoDB.
- `RC_KEY` / `RESTCOUNTRIES_KEY`: tu llave para usar la API de REST Countries.

**¿Por qué con el panel secretos y no escritas en el código?** Porque el notebook se comparte con la clase. Si las llaves están escritas dentro, cualquiera que reciba el archivo las ve. Con el panel de Secretos, cada persona guarda **sus** llaves en **su** cuenta y el código las pide con `userdata.get(...)` sin que viajen dentro del archivo.

> *Si la celda dice "❌ Falta un secreto": creá los secretos con esos nombres exactos (sin espacios) y volvé a ejecutar.*

---

## Celda 1 — Extract A: pedir los datos al Banco Mundial 🏦

```python
URL_WB = "https://api.worldbank.org/v2/es/country/all/indicator/SP.POP.TOTL?format=json&per_page=300&mrv=1"
r = requests.get(URL_WB, timeout=30)
r.raise_for_status()
```
**Lenguaje sencillo:** una "API" es un mostrador donde pides datos en vez de una persona. Esta celda hace un solo pedido con tres "secretitos" en la URL:
- `SP.POP.TOTL` = el indicador **población total**
- `mrv=1` = "dame solo el **último año disponible**" (sin esto, devolvería el histórico entero: miles de filas)
- `per_page=300` = "traé todo en una sola página" (los 265 registros caben)
- `/es/` = nombres de países **en español**

`requests.get(...)` = el pedido. `r.raise_for_status()` = "si el pedido falló, gritalo acá y no sigas". Ojo: los errores HTTP devuelven texto que *parece* válido — sin esta línea el error se escondería y estallaría 10 celdas después.

**Resultado:** una lista enorme que se convierte en una tabla (`DataFrame`) llamada `df_wb_raw`. El `.head()` te muestra las primeras filas.

---

## Celda 2 — Transform A: limpieza del Banco Mundial 🧹

**¿Qué hace?** La respuesta del Banco Mundial mezcla países reales con **agrupaciones** ("Ingreso alto", "Latin America & Caribbean", "World"…). Esta celda:

1. Se queda solo con las 4 columnas que interesan y las renombra (`codigo_iso3`, `nombre_pais`, `anio`, `poblacion`).
2. Baja el nombre del país que estaba "doblado" dentro de un dict (`country.value`).
3. **Filtra las trampas**: 78 agregados que vienen con código de región "NA" + 4 filas especiales que llegan **sin código** (`codigo_iso3` vacío, ej. "Ingreso alto"). Quedan los **217 países reales**.
4. Agrega la columna `fuente = 'Banco Mundial'` para saber de dónde salió cada fila al final.

> *Este es el paso más "ingeniería de datos" de todo el ejercicio: los datos crudos casi nunca llegan listos.*

### 🔍 Línea por línea

| Línea | Qué hace en lenguaje sencillo |
|---|---|
| `AGG_CODES = {'AFE','AFR',...}` | Crea una **lista negra** con los 78 códigos de agrupaciones del Banco Mundial (se verificó contra su API de países el día del ensayo). Los `{'...'}` llaves hace un **set**: se consulta súper rápido. |
| `df_wb = df_wb_raw[['countryiso3code','country','date','value']].copy()` | De la tabla cruda (con muchísimas columnas) se quedan **solo 4**. El `.copy()` hace una copia para no pisar la tabla original por accidente. |
| `df_wb.columns = ['codigo_iso3',...]` | Re-etiqueta las 4 columnas con **nombres en español y uniformes** — obligatorio para que luego la fuente A y la B encajen en la misma tabla. |
| `df_wb['nombre_pais'].apply(lambda x: x['value'])` | En el dato crudo, cada país era un dict `{'id': 'ZWG', 'value': 'World'}`. `apply` recorre fila por fila y el `lambda` (función chiquita de una línea) devuelve **solo el texto del nombre**. |
| `df_wb['anio'] = df_wb['anio'].astype(int)` | El año llega como texto (`"2025"` — ¡con comillas!). `astype(int)` lo convierte en número de verdad. |
| `df_wb = df_wb[df_wb['codigo_iso3'] != '']` | **Primera trampa:** descarta filas sin código de país (ej. "Ingreso alto", que llega con el código vacío). |
| `df_wb = df_wb[~df_wb['codigo_iso3'].isin(AGG_CODES)]` | **Segunda trampa:** `isin` devuelve verdadero/falso si el código está en la lista negra; el `~` invierte: "dejá las que NO están". Botá las 78 agrupaciones (World, etc.). |
| `.dropna(subset=['poblacion'])` | Borra filas donde la población es "no existe" (el Banco Mundial las manda como null/celda vacía). |
| `df_wb['fuente'] = 'Banco Mundial'` | Pone en TODAS las filas un mismo valor en la columna nueva `fuente`. Así, luego en NocoDB, se sabe de dónde salió cada dato. |
| `df_wb = df_wb.reset_index(drop=True)` | Al filtrar, las filas quedan con números salteados (0,1,17,25…). `reset_index` les devuelve la numeración 0,1,2,3… limpia; `drop=True` descarta el número viejo. |
| `print(f"Países reales...{len(df_wb)}")` | **Chequeo**: si no salen ~217 países (221 - 4 sin código), el filtro se equivocó. Cuenta filas, acepta regresos. |

---

## Celda 3 — Extract B: REST Countries v5 🏳️

```python
for offset in (0, 100, 200):
    r = requests.get(URL_RC, headers=HEADERS_RC, params={'limit': 100, 'offset': offset}, ...)
```
**Lenguaje sencillo:** REST Countries es como una enciclopedia de países y ahora exige **cuenta y llave** (¿recuerdas la deprecación de las versiones viejas?). Su plan gratuito entrega **máximo 100 países por pedido** (`limit=100`), así que pedimos **tres veces**: "dame 100 desde el 0", "desde el 100", "desde el 200" (`offset` = "empezá el listado desde acá"). El setup recuerda: la respuesta no es una lista suelta sino que viaja dentro de `data.objects` — por eso la sacamos con `r.json()['data']['objects']`.

**Resultado:** lista `paises_rc` con los ~249 países, cada uno con nombre, códigos ISO, capital, región y población.

---

## Celda 4 — Transform B: dar a la fuente B el MISMO formato 🔄

**¿Qué hace?** Cada país de REST Countries tiene una estructura *distinta* a la del Banco Mundial (los campos están en rutas como `names.common` y `codes.alpha_3`, y ¡la capital es una lista! `capitals[0].name`). Esta celda **mapea** cada país a una fila simple con exactamente los mismos cinco campos de la fuente A:

`codigo_iso3` · `nombre_pais` · `anio` · `poblacion` · `fuente='REST Countries'`

> *El "anio" va en 2026 porque la población de REST Countries es "al momento" (se actualiza cada pocas horas), no un dato "del año 2025" como Banco Mundial. Esto explica luego por qué las poblaciones no coinciden al 100%.*

**Resultado:** `df_rc` — una tabla igual de ancha que la del Banco Mundial, lista para apilarse.

### 🔍 Línea por línea

| Línea | Qué hace en lenguaje sencillo |
|---|---|
| `filas_rc = [...] for c in paises_rc` | **List comprehension**: recorre cada país `c` de la lista de REST Countries y, por cada uno, construye un dict con la MISMA forma de fila que la fuente A. Es el paso "traducir". |
| `'codigo_iso3': c['codes']['alpha_3']` | Dentro de cada país, los códigos viven en el bloque `codes`; el de 3 letras es `alpha_3` (`ARG`, `CAN` → la llave ISO3). |
| `'nombre_pais': c['names']['common']` | Toma el nombre cotidiano del país. (Hay otros: `names.official` o el `native` en el idioma propio — pero `common` es el más razonable y estable). |
| `'anio': 2026` | Anota el año de la corrida porque la población de v5 no es "de un año" sino **al momento** (se sincroniza cada pocas horas). |
| `'poblacion': c.get('population')` | `get` es "traé si existe; si no, pone None" — algún país podría no tener el campo, y mejor un valor faltante que un crash. |
| `'fuente': 'REST Countries'` | Marca esta fila con el origen del dato. |
| `df_rc = pd.DataFrame(filas_rc)` | Convierte la lista de dicts en una tabla (DataFrame). |
| `.dropna(subset=['poblacion'])` | Las filas sin población generarían fallas al insertar; mejor excluirlas acá. |
| `print(f"...{len(df_rc)}")` | Chequeo: si hay menos de ~240 países, revisá el paso anterior de la paginación. |

---

## Celda 5 — Ambas fuentes juntas 📊

```python
df_total = pd.concat([df_wb, df_rc], ignore_index=True)
```
**Lenguaje sencillo:** `concat` = "apillar" las dos tablas una arriba de la otra. Ahora todo es una sola mesa de ~434 filas y las dos fuentes son indistinguibles de formato... salvo por la columna `fuente`. El `value_counts()` muestra cuántas filas aporta cada una.

---

## Celda 6 — Load: escribir en NocoDB ⬆️

```python
TAMANO_TANDA = 100
tandas = [filas[i:i+TAMANO_TANDA] for i in range(0, len(filas), TAMANO_TANDA)]
for i, tanda in enumerate(tandas, 1):
    r = requests.post(url, json=tanda, headers=headers, timeout=60)
```
**Lenguaje sencillo:** hasta acá no cambiamos nada en internet. Esta celda **sí escribe**:

1. `headers = {'xc-token': ...}` = "me identifiqué con mi llave de NocoDB".
2. `json=tanda` = manda las filas **como array**. NocoDB las acepta en masa — pero con un tope: **máximo 100 filas por llamada** (ese fue exactamente el error `ERR_MAX_PAYLOAD_LIMIT_EXCEEDED` que vimos en el ensayo 🎓). Entonces cortamos las filas en **tandas de 100** y hacemos un POST por tanda — demora unos segundos más, consume ~6 llamadas de tu cuota mensual de 1.000 y llega todo.
3. Cada tanda reporta su `HTTP 200` y al final aparece `Filas insertadas: X/Y`. Si `X == Y`, tupla completa.

**Abajo del paso:** la tabla `Paises` en app.nocodb.com ya tiene las dos fuentes vivas.

---

## Celda 7 (markdown) — Verificación y discusión 🤔

Ya no es código: son las preguntas para cerrar la clase. Las más jugosas:

- **¿Por qué las poblaciones no coinciden entre fuentes?** Medición distinta, fecha distinta (REST Countries ~"ahora", Banco Mundial ~año 2025), redondeos. **Dos fuentes "de verdad" casi nunca difieren solo por capricho — y explicar esa diferencia es el trabajo real de datos.**
- **¿Qué pasó si ejecutás todo dos veces?** Duplicados: esto se llama *idempotencia* y es un tema eterno de los pipelines (por eso vacía la tabla antes de repetir).
- **¿Cuánta cuota gastamos?** NocoDB ~6 llamadas de 1.000. REST Countries: 3 por persona de 1.000. El banco de datos es barato... cuando sabés lo que pedís (`mrv=1`).

---

## Resumen de cada pieza

| Celda | Paso ETL | Idea de una línea |
|---|---|---|
| 0 | — | Definir llaves y a dónde se escribe |
| 1 | Extract A | 1 pedido al Banco Mundial = 265 registros del último año |
| 2 | Transform A | Renombrar + botar 78 agregados y 4 filas sin código = 217 países |
| 3 | Extract B | 3 pedidos paginados a REST Countries = ~249 países |
| 4 | Transform B | Mapear la fuente B al MISMO esquema de 5 columnas |
| 5 | — | Apilar ambas fuentes (`concat`) |
| 6 | Load | POST en tandas de 100 hacia la tabla NocoDB |
| 7 | — | Discusión: diferencias, duplicados, cuotas |

> **Bonus conceptual:** viste el E-T-L en acción, con llamadas API, manejo de errores HTTP, secretos, paginación, filtros de calidad y límites de payload. Todo eso es "pipeline de datos" con mayúsculas.
