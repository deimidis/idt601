# Taller — Sesión 6: automatizar el pipeline de reclamos

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 4 — Integración de Datos
**Duración:** 65 min de taller (5 de consigna + 50 de trabajo + 10 de puesta en común), dentro de la sesión de 3 horas
**Modalidad:** 100 % en línea (Zoom + salas) · **Modo A** (equipos) o **Modo B** (demostración del docente)
**Herramienta:** hoja de cálculo — **Google Sheets** (recomendado) o **Excel en línea**; el diagrama se dibuja en la misma hoja, en un documento o en una pizarra digital. **Sin instalar nada.**
**Insumo:** `datos/reclamos_crudos.csv` + `datos/DICCIONARIO_reclamos.md` (ver `datos/FUENTE.md`)

---

## Objetivo

Convertir el flujo manual de reclamos en un **trabajo programado y documentado**, en dos pasos:

1. **Limpiar y preparar** una vez los datos (la **T** de transformar), para que queden confiables.
2. **Diseñar el flujo que correrá solo**, definiendo **frecuencia, orden y dependencias, qué pasa si falla y dónde queda la trazabilidad** (automatización y orquestación).

No se escribe código: se **diseña y documenta** el flujo, como el director de orquesta que coordina sin tocar los instrumentos.

## Caso institucional (continuidad con la sesión 5)

> *Una gobernación quiere mejorar la atención al ciudadano. Los reclamos entran por **tres sistemas**
> (ventanilla, teléfono y formulario web), se limpian hoy a mano en Excel y los indicadores se arman
> una vez al mes, a demanda. La Dirección necesita un **reporte mensual confiable** de reclamos
> atendidos y una **alerta temprana** cuando un reclamo crítico (por ejemplo, bacheo) se repite en la
> misma zona.*

Este es el mismo caso de la sesión 5: allí se diseñó **dónde viven los datos**; hoy se define **cómo se
mueven solos y en orden**.

**Variantes por equipo** (todas usan el mismo insumo; cambia el énfasis del flujo):

- **Énfasis A — reporte mensual:** prioriza que los datos estén **limpios y completos** antes de calcular.
- **Énfasis B — alerta temprana:** prioriza la **frescura**; el flujo debe avisar apenas detecta el patrón.
- **Énfasis C — trazabilidad y auditoría:** prioriza **registrar qué corrió, cuándo y con qué resultado**.

## Insumo y preparación previa (el día anterior)

1. Subir a Moodle (o pegar en el chat) estos archivos: `datos/reclamos_crudos.csv` y `datos/DICCIONARIO_reclamos.md`.
2. Pedir a cada participante que **abra una cuenta de Google** o de Excel en línea antes de la clase.
3. Tener preparada una **hoja de demostración** con: la parte 1 resuelta (`crudo` y `limpio`) y el **flujo modelado** (para el Modo B).
4. Tener listo un **tablero/pizarra colaborativa** (Google Sheets compartido, Miro o Jamboard) para pegar los flujos en la puesta en común.

## Reparto del tiempo (65 min, en línea)

| Momento | Tiempo | Quién |
|---|---|---|
| Consigna, conformación de equipos (4 personas) y variante | 5 min | Docente |
| **Parte 1** — Limpiar y preparar los datos (la “T” del ETL) | 20 min | Equipos |
| **Parte 2** — Diseñar el flujo programado (automatizar y orquestar) | 30 min | Equipos |
| Puesta en común y entrega | 10 min | Todos |

> **Ajuste de tiempos sugerido para el docente:** la sesión reserva 40 min a la práctica; este taller
> necesita ~65. Los 25 min extra se recuperan recortando “Herramientas de integración” de 20 a 10 min
> (es el tramo más memorístico y menos accionable) y 5 min del bloque de “Limpieza”. El resto del
> cronograma no cambia.

---

## Parte 1 — Limpiar y preparar los datos (20 min)

**Consigna:** "Importen `reclamos_crudos.csv` y déjenlo limpio y confiable. No se pierde ningún reclamo válido."

### Paso a paso — Google Sheets

1. **Extraer.** `Archivo → Importar → Cargar → reclamos_crudos.csv → Separador: Coma`. Renombrar la
   pestaña como **`crudo`**. Verificar: **24 filas de datos × 7 columnas**.
2. **Duplicar a `limpio`.** Clic derecho sobre la pestaña `crudo → Duplicar` y renombrar la copia como
   **`limpio`**. Así el `crudo` queda intacto como respaldo.
3. **Eliminar duplicados.** En `limpio`, seleccionar todo → `Datos → Quitar duplicados`. Confirmar que
   quedan **22 filas de datos**.
4. **Unificar `canal`, `tipo_reclamo` y `zona`.** Con `Editar → Buscar y reemplazar`, corregir cada
   variante por su valor canónico (ver la tabla de abajo). Usar **“Coincidir con toda la celda”** para no
   romper palabras.
5. **Marcar los faltantes.** Buscar celdas vacías en `zona` y escribir **`SIN ZONA`**. **No borrar la
   fila:** el reclamo existió.
6. **Unificar las fechas.** Seleccionar la columna `fecha` → `Formato → Número → Fecha` (o
   `Formato → Fecha`). La fecha imposible (`2026-13-05`) no se convertirá: **marcarla como error** y
   decidir si se excluye de los totales.
7. **Verificar** con los conteos de la tabla "Resultado esperado".

### Paso a paso — Excel en línea

1. `Datos → Obtener datos → Desde archivo → Desde texto/CSV`; origen **65001: Unicode (UTF-8)**;
   delimitador **Coma** → `Cargar`. Renombrar la hoja como `crudo`.
2. Copiar la hoja (`clic derecho → Moverse o copiar → Crear una copia`) y nombrarla `limpio`.
3. `Datos → Quitar duplicados`.
4. `Inicio → Buscar y seleccionar → Reemplazar` con **“Coincidir con el contenido de toda la celda”**.
5. Formato de fecha: `Inicio → Formato de número → Fecha`.
6. Verificar con las mismas comprobaciones.

### Tabla de limpieza

| Tarea | En el `crudo` aparece… | En el `limpio` debe quedar… |
|---|---|---|
| Duplicados | La fila `REC-0008` y la fila `REC-0010`, cada una **dos veces** | Una sola vez cada una |
| Canal | `ventanilla`, `telefono`, `Telefono`, `formulario web` | `Ventanilla`, `Teléfono`, `Formulario web` |
| Tipo de reclamo | `BACHEO`, `alumbrado`, `Alumbrado ` (con espacio), `residuos` | `Bacheo`, `Alumbrado`, `Residuos` |
| Zona | `centro`, `COTAHUMA`, `Cotahuma`, `Max Paredes`, `M. Paredes`, `periférica`, vacío | Los 5 macrodistritos oficiales, o `SIN ZONA` |
| Fecha | `2026/09/01`, `2026-13-05` | `2026-09-01` (ISO); la imposible queda marcada |
| Descripción vacía | 4 filas sin detalle | Se dejan vacías y se **registra** la falta (no se inventa texto) |

### Resultado esperado (verificación de la Parte 1)

| Comprobación | Esperado |
|---|---|
| Filas crudas | **24** |
| Duplicados exactos eliminados | **2** |
| Filas limpias | **22** |
| Reclamos `SIN ZONA` | **1** |
| Fechas inválidas marcadas | **1** (`2026-13-05`) |
| Descripciones vacías (registradas) | **4** |
| Total por canal | Ventanilla **8** · Teléfono **7** · Formulario web **7** |
| Total por tipo | Bacheo **8** · Alumbrado **7** · Residuos **7** |
| Total por zona | Centro **4** · Cotahuma **5** · Max Paredes **4** · Periférica **4** · Sur **4** · SIN ZONA **1** |
| Total por estado | Abierto **12** · Cerrado **9** · Anulado **1** |

> **Lección clave:** limpiar no es opcional. **Datos sucios producen reportes sucios.** Y limpiar es la
> parte que **más tiempo consume** en un proyecto real: por eso conviene **hacerlo una vez y programarlo**,
> en lugar de repetirlo a mano cada mes.

---

## Parte 2 — Diseñar el flujo programado (30 min)

**Consigna:** "Ya tienen los datos limpios. Ahora conviertan ese trabajo manual en un **flujo que corre solo**. Respondan las cuatro preguntas y dibujen el flujo con sus tareas y flechas."

### Las cuatro preguntas del flujo

1. **Frecuencia:** ¿**cada cuánto** debe correr? (todos los días a las 6:00, semanal, al terminar el mes…)
2. **Orden y dependencias:** ¿qué tareas hay y **en qué orden**? ¿qué tarea **espera** a cuál?
3. **Si algo falla:** ¿se **reintenta**? ¿hasta cuántas veces? ¿se **avisa** a alguien? ¿se detiene todo o se sigue con lo que se pueda?
4. **Trazabilidad:** ¿**dónde queda registrado** qué corrió, cuándo y con qué resultado?

### Tareas base del flujo (se pueden renombrar, unir o separar)

| N.º | Tarea | Qué hace |
|---|---|---|
| T1 | **Extraer** reclamos | Toma los datos de los tres sistemas (ventanilla, teléfono, web). |
| T2 | **Limpiar y preparar** | Unifica canal, tipo y zona; corrige fechas; quita duplicados (lo de la Parte 1). |
| T3 | **Combinar** con el padrón | Cruza el reclamo con la lista oficial de zonas. |
| T4 | **Cargar** al almacén | Guarda los datos limpios en el almacén analítico. |
| T5 | **Calcular indicadores** | Totales del mes por zona, canal y tipo (el reporte). |
| T6 | **Detectar la alerta** | ¿Un reclamo crítico (p. ej. bacheo) se repite en la misma zona? |
| T7 | **Enviar el aviso** | Correo con el resumen y, si corresponde, la alerta. |

### Cómo dibujar el flujo (el “DAG”)

Dibujen cada tarea como una **caja** y unan con **flechas** el orden. Una tarea solo puede empezar
cuando terminaron **todas** las flechas que le llegan. Pueden usar una tabla de tres columnas
(`Tarea → Depende de → Qué pasa si falla`) o un diagrama de cajas y flechas en la misma hoja.

**Ejemplo mínimo (referencia):**

```text
T1 Extraer ─▶ T2 Limpiar ─▶ T3 Combinar ─┬▶ T4 Cargar ─▶ T5 Calcular reporte ─▶ T7 Enviar aviso
                                          └▶ T6 Detectar alerta ────────────────▶ T7 Enviar aviso
```

> Cada variante de énfasis cambia el flujo:
> - **A (reporte mensual):** todo el flujo una vez al mes; la prioridad es que **T2 esté bien hecha**.
> - **B (alerta temprana):** **T1→T2→T3→T6** corre **varias veces al día**; **T5→T7** una vez al mes.
> - **C (auditoría):** añade una tarea de **registro** después de cada paso y guarda el log.

---

## Plantilla de entrega

Completar la plantilla `plantilla-flujo-programado.md` (o copiarla a la hoja). Debe tener:

1. **Diagrama del flujo** (tareas y flechas).
2. **Tabla de tareas:** `Tarea | Qué hace | Depende de | Frecuencia | Si falla (reintento/aviso)`.
3. **Regla de trazabilidad:** dónde se registra cada ejecución y qué se guarda.
4. **Decisión de la fecha inválida:** ¿se excluye del reporte o se corrige con el área? Justificar.

## Modo A — Trabajo de participantes (salas)

**Consigna (pegar en el chat):** "Limpien el archivo (Parte 1) y diseñen el flujo programado (Parte 2).
Entregan el diagrama y la tabla de tareas. Guarden el enlace con permiso de edición."

- Roles del equipo: **coordinador** (cuida el tiempo y el reparto) y **relator** (comparte pantalla).
- Rol del docente: **rotar por las salas cada 4–5 min**, destrabar sobre todo la **unificación de zonas**
  y la **detección de dependencias**. Avisar por el chat el tiempo restante (quedan 10', quedan 5').

## Modo B — Demostración del docente (guion para compartir pantalla, 25–30 min)

Versión totalmente guiada. Los participantes siguen con la vista y anotan.

1. **Encuadre (2 min).** "Vamos a convertir un trabajo manual en un flujo que corre solo. Primero
   limpiamos una vez; después diseñamos quién corre, cuándo y en qué orden."
2. **Extraer y duplicar (2 min).** Importar `reclamos_crudos.csv`, pestaña `crudo`, y duplicar a `limpio`.
3. **Limpiar (8 min).** `Quitar duplicados` (24 → 22). `Buscar y reemplazar` de canal, tipo y zona.
   Marcar `SIN ZONA`. Formato de fecha. **Pausar** y preguntar: *"¿qué pasaría si dejo un bacheo sin
   zona y luego cuento por zona?"*.
4. **Verificar (3 min).** Escribir `=CONTARA(A2:A)` y los `CONTAR.SI` por canal, tipo y zona; contrastar
   con la tabla de resultado esperado.
5. **Diseñar el flujo (8 min).** Dibujar las 7 tareas en pantalla y unirlas con flechas (usar
   `Insertar → Dibujo` o una tabla de dependencias). Leer el diagrama en voz alta como el director de
   orquesta: "T1 entrega a T2; T2 entrega a T3…".
6. **Responder las cuatro preguntas (5 min).** Frecuencia = diario 6:00 (T1–T4) y mensual (T5); orden y
   dependencias; si falla = reintentar 3 veces y avisar; trazabilidad = una fila de registro por corrida.
7. **Cierre (2 min).** Repetir el par de conceptos: **automatizar = que corra solo; orquestar = que corra
   en orden y avise si falla**.

> **Consejo de pantalla:** hacerlo despacio, pensar en voz alta y mantener el diccionario en una ventana
> al costado. Si algo falla, mostrarlo y corregirlo: es parte del aprendizaje.

## Puesta en común (10 min)

El **relator** de cada equipo comparte pantalla (2 min por equipo; con muchos equipos, solo **un equipo
por énfasis A/B/C**). Cuenta:

- **Un problema de limpieza** que encontró y cómo lo resolvió.
- **Su flujo programado**: la tarea más crítica y qué pasa si falla.

El docente contrasta los flujos **A vs. B vs. C** y refuerza las ideas fuerza: *automatizar = que corra
solo; orquestar = que corra en orden y avise; la limpieza va una vez, no cada vez.*

---

## Evaluación y entrega

| Criterio | Evidencia |
|---|---|
| Limpia y prepara los datos | Pestaña `limpio` sin duplicados, con valores y fechas unificados |
| No pierde reclamos válidos | El conteo se mantiene en 22 y hay `SIN ZONA` en lugar de filas borradas |
| Reconoce la frecuencia adecuada | Columna "Frecuencia" justificada en la tabla de tareas |
| Ordena las tareas y sus dependencias | Diagrama con flechas coherentes y columna "Depende de" |
| Define qué pasa si un paso falla | Columna "Si falla" con reintento y/o aviso |
| Define la trazabilidad | Regla de registro de cada ejecución |
| Coherencia con su énfasis | El flujo responde a su variante A/B/C |

**Entrega por equipo:** el **enlace** de la hoja (con permiso de edición) o una exportación CSV, con la
pestaña `limpio`, el **diagrama del flujo** y la **tabla de tareas**. Se cierra **dentro de la sesión**.

## Guía de corrección / rúbrica con niveles

| Nivel | A quién corresponde |
|---|---|
| **Insuficiente** | No limpia o pierde registros; el flujo es una lista de tareas sin orden ni dependencias. |
| **Suficiente** | Limpia la mayoría de los valores; el flujo está ordenado pero no dice qué pasa si falla ni dónde queda la trazabilidad. |
| **Alto** | Limpieza completa y verificada (22 registros, `SIN ZONA`, fecha inválida tratada); flujo con frecuencia, dependencias y manejo de fallas; define la trazabilidad. |
| **Excelente** | Todo lo anterior, más: el flujo es **coherente con su énfasis** (A/B/C), distingue la frecuencia del reporte de la de la alerta, y justifica con datos una decisión (por ejemplo, excluir o corregir la fecha inválida). |

> Escala del módulo (Plan de Clases): 1–59 inicial · 60–69 muy parcial · 70–84 suficiente · 85–94 alto
> porcentaje · 95–100 logro total.

## Problemas frecuentes (y qué hacer)

| Síntoma | Causa | Solución |
|---|---|---|
| Al reemplazar `centro` desaparecen letras de otras palabras | Falta “coincidir con toda la celda” | Activar esa opción y repetir el reemplazo. |
| El conteo baja de 22 | Se borraron filas en vez de marcar faltantes | Recargar del `crudo` y reemplazar **valores**, no filas; usar `SIN ZONA`. |
| Las fechas siguen mezcladas | La columna es texto | Cambiar el formato de la columna a **Fecha** o reimportar como fecha. |
| La fecha imposible “desaparece” | Se “corrigió” inventando una fecha | No inventar: marcarla como error y decidir con el área dueña del dato. |
| El diagrama es una lista suelta | No pensaron dependencias | Preguntar “¿esta tarea puede empezar sin que termine la anterior?” y dibujar la flecha. |
| Todos los equipos dibujan igual | No aplicaron su variante | Recordar el énfasis A/B/C y ajustar frecuencia y tareas. |

## Plan B (si falla la conexión o el acceso)

- **Sin salas:** cada equipo trabaja en un documento o pizarra compartida coordinado por el chat.
- **Sin hoja en línea:** cada equipo completa un CSV local del `limpio` y dibuja el flujo en papel o en el chat.
- **Sin poder importar:** el docente comparte pantalla con el `crudo` ya importado y los equipos completan solo la Parte 2 sobre la hoja de demostración.
- **Sin audio:** la consigna y la puesta en común se hacen por chat y pantalla compartida.

---

## Nota para el docente

- Este taller **reemplaza** la “Práctica: programar una tarea sencilla (40 min)” del plan de la sesión 6,
  que pedía escribir un script y agendarlo con cron/Airflow: inviable en 40 min, en línea y con público
  no especialista.
- Enseña los mismos conceptos centrales (**automatizar = que corra solo; orquestar = que corra en orden y
  con aviso**) **sin exigir programación**, y respeta el patrón no-code de los talleres 1-5.
- **Continuidad:** usa el mismo caso institucional de la sesión 5 y el mismo tipo de fuente (CSV) de los
  talleres 2-3.
- La **solución modelo** (acciones, diagrama resuelto por variante y tabla de tareas de ejemplo) está en
  `guia-solucion-docente-sesion6.md`.
