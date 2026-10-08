# Sesión 5 — Arquitectura: patrones y diseño

**Módulo:** Ingeniería de Datos (IDT 601)
**Bloque:** 3 — Arquitectura de Datos
**Duración:** 3 horas (180 min) — teóricas y prácticas
**Público:** Profesionales no especializados en ingeniería de datos

---

## Objetivos de la sesión

- Reconocer los patrones de arquitectura de datos más usados.
- Explicar las diferencias entre data warehouse, data lake, data lakehouse y lambda.
- Elegir, de forma fundamentada, un patrón para un caso concreto.
- Diseñar una arquitectura de datos paso a paso para un caso institucional.
- Producir y entregar un diseño de arquitectura documentado.

## Ideas clave (qué debe quedar al final)

1. Un **patrón de arquitectura** es una forma típica y probada de organizar los datos para un propósito.
2. El **data warehouse** organiza datos ya procesados y confiables para reportes; el **data lake** guarda datos crudos y diversos; el **data lakehouse** combina ambos; y **lambda** suma un camino por lotes y otro en tiempo real.
3. No hay un patrón "mejor": la elección depende del **caso, el volumen y la necesidad de tiempo real**.
4. Diseñar una arquitectura es seguir un **proceso ordenado**: entender el caso, mapear fuentes, definir componentes, elegir patrón y documentar.
5. El diseño se hace **antes** de pensar en herramientas: primero el plano, después la tecnología.
6. Un buen diseño responde siempre a tres preguntas: **dónde** se guarda, **cómo** se procesa y **quién** lo usa.
7. Documentar el diseño (con catálogo y reglas) es tan importante como dibujar el flujo; el diseño entregado es la **evidencia** de haber integrado el bloque.

## Cronograma sugerido (180 min)

| Bloque | Duración | Qué ocurre |
|---|---|---|
| Apertura y encuadre | 10 min | Bienvenida y repaso breve de la Sesión 4. |
| Patrones de arquitectura | 35 min | Data warehouse, data lake, data lakehouse y lambda. |
| Comparativa de patrones | 10 min | Lado a lado y criterios de elección. |
| Pausa | 10 min | Receso. |
| Diseño paso a paso | 20 min | El proceso de diseño y la plantilla. |
| Taller: diseñar la arquitectura | 60 min | Trabajo en equipos de 4 con la plantilla de diseño. |
| Puesta en común | 25 min | Cada énfasis expone su diseño; contraste de patrones. |
| Cierre y preguntas | 10 min | Síntesis, dudas y puente a la Sesión 6. |

> **Ajuste de tiempos:** "Diseño paso a paso" baja de 30 a 20 min —los cinco pasos ya están en la plantilla del taller, que los vuelve a guiar— y esos 10 min pasan a la puesta en común, que es el tramo con más riesgo de desborde (ver abajo).

> **Trabajo asincrónico asociado** (cuenta para las 20 h del contrato): asignar la lección interactiva `modulo-3-arquitectura-de-datos/lessons/0002-patrones-de-arquitectura.html` **antes** de esta sesión y `lessons/0003-diseno-de-arquitectura.html` **al cierre**. Son 10 ítems de quiz con corrección automática y explicación del "por qué", y dan evidencia de los objetivos que hoy solo se evalúan por participación.

> **Preparación previa (el día antes):** subir a Moodle la guía del taller, la plantilla y la rúbrica; crear la hoja colaborativa con una pestaña por equipo; dejar listos los enlaces para pegar en el chat.

---

## Apertura y encuadre (10 min)

- Recuperar la Sesión 4: *"Ya sabemos qué es una arquitectura y cuáles son sus piezas (almacenamiento, procesamiento, catálogo y gobernanza). Hoy vemos cómo se combinan en patrones probados y cómo se diseña una para un caso concreto."*
- Presentar las dos preguntas que ordenan la sesión: **¿qué patrones de arquitectura existen y cuándo usar cada uno?** y **¿cómo se diseña la arquitectura de un caso institucional?**
- Palabras clave: **patrón, data warehouse, data lake, data lakehouse, lambda, lote, tiempo real, diseño, plantilla**.
- Encuadrar la sesión como el **cierre práctico del Bloque 3**: hoy se elige y se documenta.

> Momento de enganche: preguntar *"¿necesitan sus datos para reportes del mes pasado, para análisis en el momento, o para ambos?"* y anotar las respuestas en la pizarra. Esas respuestas anticipan el criterio de elección de patrón.

---

## Patrones de arquitectura (35 min)

Un **patrón de arquitectura** es una forma típica y probada de organizar los datos para un propósito. No se inventa cada vez: se elige entre soluciones conocidas. Veremos cuatro.

### Data warehouse

- Almacena **datos ya procesados, limpios y estructurados**, listos para reportes y análisis.
- Responde preguntas del tipo *"¿cuánto recaudamos el trimestre pasado por departamento?"*
- Características: **esquema fijo**, alta confiabilidad, optimizado para consultas.

**Ejemplo:** un almacén institucional que consolida la recaudación tributaria mensual, depurada y validada, para reportes de gestión.

**A favor:** datos confiables y consistentes. **En contra:** exige transformar los datos antes de guardarlos; poco flexible para datos nuevos o no estructurados.

### Data lake

- Guarda **datos en su forma cruda y original**, de cualquier tipo y a gran escala.
- Responde a la necesidad de *"guardar todo lo que se genera, aunque aún no sepamos para qué lo usaremos."*
- Características: **esquema al leer** (no se define al guardar), flexible, de bajo costo por volumen.

**Ejemplo:** un repositorio que acumula lecturas de medidores de agua, logs de sistemas y documentos escaneados sin procesar.

**A favor:** flexibilidad y capacidad para datos diversos. **En contra:** sin gobierno puede volverse un "pantano de datos" (data swamp) difícil de aprovechar.

### Data lakehouse

- **Combina** la flexibilidad del lake con la estructura y el gobierno del warehouse.
- Permite guardar datos crudos **y** consultarlos con esquema, sobre un mismo repositorio.
- Responde a instituciones que quieren **analizar sin perder el dato original**.

**Ejemplo:** una institución que guarda datos crudos de trámites, les aplica esquema y gobierno, y sobre ellos genera reportes confiables.

**A favor:** un solo lugar para datos crudos y analíticos. **En contra:** requiere más herramientas y madurez de gobierno.

### Arquitectura lambda

- Combina **dos caminos**:
  1. **Capa batch (lotes):** procesa la historia completa, con precisión, cada cierto tiempo.
  2. **Capa de velocidad (tiempo real):** procesa lo que acaba de llegar, con menor precisión pero de inmediato.
- Responde a la necesidad de **reportes confiables + alertas inmediatas**.

**Ejemplo:** un sistema de tránsito que consolida los reportes históricos cada noche (batch) y al mismo tiempo alerta en tiempo real sobre un congestionamiento.

**A favor:** cubre ambos mundos. **En contra:** dos lógicas que mantener y a veces duplicar; mayor complejidad.

---

## Comparativa de patrones (10 min)

| Patrón | Qué guarda | Foco principal | Tiempo real | Riesgo o costo |
|---|---|---|---|---|
| Data warehouse | Datos procesados y limpios | Reportes confiables | No | Poco flexible ante datos nuevos. |
| Data lake | Datos crudos y diversos | Guardar todo | No | Sin gobierno se vuelve un pantano de datos. |
| Data lakehouse | Crudo + esquema y gobierno | Analizar ambos mundos | Parcial | Exige más herramientas y madurez. |
| Lambda | Batch + velocidad | Reportes y alertas | Sí | Dos lógicas que mantener; mayor complejidad. |

**Idea para la pizarra:** *"No hay un patrón mejor; hay un patrón adecuado para cada caso."* Los criterios de decisión son el **caso**, el **volumen**, la **estructura del dato** y la **necesidad de tiempo real**.

---

## Pausa (10 min)

---

## Diseño paso a paso (20 min)

Presentar el diseño como una secuencia de pasos, con un ejemplo breve.

### Paso 1 — Entender el caso
- ¿Qué necesita la institución? ¿Qué preguntas debe responder con datos?
- **Ejemplo:** *"reportar mensualmente el avance de los trámites de licencias."*

### Paso 2 — Mapear las fuentes
- ¿De dónde salen los datos? ¿Qué tipo son? (retomar la Sesión 1.)
- **Ejemplo:** sistema de trámites (tablas), formularios web (JSON), documentos escaneados.

### Paso 3 — Definir los componentes
- Almacenamiento, procesamiento, catálogo y gobernanza (retomar la Sesión 4).
- **Ejemplo:** base operacional + data warehouse + proceso nocturno + diccionario de datos + política de acceso.

### Paso 4 — Elegir el patrón
- Según el caso: warehouse, lake, lakehouse o lambda (retomar el bloque anterior).
- **Ejemplo:** data warehouse para reportes mensuales confiables.

### Paso 5 — Documentar
- Dibujar el flujo, nombrar cada componente y registrar las reglas de gobernanza.

**Plantilla de diseño (para el taller):**

| Sección | Qué completar |
|---|---|
| Caso y objetivo | Qué necesita la institución y qué pregunta responde |
| Fuentes de datos | De dónde salen los datos y su tipo |
| Componentes | Almacenamiento, procesamiento, catálogo, gobernanza |
| Patrón elegido | Cuál y por qué |
| Diagrama de flujo | Esquema desde la fuente hasta el uso |
| Reglas de gobernanza | Quién accede, calidad y seguridad |

**Idea para la pizarra:** *"El plano no es la casa."* Hoy dibujamos el plano; la tecnología vendrá después.

---

## Taller: diseñar la arquitectura (60 min + 25 de puesta en común)

**Objetivo:** producir el diseño de arquitectura completo y documentado para el caso asignado.

**Caso institucional (único para todos, o variantes por equipo):**
*"Una gobernación quiere mejorar la atención al ciudadano. Hoy los reclamos se registran en tres sistemas (ventanilla, teléfono y formulario web), las inspecciones se anotan en papel y los indicadores se arman a mano en Excel. Se necesita un reporte mensual confiable de reclamos atendidos y una alerta inmediata cuando un reclamo crítico se repite en la misma zona."*

> Variante sugerida: asignar a cada equipo un énfasis (reportes mensuales, alerta inmediata o análisis histórico) para comparar elecciones de patrón.

**Fuentes del caso (insumo para el Paso 2):** entregar junto con el caso esta tabla, para que el mapeo de fuentes se haga sobre datos y no de memoria.

| Fuente | Qué registra | Tipo de dato | Formato |
|---|---|---|---|
| Sistema de ventanilla | Reclamos presenciales, con número de expediente | Estructurado | Tablas de base de datos |
| Sistema telefónico | Reclamos y consultas por llamada | Estructurado | Tablas de base de datos |
| Formulario web | Reclamos con texto libre del ciudadano | Semiestructurado | JSON |
| Inspecciones en papel | Actas de inspección con observaciones manuscritas | No estructurado | Documentos escaneados |
| Planilla de indicadores | Indicadores armados a mano por el área | Estructurado | Excel |

**Pasos del trabajo en equipos:**
1. Leer el caso y definir el objetivo (Paso 1).
2. Listar las fuentes de datos y su tipo (Paso 2).
3. Definir los cuatro componentes (Paso 3).
4. Elegir y justificar el patrón (Paso 4).
5. Dibujar el diagrama de flujo y completar la plantilla (Paso 5).

**Rol del docente:** circular entre los equipos, resolver dudas y recordar las tres preguntas (dónde, cómo, quién). Detectar bloqueos típicos:
- Confundir almacenamiento con procesamiento.
- Elegir patrón sin justificarlo en el caso.
- Olvidar catálogo y gobernanza (capas transversales).

**Entregable por equipo:** el diagrama + la plantilla completa + la justificación del patrón.

**Organización de los equipos:** equipos de **4 personas**, con un coordinador y un relator.

**Evaluación del taller:** se aplica la **rúbrica de 5 criterios con 3 anclajes** (caso y fuentes · componentes · patrón elegido · diagrama y gobernanza · coherencia interna) que está en la guía del taller y en `modulo-3-arquitectura-de-datos/REPASO_DOCENTE_BLOQUE3.md` §8.2. Compartirla con los equipos al dar la consigna, no al final.

---

## Puesta en común (25 min)

- **Reparto del tiempo:** con 25 min, expone **un equipo por énfasis** (A reportes · B alerta · C histórico), 3–4 min cada uno ≈ 12 min; quedan ~13 min para preguntas y contraste. Si hay más equipos, usar *lightning talks* de 2 min o *gallery walk* (todos publican el diagrama en el tablero compartido y se comenta en plenario).
- Cada equipo expone su diseño en 3–4 minutos: diagrama, componentes y patrón elegido.
- El docente y los demás equipos plantean preguntas: *¿por qué ese patrón? ¿cómo garantizan la calidad? ¿quién accede?*
- Registrar las distintas elecciones de patrón en la pizarra para contrastar.

**Guía de corrección:** valorar la coherencia entre el caso, las fuentes, los componentes y el patrón, y la presencia de catálogo y gobernanza en el diseño. Aplicar la **rúbrica de 3 anclajes** incluida en la guía del taller.

**Criterios de evaluación:** entrega del diseño completo, coherencia interna y justificación fundamentada.

---

## Cierre y preguntas (10 min)

- Síntesis con el grupo: releer la tabla comparativa de patrones y la secuencia de diseño.
- Reforzar la idea central: *"No hay un patrón mejor; hay un patrón adecuado para cada caso, y el diseño se documenta."*
- Anticipar la próxima sesión: *"La próxima vez integramos los datos: ETL/ELT, automatización y orquestación de flujos."*
- Espacio de preguntas y dudas.

---

## Recursos

- Presentación (láminas de cada patrón, tabla comparativa y proceso de diseño).
- Guía del taller (caso institucional + insumo de fuentes + plantilla de diseño + **rúbrica**).
- **Hoja colaborativa en línea con una pestaña por equipo** (Google Sheets o Docs) para la plantilla, y Google Drawings o Miro para el diagrama. En modalidad virtual esta es la vía por defecto; las plantillas impresas quedan como respaldo.
- Pizarra o pizarra digital para comparar patrones lado a lado.
- Lecciones interactivas `lessons/0002` (trabajo previo) y `lessons/0003` (cierre) para el trabajo asincrónico.

## Evaluación de la sesión

| Criterio | Evidencia |
|---|---|
| Describe cada patrón y sus diferencias | Participación en los bloques teóricos |
| Relaciona el patrón con el tipo de necesidad | Aportes en el enganche y en cada patrón |
| Elige un patrón para un caso dado | Respuestas en la práctica grupal |
| Fundamenta la elección y descarta alternativas | Justificación en la puesta en común |
| Sigue el proceso de diseño paso a paso | Avance del trabajo en equipos |
| Identifica fuentes, componentes y patrón | Plantilla de diseño completada |
| Incluye catálogo y gobernanza | Diagrama y ficha de componentes |
| Entrega un diseño completo y coherente | Entrega final del diseño de arquitectura |
| Reconoce los patrones y el proceso de diseño | Resultado de las lecciones `0002` (previo) y `0003` (cierre) |

**Calificación del entregable:** se aplica la rúbrica de 5 criterios con 3 anclajes (guía del taller y `REPASO_DOCENTE_BLOQUE3.md` §8.2).

**Entrega:** diseño de arquitectura del caso trabajado (diagrama de flujo + plantilla completa + justificación del patrón elegido).
