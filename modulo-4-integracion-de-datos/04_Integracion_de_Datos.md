# Bloque 4 — Integración de Datos

**Módulo:** Ingeniería de Datos (IDT 601)
**Sesión:** 6 · **Carga del bloque:** 3 teóricas + 6 prácticas (Plan de Clases) · dictado en una sesión de 3 h

---

## ¿De qué trata este bloque?

Ya sabemos de dónde salen los datos (Bloque 1), cómo llegan a la institución (Bloque 2) y dónde
viven (Bloque 3). Ahora llega la pregunta operativa: **¿cómo reunimos todos esos datos en un
solo lugar confiable y, además, hacemos que el trabajo se ejecute solo?**

La respuesta es la **integración de datos**. Integrar es **reunir datos de fuentes distintas en
un destino común y coherente**, para que cuenten una sola historia. Sin integración, cada sistema
cuenta su parte: los trámites están en un sistema, la recaudación en otro y los reclamos en una
planilla, y nadie tiene la foto completa.

La herramienta clásica para integrar es el **ETL** (extraer, transformar, cargar). A su lado, la
variante **ELT** cambia el orden de las etapas. Y para que el trabajo **no haya que rehacerlo a
mano cada vez**, aparece la **automatización** (que una tarea corra sola) y la **orquestación**
(que varias tareas corran en orden y avisen si algo falla).

**Cómo se reparte en una sesión de 3 horas (180 min):**
- **Sesión 6** — qué es integrar y el proceso ETL/ELT; herramientas de integración; limpieza y
  preparación de datos; automatización y orquestación; cron y Airflow; y un taller de limpieza y
  diseño de un flujo programado, con entrega.

---

## Lectura

### 1. ¿Qué es integrar datos?

Integrar es **reunir datos de fuentes distintas** (bases de datos, planillas, sistemas, archivos,
servicios web) en un **destino común y coherente**. El resultado no es una simple acumulación:
es una fuente única y confiable que se puede cruzar.

**Ejemplo cercano.** En un municipio, los trámites están en un sistema, la recaudación en otro y
los reclamos en una planilla. Integrarlos permite cruzar "qué se recaudó", "qué se tramitó" y "qué
reclamó la gente" en un solo tablero. Sin integrar, cada área mira su parte y **nadie ve el conjunto**.

> Idea para la pizarra: **integrar = juntar los datos para que cuenten una sola historia.**

### 2. El proceso ETL y la diferencia con ELT

El **ETL** (extraer, transformar, cargar) es la herramienta clásica de la integración. Tres etapas,
en orden:

| Etapa | Qué hace | Ejemplo |
|---|---|---|
| **E — Extraer** | Leer y tomar los datos desde la fuente. | Tomar las ventas de todas las sucursales. |
| **T — Transformar** | Limpiar, ordenar y convertir a un formato común. | Unificar fechas y montos, quitar duplicados. |
| **L — Cargar** | Guardar los datos listos en el destino. | Escribir en el almacén para los reportes. |

**Símil:** el ETL es como una **planta de envasado**: se recibe la materia prima (extraer), se la
lava y selecciona (transformar) y se la despacha al depósito (cargar). El producto final son
**datos listos para usar**.

**ETL vs. ELT.** El orden de las letras no es un detalle: cambia **cuándo** y **dónde** se
transforman los datos.

| Aspecto | ETL | ELT |
|---|---|---|
| Orden | Extraer → **Transformar** → Cargar | Extraer → Cargar → **Transformar** |
| Dónde se transforma | Antes de guardar | Después de guardar, dentro del destino |
| Velocidad de carga | Menor | Mayor |
| Flexibilidad | Menor (se transforma una vez) | Mayor (se puede transformar varias veces) |
| Conviene cuando | Destino rígido, datos sensibles o poco volumen | Gran volumen y destino flexible (nube, data lake) |

**No hay uno mejor que otro:** depende del **volumen** y del **destino**. Los dos buscan dejar
datos listos para usar.

### 3. Herramientas de integración

Hay dos grandes familias, y se eligen según el **caso**, el **presupuesto** y el **equipo**:

- **Comerciales** — productos pagados, con interfaz visual (arrastrar y conectar), soporte y
  capacitación. Ejemplos: Informatica, IBM DataStage, Azure Data Factory, AWS Glue. Convienen a
  instituciones con presupuesto y equipos poco técnicos.
- **De código abierto** — libres y gratuitas, mantenidas por una comunidad; dan más control y
  adaptación a cambio de más trabajo técnico. Ejemplos: Apache Airflow, Apache NiFi, Pentaho
  (Kettle), dbt, Talend Open Studio. Convienen con presupuesto limitado.

> Idea para la pizarra: **no existe la herramienta perfecta**; lo importante es entender qué hacen,
> no memorizar nombres.

### 4. Limpieza y preparación de datos

La transformación no es magia: es un conjunto de tareas concretas de **limpieza y preparación**.
Es donde **más tiempo se gasta** en un proyecto real.

- **Corregir errores** — valores imposibles o mal cargados (fechas inválidas, montos negativos).
- **Unificar formatos** — fechas, mayúsculas y tildes ("La Paz" vs. "LA PAZ"), monedas.
- **Eliminar duplicados** — un mismo trámite registrado dos veces.
- **Completar o marcar faltantes** — zonas sin registrar; se marcan (por ejemplo, `SIN ZONA`) en
  lugar de borrar la fila, para **no inflar ni perder** los totales.
- **Combinar tablas** — cruzar el padrón de contribuyentes con la recaudación.
- **Filtrar y seleccionar** — quedarse solo con las columnas y filas relevantes.

> Idea para la pizarra: **datos sucios producen reportes sucios.**

### 5. Automatización y orquestación

- **Automatización** — hacer que **una tarea se ejecute sola**, sin que una persona la dispare cada
  vez. Se apoya en **programar** cuándo debe correr y **avisar** si algo sale mal. Ejemplo: que un
  reporte de recaudación se genere solo, todos los lunes a las 6:00, y llegue por correo.
- **Orquestación** — **coordinar varias tareas** que dependen unas de otras, asegurando el **orden
  correcto**. Maneja **dependencias** (la tarea B espera a la A), **reintentos** y **avisos** ante
  fallas. Ejemplo: descargar → transformar → cargar al almacén → enviar resumen; si un paso falla,
  se avisa y se reintenta.

**Símil:** la orquestación es como un **director de orquesta**: no toca los instrumentos, pero
asegura que cada músico entre a tiempo y en el orden correcto.

**Por qué importa:** reduce **errores** (lo repetitivo a mano falla), ahorra **tiempo** y da
**trazabilidad** (se sabe qué corrió, cuándo y con qué resultado).

### 6. Herramientas de orquestación: cron y Airflow

De lo simple a lo complejo:

- **Cron** — programador de tareas del sistema operativo. Se define una **frecuencia** y un
  **comando**; por ejemplo, `0 6 * * 1` significa "todos los lunes a las 6:00". Conviene para
  tareas **simples y aisladas**.
- **Apache Airflow** — plataforma de **orquestación de flujos**. Los flujos se definen como
  **DAGs** (cada nodo es una tarea; las flechas marcan el orden), con **interfaz web**,
  programación, **reintentos** y **alertas**. Conviene para flujos con varias etapas dependientes
  y con monitoreo.
- Hay puntos intermedios: **programadores de nube** (Azure Scheduler, Cloud Scheduler, EventBridge)
  y otros orquestadores (Dagster, Prefect, Luigi).

| Herramienta | Complejidad | Dependencias | Interfaz visual | Cuándo usarla |
|---|---|---|---|---|
| Cron | Baja | No | No | Tareas simples por horario |
| Programador de nube | Baja | Limitadas | Parcial | Tareas simples en la nube |
| Apache Airflow | Media-alta | Sí | Sí | Flujos complejos con monitoreo |

> Idea para la pizarra: **cron = que corra solo; Airflow = que corra en orden y avise si falla.**

### 7. Diseñar un flujo programado paso a paso

Diseñar el flujo es responder, en orden, **cuatro preguntas** y documentarlas:

1. **Frecuencia** — ¿cada cuánto debe correr? (diario, mensual, cada hora).
2. **Orden y dependencias** — ¿qué tareas hay y cuál espera a cuál?
3. **Si algo falla** — ¿se reintenta? ¿se avisa? ¿se detiene todo o se continúa?
4. **Trazabilidad** — ¿dónde queda registrado qué corrió, cuándo y con qué resultado?

El resultado se dibuja como un **diagrama de tareas y flechas** y se documenta en una tabla:

| Tarea | Qué hace | Depende de | Frecuencia | Si falla |
|---|---|---|---|---|
| Extraer | Toma los datos de las fuentes | — | Diario 6:00 | Reintentar 3 veces; si una fuente falla, avisar |
| Limpiar | Corrige, unifica y deduplica | Extraer | Diario 6:00 | Detener y avisar (no cargar datos sucios) |
| Cargar | Guarda en el almacén | Limpiar | Diario 6:00 | Reintentar y avisar |
| Calcular | Arma los indicadores | Cargar | Mensual | Reintentar |

**Mensaje puente:** *integrar es juntar los datos para que cuenten una sola historia; automatizar
y orquestar es hacer que ese trabajo corra solo, en orden y con aviso si algo falla.*

---

## Ideas clave

- **Integrar** datos es reunirlos desde varias fuentes y dejarlos coherentes, como un todo.
- **ETL** transforma *antes* de cargar; **ELT** carga *primero* y transforma *después*.
- La **limpieza y preparación** ocurre dentro de la transformación: corregir, unificar, deduplicar y marcar faltantes.
- **Automatizar** es que una tarea corra **sola**; **orquestar** es que varias corran **en orden** y avisen si fallan.
- **Cron** sirve para tareas simples por horario; **Airflow** para flujos complejos con dependencias y monitoreo.
- Un flujo programado debe poder **fallar con aviso** y dejar **trazabilidad**.

## Glosario

| Término | Definición |
|---|---|
| Integración de datos | Reunir datos de fuentes distintas en un destino común y coherente. |
| ETL | Extraer → Transformar → Cargar; se transforma antes de guardar. |
| ELT | Extraer → Cargar → Transformar; se guarda primero y se transforma después. |
| Pipeline (flujo) | Secuencia de etapas por las que pasa el dato. |
| Limpieza de datos | Corregir, unificar, deduplicar y marcar faltantes. |
| Automatización | Hacer que una tarea se ejecute sola. |
| Orquestación | Coordinar varias tareas dependientes en el orden correcto. |
| Dependencia | Una tarea que no empieza hasta que termina otra. |
| DAG | Forma de dibujar un flujo: nodos (tareas) y flechas (orden). |
| Trazabilidad | Registro de qué corrió, cuándo y con qué resultado. |
| Cron | Programador de tareas del sistema operativo (frecuencia + comando). |
| Apache Airflow | Plataforma de orquestación de flujos definidos como DAGs. |

## Para repasar (autoevaluación)

1. ¿Qué significa integrar datos y por qué importa para una institución?
2. Explica ETL y ELT, y di cuándo conviene cada uno.
3. Menciona tres tareas de limpieza y explica por qué los faltantes se marcan en lugar de borrarse.
4. ¿Cuál es la diferencia entre automatizar y orquestar? Da un ejemplo de cada uno.
5. ¿Cuándo alcanza con cron y cuándo conviene Airflow?
6. ¿Qué cuatro preguntas respondes al diseñar un flujo programado?

## Referencias recomendadas

- Martin Kleppmann, *Diseño de aplicaciones con uso intensivo en datos* (Marcombo, 2022).
  Procesamiento por lotes y por flujos.
- Ralph Kimball y Margy Ross, *The Data Warehouse Toolkit* (Wiley). Fundamentos de ETL.
- Apache Airflow, documentación oficial (<https://airflow.apache.org/docs/>). DAGs, reintentos y alertas.
- dbt, documentación oficial (<https://docs.getdbt.com/>). ELT y transformación después de cargar.

## Presentaciones del bloque

- Sesión 6 — Integración: ETL, automatización y orquestación: `presentacion_sesion6.html`
