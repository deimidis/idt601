# Demo docente — Pipeline de ingesta con dos herramientas (Sesión 3)

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 2 — Sesión 3
**Duración de la demo:** ~20–25 min (encaja en el bloque "Del diseño al pipeline", antes o después del taller)
**Fuente de datos:** CSV público de AGETIC en internet (ver más abajo)
**Destino:** una tabla en **NocoDB Cloud** (grilla tipo hoja de cálculo)
**Objetivo:** mostrar el **armado de un pipeline de punta a punta** con dos herramientas distintas
(**Python/Colab** y **n8n**), y que quede claro que *la herramienta cambia, las etapas no*.

---

## El pipeline

Mismo esqueleto de la sesión: **extraer → transformar → cargar → verificar**.

| Etapa | Qué se hace | Herramienta |
|---|---|---|
| **Extraer** | Descargar el CSV de AGETIC desde su URL | `requests` / nodo HTTP Request |
| **Transformar** | Quedarse con 17 columnas, renombrar a etiquetas legibles, unificar `NA`/`N/A` → vacío, castear numéricas | pandas / nodo Code |
| **Cargar** | Insertar en la tabla de NocoDB, patrón **carga completa idempotente** (borra y recarga) | API REST / nodo NocoDB/HTTP |
| **Verificar** | Contar filas y valores y comparar con lo esperado | pandas / nodo Code |

**Fuente (internet).** Encuesta Final-Profesores de Inclusión Digital (AGETIC, 2019, CC-BY):

```
https://datos.gob.bo/dataset/bf97cf5a-a8d3-4694-926c-2a3da3df40e5/resource/119afffe-8e0a-4657-9cea-40fd6837b90c/download/profesores_fin.csv
```

CSV, 189 columnas × 871 filas. Nos quedamos con las 17 columnas del recorte que ya usa el taller.

> **Detalle técnico:** el servidor de AGETIC responde **403** al *User-Agent* por defecto. En el notebook
> se usa `requests` con `User-Agent: Mozilla/5.0`; en n8n, ese encabezado se agrega al nodo de descarga.

## Tabla de verificación esperada

| Verificación | Resultado esperado |
|---|---|
| Filas | **871** |
| Fueron parte del proyecto (`a0` = Sí) | **848** |
| Departamentos distintos (`a3`) | **9** |
| Edad mínima / máxima (`a2`) | **20 / 78** |
| Celdas `NA`/`N/A` tras limpiar | **0** (originalmente 371) |

---

## Setup de NocoDB (una sola vez, ~5 min)

1. Entrá a <https://app.nocodb.com> y creá una cuenta (plan gratis) y una **base**.
2. Creá una **tabla** (podés llamarla `encuesta_profesores`) con estos **17 campos**:

   `Fue parte del proyecto` · `Sexo` · `Edad` · `Departamento` · `Ciudad` ·
   `Años de experiencia` · `Tiempo en la unidad educativa` · `Años en la unidad educativa` ·
   `Capacitación en TIC` · `Número de computadoras` · `Celular inteligente` ·
   `Tipo de conexión` · `Lugar de acceso a internet` · `Sistema operativo` ·
   `Autocalificación software libre (1–5)` · `Conoce licencias libres` · `Conoce datos abiertos`

   > Los nombres deben coincidir **exactamente** (incluidos tildes y espacios): el pipeline escribe por nombre de campo.
   > A las 5 numéricas (`Edad`, `Años de experiencia`, `Años en la unidad educativa`, `Número de computadoras`, `Autocalificación…`) podés darles tipo **Number**.

3. Generá un **API Token**: menú de la cuenta (arriba a la derecha) → **Tokens** → *Create token*.
4. Anotá el **Table ID**: aparece en la URL de la tabla (un valor tipo `tblXXXXXXXXXXXX`).

Tené a mano: **URL** (`https://app.nocodb.com`), **API Token** y **Table ID**.

---

## Demo, Parte 1 — Python / Colab (`pipeline_colab.ipynb`)

Abrí el notebook en <https://colab.research.google.com> (Archivo → Subir notebook) o en Jupyter.

1. **Celda de configuración:** pegá `NOCODB_URL`, `NOCODB_API_TOKEN` y `TABLE_ID`.
2. **Extraer:** corre la descarga y muestra **871 filas × 189 columnas**.
3. **Transformar:** selecciona 17 columnas, renombra, limpia `NA`/`N/A` y castea. Mostrá `limpio.head()`.
4. **Verificar (local):** aparecen los conteos esperados.
5. **Cargar:** `borrar_todo()` + `cargar()` → inserta en lotes de 200.
6. **Verificar (NocoDB):** relee la tabla y confirma los mismos números.
7. **Mostrar la grilla** de NocoDB con las 871 filas cargadas.

> Idea para narrar: "primero decidimos, después construimos, y al final **verificamos**. El patrón es
> **carga completa**: borro y recargo. Si lo corro mañana, obtengo lo mismo, sin duplicados."

## Demo, Parte 2 — n8n (`pipeline_n8n.json`)

En tu instancia de n8n: **Workflows → Import from File →** `pipeline_n8n.json`.

1. Reemplazá el valor `TU_TOKEN` en los **tres nodos HTTP** que lo usan (header `xc-token`), y `TABLE_ID`
   en las URLs (`.../tables/TABLE_ID/records`).
2. Recorré el workflow y nombralo como el pipeline:
   - **Inicio** (disparo manual).
   - **Borrar: leer IDs → Armar IDs → Borrar: eliminar** → la carga completa idempotente.
   - **Descargar CSV → Leer CSV** (nodo *Extract from File*) → el *extraer*.
   - **Transformar** (nodo *Code*) → el *transformar*.
   - **Por lotes → Armar lote → Insertar lote** (bucle en lotes de 200) → el *cargar*.
   - **Verificar: leer → Resumen** → el *verificar*.
3. Ejecutá con **Execute Workflow** y mostrá el resultado del nodo **Resumen**
   (`filas`, `fueron_parte_del_proyecto`, `departamentos`).

> Igual que en Colab: mismo pipeline, armado por **bloques visuales**.

---

## Guion sugerido (20–25 min)

| Min | Momento |
|---|---|
| 0–2 | Encuadre: "vamos a armar un pipeline real, de internet a una base, y lo verificamos" |
| 2–4 | Diseño: frecuencia = batch · volumen = 871 · fiabilidad = no perder ni duplicar · patrón = **carga completa** |
| 4–11 | **Colab:** correr celda por celda; ver 871 filas en NocoDB |
| 11–19 | **n8n:** importar, mostrar los nodos y ejecutar |
| 19–23 | Verificación: **los dos caminos dan el mismo conteo**; mostrar la grilla de NocoDB |
| 23–25 | Cierre: la herramienta cambia, las etapas no; idempotencia; conexión con el taller |

## Problemas frecuentes

| Síntoma | Causa | Solución |
|---|---|---|
| `403 Forbidden` al descargar | El servidor exige *User-Agent* | Usar el encabezado `User-Agent: Mozilla/5.0` (ya está en los artefactos) |
| Error de campo desconocido en NocoDB | El nombre del campo no coincide | Revisar tildes/espacios; el pipeline escribe por nombre exacto |
| `xc-token invalid` | Token mal pegado | Regenerar el token y actualizar en notebook/n8n |
| Se duplican filas | No corrió el borrado | Correr el paso de borrado antes de insertar (idempotencia) |
| n8n da error en el nodo de borrado con tabla vacía | Se envía un body `[]` | Es inocuo; si molesta, activar "Continue on Fail" en ese nodo |

## Marca de calidad (para la pizarra)

La encuesta **no tiene una clave única** (un ID). Igual que en el taller: sin clave, "no duplicar" no se
puede garantizar del todo. Eso conecta con la idea de **contrato de datos**: una fuente confiable necesita
clave y reglas explícitas.

---

## Archivos

| Archivo | Qué es |
|---|---|
| `pipeline_colab.ipynb` | Pipeline completo en Python (Colab/Jupyter) |
| `pipeline_n8n.json` | Workflow de n8n (importable) |
| `Sesion_03_demo_pipeline_herramientas.md` | Esta guía |
| `datos/encuesta_profesores_recorte.csv` | Recorte local (respaldo si falla internet) |
