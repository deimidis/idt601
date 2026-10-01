# Taller — Sesión 3: implementar un pipeline de ingesta (modalidad en línea)

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 2 — Ingesta de Datos
**Duración:** 65 min de taller (dentro de la sesión de 3 horas)
**Herramienta:** hoja de cálculo — **Google Sheets** (recomendado) o **Excel en línea**
**Fuente de datos:** `datos/encuesta_profesores_recorte.csv` (ver `datos/FUENTE.md`)

---

## Objetivo

Construir un **pipeline de ingesta completo** sobre una fuente real de datos abiertos, recorriendo sus
cuatro etapas: **extraer → transformar → cargar → verificar**. El resultado debe poder **volver a
ejecutarse** y producir lo mismo, sin inventar ni perder registros.

## Materiales y preparación previa

1. Subir a Moodle: `datos/encuesta_profesores_recorte.csv`, `datos/diccionario_recorte.md` y esta guía.
2. Tener preparada una **hoja de demostración** con el pipeline resuelto (para el Modo B).
3. Escenarios de caso imprimibles/compartibles: A, B, C, D, E (abajo).
4. Pedir que cada equipo tenga la hoja de cálculo lista y sesión iniciada.

## Reparto del tiempo (65 min, en línea)

| Momento | Tiempo | Quién |
|---|---|---|
| Consigna, escenarios y preguntas de diseño | 10 min | Docente |
| **Modo A** (salas) o **Modo B** (demostración) | 45 min | Participantes / Docente |
| Puesta en común y entrega | 10 min | Todos |

## Escenarios de caso

Cada equipo recibe un escenario y, antes de construir, responde **frecuencia, volumen y fiabilidad** y
elige un **patrón**:

- **A.** Consolidar a diario los datos nuevos de una dependencia.
- **B.** Alimentar un tablero operativo que se debe actualizar en cuanto llega un caso.
- **C.** Sincronizar una vez al mes el padrón completo.
- **D.** Detectar al instante si un caso supera su plazo.
- **E.** Actualizar una vez por semana un inventario que cambia de a poco.

> El pipeline que se construye es **batch**, de **carga completa** (se recarga toda la encuesta). En la
> puesta en común se discute qué cambiaría en cada escenario (A→incremental, B/D→streaming o CDC,
> E→incremental).

---

## El pipeline, etapa por etapa

### 1. Extraer

**Google Sheets:** `Archivo → Importar → Cargar → encuesta_profesores_recorte.csv → Reemplazar hoja de
cálculo → Separador: Coma`.
**Excel:** `Datos → Obtener datos → Desde archivo → Desde texto/CSV → UTF-8, delimitador Coma`.

Renombrar la pestaña como **`crudo`**. Verificar: **871 filas de datos × 17 columnas**.

### 2. Transformar

**a) Renombrar las columnas.** Crear una pestaña nueva **`limpio`** copiando el encabezado y, con el
diccionario (`diccionario_recorte.md`), reemplazar cada código por su pregunta:

| Código | Nuevo encabezado |
|---|---|
| `a0` | Fue parte del proyecto |
| `a1` | Sexo |
| `a2` | Edad |
| `a3` | Departamento |
| `a4` | Ciudad |
| `b2` | Años de experiencia |
| `b3` | Tiempo en la unidad educativa |
| `b4` | Años en la unidad educativa |
| `b8` | Capacitación en TIC |
| `c3` | Número de computadoras |
| `d2` | Celular inteligente |
| `e7` | Tipo de conexión |
| `e8` | Lugar de acceso a internet |
| `g1` | Sistema operativo |
| `g21` | Autocalificación software libre (1–5) |
| `h1` | Conoce licencias libres |
| `h3` | Conoce datos abiertos |

**b) Unificar los "sin dato".** Seleccionar los datos y usar **Buscar y reemplazar** con la opción
**"Coincidir con toda la celda"** (Google Sheets: `Editar → Buscar y reemplazar`; Excel:
`Inicio → Buscar y seleccionar → Reemplazar`):

1. buscar `N/A` → reemplazar por *(vacío)*;
2. buscar `NA` → reemplazar por *(vacío)*.

**c) Ajustar tipos.** Seleccionar las columnas **Edad**, **Años de experiencia**, **Años en la unidad
educativa**, **Número de computadoras** y **Autocalificación** → `Formato → Número`.

### 3. Cargar

Copiar el rango **ya limpio** a la pestaña **`limpio`** (destino). Ese es el "cargar": los datos quedan
en un lugar confiable y con formato uniforme.

### 4. Verificar

En la pestaña `limpio`, agregar estas comprobaciones y compararlas con la **tabla esperada** de abajo:

```text
Filas de datos:            =CONTARA(A2:A)
Fueron parte del proyecto: =CONTAR.SI(A2:A;"Sí")
Departamentos distintos:   =CONTARA(UNICOS(C2:C))
Edad mínima / máxima:      =MIN(D2:D)  /  =MAX(D2:D)
Quedan "NA"/"N/A":         =CONTAR.SI(D2:Q;"NA") + CONTAR.SI(D2:Q;"N/A")
```

**Excel equivalente:** `CONTARA`, `CONTAR.SI`, `MIN`, `MAX`.

> **Lección clave:** la encuesta **no tiene una columna identificadora única** (un ID). Sin ella, no se
> puede comprobar "no duplicar" con certeza. Eso conecta con la idea de **contrato de datos**: una
> fuente confiable necesita una clave y reglas de calidad explícitas.

---

## Modo A — Trabajo de participantes (salas)

**Consigna:** "Construyan el pipeline sobre el archivo asignado. Puede volver a ejecutarse y debe pasar
las verificaciones. Documenten qué hace cada etapa y qué patrón usaron."

Rol del docente: circular por las salas, resolver dudas puntuales y recordar las cuatro etapas.
Intervenir solo si un equipo no avanza; dejar que prueben y se equivoquen.

## Modo B — Demostración del docente (guion para compartir pantalla)

Versión **totalmente guiada**: el docente construye el pipeline en vivo, narrando. Duración sugerida:
**20–25 min**.

1. **Encuadre (2 min).** "Vamos a construir un pipeline completo de punta a punta sobre datos abiertos
   reales. Primero decidimos, después construimos, y al final **verificamos**."
2. **Diseño (3 min).** Escribir en pantalla: frecuencia = batch; volumen = 871 filas (bajo); fiabilidad
   = no perder registros. Patrón = **carga completa**.
3. **Extraer (4 min).** Importar `encuesta_profesores_recorte.csv` y renombrar la pestaña `crudo`.
   Mostrar las 871 filas × 17 columnas.
4. **Transformar (8 min).**
   - Crear la pestaña `limpio` y reemplazar los encabezados por sus etiquetas (usar el diccionario en
     pantalla).
   - `Editar → Buscar y reemplazar`: pasar `N/A` y `NA` a vacío con **"Coincidir con toda la celda"**.
   - Cambiar a formato Número las columnas numéricas.
   - **Pausar** y preguntar: "¿qué pasaría si dejo un `NA` en la columna Edad y luego calculo un
     promedio?".
5. **Cargar (3 min).** Copiar el rango limpio a `limpio`. Explicar por qué separamos crudo y limpio.
6. **Verificar (4 min).** Escribir las fórmulas de conteo y contrastar con la tabla esperada. Mostrar
   que el conteo **no cambió** (871) y que ya **no quedan** `NA`/`N/A`.
7. **Cierre (2 min).** Repetir el esqueleto: extraer → transformar → cargar → verificar. Señalar que el
   pipeline "se puede volver a correr mañana".

> **Consejo de pantalla:** hacerlo despacio, pensar en voz alta y mantener el diccionario en una ventana
> al costado. Si algo falla, mostrarlo y corregirlo: es parte del aprendizaje.

---

## Tabla de verificación esperada

| Verificación | Resultado esperado |
|---|---|
| Filas de datos tras transformar | **871** (no se pierde ninguna) |
| Registros que fueron parte del proyecto (`a0` = Sí) | **848** |
| Departamentos distintos (`a3`) | **9** |
| Edad mínima / máxima (`a2`) | **20 / 78** |
| Celdas con `NA` o `N/A` tras limpiar | **0** |
| Autocalificación (`g21`) | valores **1–5** o vacío |

## Problemas frecuentes (y qué hacer)

| Síntoma | Causa | Solución |
|---|---|---|
| Acentos raros | Codificación | Reimportar con UTF-8 (Excel) / no forzar codificación (Sheets). |
| Al reemplazar `NA` desaparecen letras de otras palabras | Falta "coincidir con toda la celda" | Activar esa opción y repetir. |
| El conteo baja de 871 | Se borraron filas al limpiar | Recargar del `crudo` y reemplazar **valores**, no filas. |
| Las fórmulas no calculan | Celdas de texto | Cambiar las columnas numéricas a formato Número. |

## Evaluación y entrega

| Criterio | Evidencia |
|---|---|
| Funciona de extremo a extremo | Los datos aparecen en la pestaña `limpio` |
| No pierde registros | El conteo se mantiene en 871 |
| Unifica y ajusta los datos | Sin `NA`/`N/A`; columnas numéricas con formato Número |
| Está documentado | Explica qué hace cada etapa y qué patrón usó |

**Entrega:** el enlace o archivo de la hoja con las pestañas `crudo` y `limpio`, las fórmulas de
verificación y una breve descripción (etapas + patrón).
