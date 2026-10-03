# Guía del instructor — Actividad "Pipeline de datos: dos fuentes → una tabla en NocoDB"

> Actividad síncrona para principiantes no-code · Duración sugerida 75 min · Basada en el informe `REPORT.md` (evidencia verificada el 2026-10-02)

## 0. Artefactos listos para compartir

| Archivo | Cómo usarlo |
|---|---|
| `actividad_pipeline_nocodb.ipynb` | Notebook de Colab terminado (lógica WB + RC verificada en vivo: 217 países limpios el día del ensayo). Subilo a tu Drive o abrilo con *File > Import notebook*. |
| `pipeline_nocodb.json` | Workflow de n8n importable (*Import from File*) con las 2 ramas, el Merge Append, el nodo Load NocoDB y un **plan B en HTTP Request (bulk, 1 llamada)** para instancias < 2.26.0. Incluye sticky note con la configuración. |

## 1. Qué van a construir los estudiantes

Un mini-pipeline ETL completo, dos veces (una por vía, mismo resultado):

- **Extract:** dos fuentes públicas con datos de países
  - **Fuente A — Banco Mundial (API v2, sin clave):** población por país del último año disponible
  - **Fuente B — REST Countries (API v5, con clave gratuita):** nombre, capital, región y población por país
- **Transform:** limpiar cada respuesta, reducir columnas, filtrar agregados del Banco Mundial, y dar a ambas fuentes **el mismo formato de fila** (código ISO3 como clave común + columna `fuente`)
- **Load:** escribir ambas en **la misma tabla** `Poblaciones` de NocoDB (cloud, plan gratuito) — quedarán 2 filas por país (una por fuente), lo que permite comparar fuentes en clase

### Esquema de la tabla `Poblaciones` (crearla vos antes de la clase)

| Campo | Tipo NocoDB | Contenido |
|---|---|---|
| `codigo_iso3` | SingleLineText | Clave de unión (ARG, BRA…) |
| `nombre_pais` | SingleLineText | Nombre común |
| `anio` | Number | Año del dato |
| `poblacion` | Number | Población |
| `fuente` | SingleSelect | `Banco Mundial` / `REST Countries` (opcional `capital`, `region` como extension) |

## 2. Preparación previa (día o dos antes — **obligatoria**)

El relevamiento verificó sorpresas que hacen imprescindible un ensayo general:

1. **REST Countries v3.1 (y todas las versiones viejas) ya no existen** — devuelven un error de deprecación. Cualquier tutorial extraído de internet fallará; usá solo el material de este workspace.
1b. **El filtro del Banco Mundial tiene una trampa doble:** además de los 78 agregados con código (region "NA"), hay 4 filas con `countryiso3code` vacío (ej. "Ingreso alto"). El filtro correcto ya está codificado en ambos artefactos y deja **217 países reales**, con nombres en español vía `/v2/es/`. Si los estudiantes arman el filtro a mano, conviene que descubran las dos trampas — es el mejor momento pedagógico de la clase.
2. **REST Countries v5 exige registro:** cada estudiante necesita su cuenta gratuita y una API key (`Authorization: Bearer`). El plan free permite 2 claves y 1.000 requests/mes por cuenta: con ~3 requests por estudiante sobra, **pero cada cuenta la suya** (no una clave compartida).
3. **La demo key de v5 (`rc_live_demo`) solo devuelve 1 registro** — vale para mostrar la forma de la respuesta al proyectar, no para el ejercicio.
4. **NocoDB free: 1.000 registros y 1.000 llamadas API/mes por workspace.** La carga completa (~434 filas) cabe, pero **verificado en ensayo real: el bulk insert acepta como máximo 100 filas por llamada** (`ERR_MAX_PAYLOAD_LIMIT_EXCEEDED`) — el notebook ya envía en tandas de 100 (≈5 llamadas). Para no duplicar filas en re-runs: vacía la tabla antes de repetir.
5. **n8n:** si tu instancia es **≥ 2.26.0 (junio 2026)** el nodo NocoDB llama a la API v3 y ofrece Create/Update/`Create or Update` etc. (la página de docs, desactualizada, menciona solo 5 operaciones). Si es más vieja, las rutas alternativas son el HTTP Request node con "Predefined Credential Type" → NocoDB credential. **Verificá tu versión previo a clase.**
6. **Ensayá el flujo completo con una cuenta descartable** (claves demo, tabla demo, un country subset) para confirmar: formato v5 real (`data.objects`, rutas `names.common`, `codes.alpha_3`), cuántas filas acepta el POST array en un solo call y que tu token `nc_pat_…` tiene Records: Read & write.

## 3. Ruta A — Google Colab (para estudiantes con 0 experiencia)

**Distribución del notebook:** celdas markdown-título entre cada bloque; código corto y comentarios en español; ninguna variable que deban "inventar" más allá de 3 valores pegados (URL, token, tabla).

### Fluido de la sesión

1. **Setup (5 min):** link de solo lectura → cada quien *File > Save a copy in Drive*. En la primera celda se importan libs stdlib (requests, json, pandas).
2. **Colab Secrets (5 min):** cada estudiante crea los secretos `NOCODB_TOKEN` y `RESTCOUNTRIES_KEY` con la pestaña 🔑. En el código: `from google.colab import userdata`.
3. **Extract mundial (10 min):** único request:
   `https://api.worldbank.org/v2/es/country/all/indicator/SP.POP.TOTL?format=json&per_page=300&mrv=1`
   — los 265 registros más recientes en 1 llamada, pandas directamente a DataFrame.
4. **Extract REST Countries (10 min):** 3 requests paginados (`limit=100`, `offset=0/100/200`) con header Bearer; o bucle `while` opcional para los que avancen rápido.
5. **Transform (15 min):** filtrar agregados WB (los registros cuyo `region` no sea de país — columnas `countryiso3code` contra tu lista del paso 4, `rename`, selección de columnas, columna `fuente`. Se sugiere que el docente proyecte el `.head()` de cada DataFrame para que "se vea" la diferencia de forma entre las dos fuentes.
6. **Load (15 min):** `requests.post(url, json=filas, headers={'xc-token': token}, timeout=30)` con `url = f"https://app.nocodb.com/api/v2/tables/{TABLA_ID}/records"` y `filas = df[['codigo_iso3',...]].to_dict('records')`. El POST del array insert bulk — un solo call por fuente.
7. **Verificación (10 min):** abrir la tabla de NocoDB en el navegador; discutir de dónde salieron las filas duplicadas; comparar la población según una u otra fuente.

### Errores a anticipar (mini-glosario del docente)

- `422` de NocoDB: el payload de columnas no coincide con los campos de la tabla (caso típico: `renaming` no aplicado).
- `401` con `xc-token`: token expirado/mal copiado o mal espaciado; 403: token sin permiso de escritura.
- `r.json()` no falla en errores HTTP (500 con JSON decodifica "bien") → siempre `raise_for_status()`.
- Sin `timeout=`, requests puede colgar el kernel en vivo.
- 301/Errores de deprecación al invocar rutas viejas de REST Countries.

## 4. Ruta B — n8n self-hosted (para quienes ya tienen la instancia corriendo)

**Workflow de referencia (nodes en orden):**

```
Manual Trigger
  ├─ HTTP Request "WB Población"       (GET url WB; JSON Response; as single item)
  │      └─ Code "Split & Clean WB"    (array → items; filtrado region; formato fila)
  ├─ HTTP Request "REST Countries"     (GET url v5; header Authorization Bearer; Pagination si quieren)
  │      └─ Code "Split & Clean RC"    (data.objects → items; mapeo nombres)
  └─ Merge (Mode: Append)   ← entra la salida de ambas ramas
         └─ NocoDB → Resource: Row, Operation: Create   (Host=https://app.nocodb.com, token)
```

**Notas de diseño verificadas:**

- **Merge en modo Append** (reescrito en 0.194.0; más de 2 entradas requiere ≥1.49.0) simplemente concatena las salidas — no hace sincronización ni emparejamiento.
- **Los Code nodes son JavaScript** (no Python: Pyodide fue removido en n8n 2.0). El patrón típico es mapear el array a items: `items = $.json...; return responseData.data.objects.map(r => ({json:{codigo_iso3: r.codes.alpha_3, ...}}))`.
- **Expresiones** `{{ $json.campo }}`; típico error: olvidar `{{ }}` o el path dot del slicing.
- **HTTP Request node** autodetecta JSON de respuesta; un body array llega como **1 item** → si o si un Code node (o "Split Out") para convertir en multi-item antes del Create.
- El nodo NocoDB v4 (`Create`) inserta **1 item por llamada API**; con ~500 filas estudiante encender los límites de la cloud (ok en el free por unas 1.000 llamadas/mes, pero en el docente demospase NO). Para demo masiva barata: usar el nodo **HTTP Request con bulk insert array** (1 llamada), guardando el detallito "1 fila por llamada" para explicar la diferencia n8n-node vs REST-direct.
- **Credential NocoDB:** solo Host + API token (se envía como header `xc-token`; placeholder oficial del código fuente = `https://app.nocodb.com`).
- Si el nodo de tu versión no tiene "Create or Update", **no lo enseñes**; enseñá Create + tabla vacía (más simple).

### Timing sugerido con grupo de ~10 estudiantes (75 min)

1. Intro ETL (10) — proyectar API responses crudos en el navegador (headers + JSON) en vez de PowerPoint.
2. n8n branch A: WB (15).
3. Transform: Code node del código WC → items (10).
4. n8n branch B: REST Countries con Header Auth + Split (15).
5. Merge + NocoDB Create + ejecutar (15).
6. Verificación + discusión (10).

## 5. Check-list del día D

- [ ] Tu base/tabla NocoDB creada con los campos del esquema y **vacía**.
- [ ] `baseId` y `tableId` copiados (vía UI o `GET /api/v2/meta/bases/{baseId}/tables/` con tu token).
- [ ] Temp API key propia de REST Countries activa; cuenta de demo en pantalla.
- [ ] Colab notebook compartido (solo lectura) y ensayado end-to-end con tus claves.
- [ ] n8n: versión ≥ 2.26.0 confirmada (o plan B HTTP Request + bulk); credential NocoDB guardada.
- [ ] Plan de respaldo: **Open-Meteo** (sin clave) o CSV de datahub.io si REST Countries se cae; la cuota y lo accesorio son lo que dependerá.
- [ ] Regla de oro remitida a estudiantes: **vaciar antes de re-run** para no quemar los 1.000 registros.

## 6. Extensiones opcionales (para versión avanzada)

- Cambiar el indicador del WB (PIB `NY.GDP.MKTP.CD`, esperanza de vida `SP.DYN.LE00.IN` — esta última con `mrnev=1` por los nulos).
- Usar el endpoint `/v2/es/` para nombres en español.
- Añadir la columna `bandera` con el CDN keyless de REST Countries (`https://flags.restcountries.com/v5/svg/{cc}.svg` → campo de tipo Attachment/URL en NocoDB).
- Upsert en vez de insert con la extensión del `CREATE-OR-UPDATE` endpoint de v3 (arrays de máx. 10 filas: ~25 llamadas) — solo para grupos rápidos.
