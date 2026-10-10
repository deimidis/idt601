# Sesión 6 — Integración: ETL, automatización y orquestación

**Módulo:** Ingeniería de Datos (IDT 601)
**Bloque:** 4 — Integración de Datos
**Duración:** 3 horas (180 min) — teóricas y prácticas
**Público:** Profesionales no especializados en ingeniería de datos

---

## Objetivos de la sesión

- Comprender qué es integrar datos y qué es un sistema ETL/ELT.
- Diferenciar ETL de ELT y saber cuándo conviene cada uno.
- Reconocer herramientas de integración, comerciales y de código abierto.
- Entender qué es la automatización y la orquestación de flujos de datos.
- Conocer herramientas como cron y Apache Airflow.
- Programar y ejecutar una tarea de procesamiento sencilla.

## Ideas clave (qué debe quedar al final)

1. Integrar datos es **reunirlos desde varias fuentes** y dejarlos listos para usarse como un todo coherente.
2. **ETL** significa Extraer, Transformar, Cargar: se transforma *antes* de guardar.
3. **ELT** significa Extraer, Cargar, Transformar: se guarda *primero* y se transforma *después*.
4. La **limpieza y preparación** ocurre dentro de la transformación: corregir, unificar y combinar.
5. **Automatizar** es hacer que una tarea corra **sola**; **orquestar** es coordinar varias tareas en orden.
6. **Cron** sirve para tareas simples por horario; **Airflow** para flujos complejos con dependencias y monitoreo.
7. Un flujo programado debe poder **fallar con aviso**: si algo sale mal, hay que saberlo.
8. Hay herramientas **comerciales** (interfaz gráfica y soporte) y **de código abierto** (flexibles, sin licencia); se eligen según el caso.

## Cronograma sugerido (180 min)

| Bloque | Duración | Qué ocurre |
|---|---|---|
| Apertura y encuadre | 10 min | Bienvenida, puente desde el Bloque 3 y preguntas de la sesión. |
| Integración de datos y el proceso ETL | 20 min | Qué es integrar y qué hace cada etapa: extraer, transformar, cargar. |
| Diferencia entre ETL y ELT | 15 min | Cuándo transformar antes y cuándo después. |
| Herramientas de integración | 10 min | Comerciales y de código abierto, con ejemplos. |
| Pausa | 10 min | Receso. |
| Limpieza y preparación de datos | 10 min | Lo que ocurre dentro de la transformación. |
| Automatización y orquestación | 15 min | Qué son, por qué importan y cómo se diferencian. |
| Herramientas de orquestación: cron y Airflow | 15 min | De lo simple a lo complejo. |
| Taller: automatizar el pipeline de reclamos | 65 min | Limpiar los datos y diseñar el flujo programado (automatización y orquestación). |
| Cierre y preguntas | 10 min | Síntesis, dudas y puente a la próxima sesión. |

---

## Apertura y encuadre (10 min)

- Retomar el Bloque 3: ya diseñamos la **arquitectura** donde viven los datos.
- Pregunta disparadora: *"Los datos están repartidos en muchos sistemas. ¿Cómo los juntamos para que cuenten una sola historia y, además, corran solos?"*
- Presentar las preguntas que ordenan la sesión: **¿qué es ETL/ELT?**, **¿con qué herramientas integramos?** y **¿cómo hacemos que corra solo, en orden y a tiempo?**
- Palabras clave de la sesión: **integración, ETL, ELT, extraer, transformar, cargar, limpieza, automatización, orquestación, programar, cron, DAG**.

> Momento de enganche: preguntar *"¿cuántos sistemas distintos de su institución necesitarían juntarse para armar un solo informe?"* y *"¿qué tarea repetitiva harían que se ejecute sola?"* Anotar 4 o 5 ejemplos en la pizarra; se retoman en el taller final.

---

## Integración de datos y el proceso ETL (20 min)

Definir la integración de datos y presentar el proceso ETL como su herramienta clásica.

### ¿Qué es integrar datos?

- Es **reunir datos de fuentes distintas** (bases de datos, planillas, sistemas, archivos) en un **destino común y coherente**.
- Sin integración, cada sistema cuenta su parte y nadie tiene la foto completa.
- **Ejemplo cercano:** en un municipio, los trámites están en un sistema, la recaudación en otro y los reclamos en una planilla. Integrarlos permite cruzar "qué se recaudó", "qué se tramitó" y "qué reclamó la gente" en un solo tablero.

### El proceso ETL

1. **E — Extraer (extract).**
   - Es **leer y tomar los datos** desde la fuente original.
   - Fuentes típicas: bases de datos, planillas, archivos planos, servicios web (APIs).
   - **Ejemplo:** cada noche, tomar las ventas de todas las sucursales de una entidad recaudadora.
2. **T — Transformar (transform).**
   - Es **limpiar, ordenar y convertir** los datos a un formato común.
   - Incluye: corregir errores, unificar formatos de fecha, normalizar nombres, eliminar duplicados, combinar tablas.
   - **Ejemplo:** pasar todas las fechas a un mismo formato, unificar "La Paz" y "LA PAZ", convertir montos a una misma moneda.
3. **L — Cargar (load).**
   - Es **escribir los datos ya transformados** en el destino final.
   - Destinos típicos: un almacén de datos (data warehouse), una base analítica o un archivo consolidado.
   - **Ejemplo:** guardar los datos limpios en el almacén para que alimenten reportes y tableros.

**Idea para la pizarra:**
- ETL = **tomar → arreglar → guardar**.
- El producto final son **datos listos para usar**.

**Símil para el grupo:** ETL es como una **planta de envasado**: se recibe la materia prima (extraer), se la lava, selecciona y envasa (transformar) y se la despacha al depósito (cargar).

---

## Diferencia entre ETL y ELT (15 min)

Explicar que el orden de las letras no es un detalle: cambia **cuándo** y **dónde** se transforman los datos.

- **ETL — transformar antes de cargar.** Los datos se transforman en un espacio intermedio y luego se guardan ya limpios. Ventaja: el destino queda ordenado desde el inicio. Costo: requiere una máquina intermedia y puede demorar con grandes volúmenes.
- **ELT — cargar primero, transformar después.** Los datos se guardan tal cual llegan (en crudo) y se transforman después, dentro del destino. Ventaja: carga rápida y flexible. Requisito: el destino debe procesar grandes volúmenes (data lake o plataforma en la nube).

### Tabla comparativa

| Aspecto | ETL | ELT |
|---|---|---|
| Orden | Extraer → Transformar → Cargar | Extraer → Cargar → Transformar |
| Dónde se transforma | Antes de guardar | Después de guardar |
| Velocidad de carga | Menor | Mayor |
| Flexibilidad | Menor (transformo una vez) | Mayor (puedo transformar varias veces) |
| Conviene cuando | Destino rígido, datos sensibles o poco volumen | Gran volumen, destino flexible (nube, data lake) |

**Mensaje puente:** *"No es que uno sea mejor que otro: depende de cuántos datos haya y de dónde se guarden. Los dos comparten el objetivo de dejar datos listos para usar."*

**Ejemplo boliviano para contrastar:**
- **ETL:** pasar las planillas de varios hospitales a un formato común antes de subirlas al sistema central de salud.
- **ELT:** volcar primero los registros crudos de todas las cajas de recaudación a un lago de datos y, recién después, calcular los totales por municipio.

---

## Herramientas de integración (10 min)

Presentar el panorama de herramientas, separando dos grandes familias.

### Herramientas comerciales

- Son **productos pagados** con interfaces visuales (arrastrar y conectar), soporte técnico y capacitación.
- No suelen exigir programar: se diseñan los flujos con **diagramas visuales**.
- **Ejemplos:** Informatica PowerCenter, IBM DataStage, Talend (en su versión de pago), Azure Data Factory, AWS Glue, Google Data Fusion.
- **Cuándo convienen:** instituciones con presupuesto, equipos poco técnicos y necesidad de soporte formal.

### Herramientas de código abierto

- Son **libres y gratuitas**, mantenidas por una comunidad; se instalan y se adaptan al caso.
- Suelen exigir **más trabajo técnico** (configuración, a veces código), pero no hay costo de licencia.
- **Ejemplos:** Apache Airflow, Apache NiFi, Talend Open Studio, Pentaho Data Integration (Kettle), dbt.
- **Cuándo convienen:** presupuesto limitado, equipos con algo de perfil técnico y ganas de control total.

| Familia | Costo | Perfil | Ejemplos |
|---|---|---|---|
| **Comerciales** | Licencia pagada | Interfaz visual, soporte | Informatica, DataStage, Azure Data Factory, AWS Glue |
| **Código abierto** | Gratuitas | Más trabajo técnico | Airflow, NiFi, Pentaho (Kettle), dbt, Talend Open Studio |

**Mensaje clave:** *"No existe la herramienta perfecta: se elige según el caso, el presupuesto y el equipo. Lo importante es entender qué hacen, no memorizar nombres."*

---

## Pausa (10 min)

---

## Limpieza y preparación de datos (10 min)

La transformación del ETL no es magia: es un conjunto de tareas concretas de **limpieza y preparación**. Es donde más tiempo se gasta en un proyecto real.

- **Corregir errores** — valores imposibles o mal cargados (fechas inválidas, montos negativos, edades de 200 años).
- **Unificar formatos** — fechas (DD/MM/AAAA vs. AAAA-MM-DD), mayúsculas y tildes ("La Paz" vs. "LA PAZ"), monedas.
- **Eliminar duplicados** — un mismo trámite registrado dos veces por error de carga.
- **Completar o marcar faltantes** — zonas sin registrar en los reclamos; decidir si se completan o se excluyen.
- **Combinar tablas** — cruzar el padrón de contribuyentes con la recaudación por número de documento.
- **Filtrar y seleccionar** — quedarse solo con las columnas y filas relevantes para el informe.

> **Ejemplo de gestión pública:** antes de armar el reporte mensual de reclamos, se unifican las zonas ("Macrodistrito Centro" y "centro"), se descartan reclamos duplicados y se marca como "sin zona" los que no la registran, para no inflar totales.

**Idea para la pizarra:** limpiar no es opcional: **datos sucios producen reportes sucios**.

---

## Automatización y orquestación (15 min)

Definir ambos conceptos y su relación, con ejemplos de la gestión pública.

### Automatización

- Es hacer que **una tarea se ejecute sola**, sin que una persona la dispare cada vez.
- Se apoya en **programar** (agendar) cuándo debe correr y en **avisar** si algo sale mal.
- **Ejemplo:** que un reporte de recaudación se genere solo, todos los lunes a las 6:00, y llegue por correo a quien lo necesita.

### Orquestación

- Es **coordinar varias tareas** que dependen unas de otras, asegurando el **orden correcto**.
- Incluye manejar **dependencias** (la tarea B espera a la A), **reintentos** y **avisos** ante fallas.
- **Ejemplo:** primero se descargan los datos de las sucursales, luego se transforman, después se cargan al almacén y, solo si todo salió bien, se envía el resumen. Si falla un paso, se avisa y se reintenta.

### Por qué importa

- Reduce **errores** (las tareas manuales repetitivas fallan).
- Ahorra **tiempo** (la gente deja de hacer lo repetitivo).
- Da **trazabilidad** (se sabe qué corrió, cuándo y con qué resultado).

**Idea para la pizarra:**
- Automatizar = **que corra solo**.
- Orquestar = **que corra en orden y coordinado**.

**Símil para el grupo:** la orquestación es como un **director de orquesta**: no toca los instrumentos, pero asegura que cada músico entre a tiempo y en el orden correcto.

---

## Herramientas de orquestación: cron y Airflow (15 min)

Presentar las herramientas más usadas, de lo simple a lo complejo.

### Cron (y programadores del sistema)

- Es un **programador de tareas** propio del sistema operativo, muy simple.
- Se define una **frecuencia** (diario, semanal, cada hora) y un **comando** a ejecutar.
- **Ejemplo:** `0 6 * * 1` significa "todos los lunes a las 6:00, ejecuta el script del reporte".
- **Cuándo conviene:** tareas simples y aisladas, sin dependencias complejas entre sí.

```text
0 6 * * 1   →   todos los lunes a las 6:00
```

### Apache Airflow

- Es una **plataforma de orquestación de flujos de trabajo**, muy usada en ingeniería de datos.
- Los flujos se definen como **DAGs** (grafos dirigidos acíclicos): cada nodo es una tarea y las flechas marcan el orden.
- Ofrece **interfaz web** para ver el estado, **programación**, **reintentos** y **alertas**.
- **Cuándo conviene:** flujos con varias etapas que dependen unas de otras y requieren monitoreo.

### Otras herramientas similares

- **Programadores de nube:** Azure Scheduler, Google Cloud Scheduler, AWS EventBridge (similares a cron, en la nube).
- **Orquestadores:** Dagster, Prefect, Luigi (alternativas a Airflow).

| Herramienta | Complejidad | Dependencias entre tareas | Interfaz visual | Cuándo usarla |
|---|---|---|---|---|
| Cron | Baja | No | No | Tareas simples por horario |
| Programador de nube | Baja | Limitadas | Parcial | Tareas simples en la nube |
| Apache Airflow | Media-alta | Sí | Sí | Flujos complejos con monitoreo |

**Mensaje puente:** *"Empieza simple: para una tarea suelta, cron alcanza. Para un flujo con varias etapas que deben fallar con aviso, Airflow es la herramienta. Ahora vamos a diseñar el flujo que corre solo y en orden."*

---

## Taller: automatizar el pipeline de reclamos (65 min)

**Objetivo:** convertir el trabajo manual de integración de reclamos en un **flujo programado y documentado**, sin escribir código.

El taller completo —consigna, paso a paso, plantilla de entrega, rúbrica, Modo A/B, problemas frecuentes y Plan B— está en `modulo-4-integracion-de-datos/taller_sesion6_automatizar_pipeline.md`, con sus insumos en `modulo-4-integracion-de-datos/datos/`.

**Encuadre para el grupo:** ya sabemos integrar y limpiar datos. Ahora definimos **quién corre, cuándo y en qué orden**. Integrar es juntar los datos; **automatizar** es que corra solo; **orquestar** es que corra en orden y avise si falla.

**Insumo:** `datos/reclamos_crudos.csv` (24 filas con duplicados, zonas inconsistentes, fechas mezcladas y faltantes) + `datos/DICCIONARIO_reclamos.md`.

**Dos partes:**
1. **Limpiar y preparar (20 min).** Unificar `canal`, `tipo_reclamo` y `zona`; eliminar duplicados; marcar `SIN ZONA`; unificar las fechas. Es la "T" del ETL, hecha de verdad sobre un caso cercano.
2. **Diseñar el flujo programado (30 min).** Responder las cuatro preguntas —**frecuencia**, **orden y dependencias**, **qué pasa si falla** y **dónde queda la trazabilidad**— y dibujar el flujo (cada tarea es una caja; cada flecha, una dependencia).

**Variantes por equipo:** A reporte mensual · B alerta temprana · C trazabilidad y auditoría.

**Entregable (cerrado en la sesión):** el **diagrama del flujo** + la **tabla de tareas** (`Tarea | Qué hace | Depende de | Frecuencia | Si falla`) + la **regla de trazabilidad**, junto con el enlace de la hoja `limpio`.

> **Por qué no se programa.** El público no es especialista y la sesión es en línea: el taller enseña los conceptos centrales (automatizar y orquestar) con una herramienta gratuita y sin instalar nada, como en los talleres anteriores. La variante técnica (n8n/NocoDB) queda como demostración opcional del docente.

**Rol del docente:** circular por las salas destrabando la unificación de zonas y la detección de dependencias. Con grupos de poca base o conexiones inestables, usar el **Modo B** (demostración guionada) incluido en la guía del taller.

**Criterios de evaluación:** limpia sin perder reclamos válidos; ordena las tareas y sus dependencias; define qué pasa si un paso falla y dónde queda la trazabilidad; el flujo es coherente con su variante (A/B/C).

---

## Cierre y preguntas (10 min)

- Síntesis con el grupo: releer la tabla ETL vs ELT y la comparación entre cron y Airflow.
- Volver sobre el flujo del taller: cada equipo nombra **su tarea más crítica** y **qué pasa si falla**.
- Reforzar la idea central: *"Integrar es juntar los datos para que cuenten una sola historia; automatizar y orquestar es hacer que ese trabajo corra solo, en orden y con aviso si algo falla."*
- Anticipar la próxima sesión: *"La próxima vez veremos licencias de datos y datos abiertos: qué se puede usar, cómo se comparte y bajo qué condiciones."*
- Espacio de preguntas y dudas.

---

## Recursos

- Presentación (láminas de ETL/ELT, herramientas, limpieza, automatización y orquestación).
- Pizarra o pizarra digital para el esquema de las tres etapas y del flujo de tareas.
- Taller e insumos en `modulo-4-integracion-de-datos/`: guía del taller, solución del docente, plantilla de entrega, `datos/reclamos_crudos.csv` y `datos/DICCIONARIO_reclamos.md`.
- Hoja de cálculo en línea (Google Sheets o Excel en línea), sin instalar nada.
- Hoja de demostración preparada por el docente (limpieza resuelta + flujo modelado) para el Modo B.

## Evaluación de la sesión

| Criterio | Evidencia |
|---|---|
| Explica el proceso ETL/ELT con sus etapas | Participación en los bloques teóricos |
| Diferencia ETL de ELT y justifica cuándo usar cada uno | Aportes en la tabla comparativa |
| Reconoce herramientas comerciales y de código abierto | Respuestas en el bloque de herramientas |
| Limpia y prepara datos reales | Pestaña `limpio` sin duplicados, con valores y fechas unificados |
| Distingue automatización de orquestación | Participación en el bloque teórico |
| Reconoce las herramientas (cron, Airflow y similares) | Respuestas en la tabla comparativa |
| Diseña un flujo programado con frecuencia y dependencias | Diagrama y tabla de tareas del taller |
| Define qué pasa si un paso falla y dónde queda la trazabilidad | Columnas "Si falla" y sección de trazabilidad del taller |

**Entrega:** el diagrama del flujo programado + la tabla de tareas (frecuencia, dependencias, manejo de fallas) + la regla de trazabilidad, con el enlace de la hoja `limpio`. Se cierra dentro de la sesión.
