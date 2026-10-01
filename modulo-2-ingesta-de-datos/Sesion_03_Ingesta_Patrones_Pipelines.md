# Sesión 3 — Ingesta: patrones de diseño e implementación de pipelines

**Módulo:** Ingeniería de Datos (IDT 601)
**Bloque:** 2 — Ingesta de Datos
**Duración:** 3 horas (180 min) — teóricas y prácticas
**Público:** Profesionales no especializados en ingeniería de datos

---

## Objetivos de la sesión

- Identificar las **decisiones de diseño** clave al plantear una ingesta: frecuencia, volumen y fiabilidad.
- Reconocer los **patrones de ingesta** más comunes y elegir el que mejor encaja con un escenario real.
- Implementar un **pipeline de ingesta** completo aplicando las etapas extraer → transformar → cargar → verificar.
- Entregar un pipeline **funcional, reproducible y documentado** como evidencia del bloque.

## Ideas clave (qué debe quedar al final)

1. Antes de ingerir hay que responder tres preguntas: **¿cada cuánto?** (frecuencia), **¿cuánto?** (volumen) y **¿qué pasa si falla?** (fiabilidad).
2. Un **patrón de ingesta** es una solución probada y reutilizable para un problema recurrente; no hay que inventar de cero.
3. Los patrones más usados son: **carga completa**, **carga incremental**, **captura de cambios (CDC)** y **carga a pedido (pull)** vs. **envío de eventos (push)**.
4. La fiabilidad (idempotencia, reintentos, no duplicar) es lo que distingue una ingesta robusta de una que falla en silencio.
5. Todo pipeline se construye con el mismo esqueleto: **extraer → transformar → cargar**, más una etapa de **verificación**.
6. Un pipeline funcional no es perfecto a la primera: se valida, se corrige y se **documenta** para que otro pueda reproducirlo.

## Cronograma sugerido (180 min)

| Bloque | Duración | Qué ocurre |
|---|---|---|
| Apertura y encuadre | 10 min | Bienvenida, síntesis del bloque y preguntas de la sesión. |
| Consideraciones de diseño | 30 min | Frecuencia, volumen y fiabilidad. |
| Patrones de ingesta | 30 min | Carga completa, incremental, CDC y pull vs. push. |
| Pausa | 10 min | Receso. |
| Del diseño al pipeline | 25 min | El esqueleto: extraer → transformar → cargar → verificar. |
| Taller: implementar el pipeline | 65 min | Trabajo guiado por parejas o equipos. |
| Cierre, puesta en común y preguntas | 10 min | Entrega, demostración y puente a la próxima sesión. |

---

## Apertura y encuadre (10 min)

- Ubicar la sesión dentro del **Bloque 2 — Ingesta de Datos**: ya conocemos qué es ingerir, con qué métodos y herramientas; hoy respondemos **qué decidir antes** y **cómo construirlo de punta a punta**.
- Conectar con una idea simple: *"Conectar una fuente una vez es fácil. Lo difícil es que funcione todos los días, sin duplicar y sin perderse datos."*
- Presentar las tres preguntas que ordenan la sesión: **¿qué considerar antes de ingerir?**, **¿qué patrón reutilizable me sirve?** y **¿cómo armo el pipeline?**
- Palabras clave que se usarán todo el día: **frecuencia, volumen, fiabilidad, patrón, idempotencia, CDC, pipeline, verificación**.

> Momento de enganche: preguntar *"¿qué pasaría si el informe de mañana duplica datos, o si se pierden los trámites de hoy?"* y anotar 4 o 5 respuestas en la pizarra. Esas respuestas ilustran la importancia de la fiabilidad y se retoman en el taller.

---

## Consideraciones de diseño (30 min)

Explicar que antes de elegir herramienta o método, hay que responder tres preguntas que condicionan todo el diseño:

### Frecuencia — ¿cada cuánto?

- Determina el **método** (batch vs. streaming) y la periodicidad.
- Preguntas guía: ¿el dato cambia cada minuto o cada trimestre? ¿cuán frescos deben estar los informes?
- **Ejemplo:** la nómina se procesa una vez al mes; los reclamos, idealmente varias veces al día.

### Volumen — ¿cuánto?

- Determina el **esfuerzo** y la técnica para no saturar el sistema.
- Preguntas guía: ¿son decenas de registros o millones? ¿el volumen es estable o crece?
- **Ejemplo:** consolidar 500 registros mensuales es trivial; ingerir lecturas de miles de medidores cada hora exige otro diseño.

### Fiabilidad — ¿qué pasa si falla?

- Determina las **garantías** que debe tener la ingesta.
- Preguntas guía: ¿qué ocurre si se corta la conexión a mitad de carga? ¿se puede repetir sin duplicar? ¿sabemos si algo no llegó?
- **Concepto clave — idempotencia:** repetir una carga no debe producir datos duplicados ni corrompidos.
- **Ejemplo:** si la carga nocturna falla y se reintenta, el informe no debe contar dos veces la misma recaudación.

**Idea para la pizarra:**

| Pregunta | Decisión que condiciona |
|---|---|
| ¿Cada cuánto? (frecuencia) | Método y periodicidad |
| ¿Cuánto? (volumen) | Técnica y capacidad |
| ¿Qué pasa si falla? (fiabilidad) | Reintentos, idempotencia, monitoreo |

---

## Patrones de ingesta (30 min)

Explicar que un **patrón** es una forma probada y reutilizable de resolver un problema recurrente. Presentar los más comunes:

### Carga completa (full load)

- Se mueve **todo el conjunto de datos**, cada vez, reemplazando lo anterior.
- **Cuándo:** volúmenes pequeños o datos que cambian por completo.
- **Ejemplo:** un catálogo de códigos de trámites que se vuelve a cargar entero cada mes.

### Carga incremental

- Se mueve **solo lo nuevo o lo modificado** desde la última carga.
- **Cuándo:** volúmenes grandes que crecen con el tiempo.
- **Ejemplo:** cada día se agregan solo los trámites nuevos del día, no toda la historia.

### Captura de cambios (CDC — Change Data Capture)

- La **propia fuente** registra y entrega solo los cambios (altas, bajas, modificaciones).
- **Cuándo:** se necesita saber exactamente qué cambió, casi en tiempo real.
- **Ejemplo:** una base de datos del registro civil que emite eventos cada vez que se actualiza un dato.

### Carga a pedido (pull) vs. envío de eventos (push)

- **Pull:** nuestro sistema **va a buscar** los datos cuando los necesita.
- **Push:** la fuente **nos envía** los datos cuando hay novedades.
- **Ejemplo pull:** un script que consulta una API cada noche. **Ejemplo push:** una API que notifica cuando entra un reclamo.

### Tabla comparativa

| Patrón | Idea central | Cuándo usarlo |
|---|---|---|
| Carga completa | Mover todo y reemplazar | Datos pequeños o que cambian por completo |
| Carga incremental | Mover solo lo nuevo | Volúmenes grandes y crecientes |
| CDC | La fuente entrega solo los cambios | Necesidad de cambios exactos y a tiempo |
| Pull | Nosotros buscamos los datos | Control de horario, fuentes que no notifican |
| Push | La fuente envía los datos | Frescura alta, alertas |

**Mensaje puente:** *"Elegir el patrón correcto evita rehacer el trabajo y previene duplicados. Ahora veremos cómo se lleva todo esto a un pipeline."*

---

## Pausa (10 min)

---

## Del diseño al pipeline (25 min)

Explicar que un **pipeline de ingesta** es la secuencia repetible que lleva los datos desde la fuente hasta el destino. Presentar el esqueleto en cuatro etapas:

### 1. Extraer

- Definir **la fuente** y **cómo acceder**: un archivo (CSV, Excel), una base de datos, una API.
- Escribir el paso que **lee** los datos.
- **Ejemplo:** leer un CSV con la recaudación diaria.

### 2. Transformar

- Aplicar las correcciones mínimas para que los datos sean útiles: renombrar columnas, limpiar espacios, convertir formatos, eliminar nulos.
- La transformación no tiene que ser exhaustiva: lo justo para el destino.
- **Ejemplo:** convertir los montos a número, normalizar fechas, quitar filas vacías.

### 3. Cargar

- Definir **el destino** y **cómo escribir**: una base central, un archivo consolidado, una tabla.
- Aplicar el **patrón** elegido (completa, incremental o CDC) según el caso.
- **Ejemplo:** insertar los registros en una tabla de recaudación, sin duplicar.

### 4. Verificar

- Confirmar que **llegó lo que debía llegar**: número de registros, ausencia de duplicados, valores sensatos.
- Es la etapa que vuelve el pipeline **confiable**.
- **Ejemplo:** comparar el conteo de filas de entrada y de salida; revisar que no haya montos negativos.

**Idea para la pizarra:**

```
Fuente ──extraer──► (transformar) ──cargar──► Destino
                        ▲
                   ───verificar───
```

**Mensaje clave:** *"Un pipeline funcional es el que se puede volver a correr mañana y produce lo mismo, sin duplicados ni pérdidas."*

---

## Taller: implementar el pipeline (65 min)

**Objetivo:** construir y entregar un pipeline de ingesta funcional, aplicando el diseño y el patrón elegidos.

**Preparación previa:**
- Guía de laboratorio con el paso a paso.
- Entorno de trabajo listo (editor o plataforma simple).
- Fuente de datos de muestra (CSV) y destino definido.

**Pasos del taller:**
1. Formar parejas o equipos de 2–3 personas.
2. Leer la guía y la fuente de datos asignada.
3. Responder las tres preguntas de diseño (**frecuencia, volumen, fiabilidad**) y elegir un **patrón**.
4. Implementar por etapas: **extraer** → **transformar** → **cargar** → **verificar**.
5. Probar el pipeline completo y corregir lo que falle.
6. Documentar brevemente: qué hace cada etapa y qué patrón se usó.
7. Demostrar el pipeline al grupo.

**Escenarios sugeridos (para ambientar el taller):**
- **A.** Consolidar diariamente los trámites nuevos de una alcaldía en su base central.
- **B.** Alimentar un tablero en vivo de reclamos ciudadanos.
- **C.** Sincronizar cada mes el padrón de contribuyentes completo.
- **D.** Detectar al instante si un trámite supera su plazo legal.
- **E.** Actualizar un inventario de bienes que cambia de a poco, una vez por semana.

**Rol del docente:** circular, resolver dudas puntuales y recordar las cuatro etapas. Detenerse solo cuando un equipo no puede avanzar; dejar que prueben y se equivoquen.

**Guía de corrección:** valorar que el pipeline **funcione de extremo a extremo** (los datos aparecen en el destino), que **no duplique** registros y que esté **documentado**.

**Criterios de evaluación:** entrega de un pipeline de ingesta funcional y demostración de su ejecución.

---

## Cierre y preguntas (10 min)

- Cada equipo demuestra su pipeline en pocos minutos: fuente, etapas y resultado.
- Retroalimentación breve: qué funcionó, qué fue lo más difícil y qué harían distinto.
- Síntesis con el grupo: releer la tabla comparativa de patrones y reforzar la idea central: *"Antes de ingerir, responde frecuencia, volumen y fiabilidad; luego elige el patrón y construye el pipeline de forma repetible."*
- Anticipar la próxima sesión: *"Con la ingesta resuelta, el siguiente paso es ordenar todo el recorrido del dato: la arquitectura de datos, sus conceptos y sus componentes."*
- Espacio de preguntas y dudas.

---

## Recursos

- Presentación (láminas con consideraciones, tabla de patrones y el esqueleto del pipeline).
- Pizarra o pizarra digital para el esquema de las tres preguntas y de las cuatro etapas.
- Escenarios de caso impresos para la práctica y la ambientación del taller.
- Plantilla de análisis (frecuencia / volumen / fiabilidad / patrón).
- Guía de laboratorio con el paso a paso de implementación (`taller_sesion3_pipeline_online.md`).
- Entorno de trabajo (editor o plataforma simple) preparado.
- Fuente de datos de muestra (CSV) y destino definido: `datos/encuesta_profesores_recorte.csv` (AGETIC, CC-BY).

## Evaluación de la sesión

| Criterio | Evidencia |
|---|---|
| Identifica frecuencia, volumen y fiabilidad | Análisis del escenario y del taller |
| Reconoce los patrones de ingesta | Participación en el bloque de patrones |
| Selecciona y justifica un patrón adecuado | Propuesta del equipo en la práctica |
| Aplica las cuatro etapas del pipeline | Estructura del pipeline entregado |
| Logra una ingesta funcional de extremo a extremo | Datos visibles en el destino |
| Evita duplicados y pérdidas | Verificación (conteos, idempotencia) |
| Documenta y explica el pipeline | Demostración y puesta en común |

**Entrega:** pipeline de ingesta funcional (fuente, etapas, patrón usado y verificación), más una breve documentación de su ejecución.
