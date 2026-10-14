# Rúbrica del Bloque 6 — Inteligencia Artificial (IDT 601)

Rúbrica de evaluación con niveles para las sesiones 8, 9 y 10 y para el **trabajo final integrador**
del módulo. Reemplaza la escala genérica de cinco niveles del Plan de Clases por descriptores
observables, siguiendo el precedente del Bloque 3.

**Escala del módulo** (Plan de Clases): 1–59 logro inicial · 60–69 muy parcial · 70–84 suficiente ·
85–94 alto porcentaje · 95–100 logro total esperado.

| Nivel | Rango | Descripción general |
|---|---|---|
| Insuficiente | 1–59 | No cumple la consigna o lo hace de forma incompleta y sin justificación. |
| Básico | 60–69 | Cumple parcialmente; identifica ideas sueltas pero no las conecta ni justifica. |
| Suficiente | 70–84 | Cumple la consigna con justificación razonable y algún ejemplo pertinente. |
| Alto | 85–94 | Cumple con solidez, justifica con criterio y aporta ejemplos propios de la gestión pública. |
| Excelente | 95–100 | Cumple con solidez, evalúa críticamente, detecta límites y propone mejoras con fundamento. |

---

## Sesión 8 — Historia, redes neuronales y aprendizaje

Dinámica "¿regla, dato o aprendizaje?" + ficha de la dinámica.

| Criterio | Insuficiente (1–59) | Suficiente (70–84) | Excelente (95–100) |
|---|---|---|---|
| **Clasifica el enfoque** (determinista / indeterminista / combinada) | Confunde los enfoques; clasifica al azar. | Clasifica correctamente la mayoría de los casos. | Clasifica con acierto, incluidos los casos combinados, y reconoce los fronterizos. |
| **Justifica la elección** | No justifica o repite el enunciado. | Justifica con la presencia o ausencia de reglas fijas. | Justifica con el problema, los datos disponibles y el costo de cada enfoque. |
| **Explica cómo aprende una red** | Menciona "aprende" sin describir el ciclo. | Describe neuronas, capas y ajuste de pesos. | Explica el ciclo error → ajuste de pesos y por qué se separa un conjunto de prueba. |
| **Distingue los tres tipos de aprendizaje** | Confunde supervisado, no supervisado y refuerzo. | Distingue supervisado (etiquetas) y no supervisado (sin etiquetas). | Distingue los tres y reconoce la señal de aprendizaje de cada uno (etiqueta, estructura, recompensa). |
| **Conecta con la gestión pública** | No da ejemplos o da ejemplos genéricos. | Da un ejemplo pertinente por tipo. | Da ejemplos de su propio contexto y explica por qué ese tipo es el adecuado. |

## Sesión 9 — LLM y prompting

Práctica "prompts para gestión pública": prompt mejorado + observación de verificación.

| Criterio | Insuficiente (1–59) | Suficiente (70–84) | Excelente (95–100) |
|---|---|---|---|
| **Explica qué es un LLM** | Dice "es un chatbot" sin más. | Explica que genera prediciendo la siguiente palabra. | Explica la predicción por probabilidad y qué implican token y ventana de contexto. |
| **Reconoce los límites** | No menciona alucinación, sesgo ni fecha de corte. | Menciona al menos dos límites. | Menciona los tres y sabe a qué se expone cada uno en la gestión pública. |
| **Aplica técnicas de prompting** | Prompt vago, sin claridad ni contexto. | Incluye claridad y contexto. | Incluye claridad, contexto y rol o ejemplos, y el prompt es reutilizable. |
| **Itera y verifica** | No itera ni verifica. | Itera al menos una vez y señala algo a verificar. | Itera, explica qué cambió y **verifica un dato contra la fuente oficial**. |
| **Cuidado de la información** | Pega datos reales de ciudadanos o documentos reservados. | Usa un caso ficticio o público. | Usa caso ficticio o público y **explicita la regla de confidencialidad**. |

## Sesión 10 — Agentes y taller integrador (mini-solución)

Mini-solución documentada: tarea, prompt/flujo, resultado de una prueba, evaluación y mejora.

| Criterio | Insuficiente (1–59) | Suficiente (70–84) | Excelente (95–100) |
|---|---|---|---|
| **Define la tarea** | Tarea vaga o desmedida. | Tarea acotada, con destinatario y resultado esperado. | Tarea acotada y **útil**, con criterio de éxito explícito. |
| **Diseña el flujo** (modelo, herramientas, memoria, planificación) | No identifica los componentes. | Identifica los cuatro componentes. | Identifica los componentes y los justifica según la tarea. |
| **Incorpora supervisión humana** | No prevé control humano. | Menciona revisión humana al final. | Define **puntos de control** y aplica menor privilegio y trazabilidad. |
| **Prueba y evalúa** | No prueba o no evalúa. | Prueba un caso y evalúa con las tres preguntas. | Prueba, detecta alucinación/sesgo y lo documenta. |
| **Mejora y defiende** | No aplica mejoras. | Aplica una mejora y la explica. | Aplica mejoras y justifica la decisión con criterio experto. |
| **Confidencialidad** | Usa datos sensibles. | Usa datos ficticios o públicos. | Usa datos ficticios o públicos y prevé el resguardo de datos de ciudadanos. |

---

## Trabajo final integrador del módulo (evaluación sumativa)

Recorre los conceptos del módulo: ingesta, transformación, orquestación e integración de datos,
limpieza y preparación. A esto se suman los **dos componentes que cierran el arco**:

- **(a) Declaración de licencia del dataset usado** (Bloque 5): qué licencia tiene o qué licencia le
  pondrían, y qué no se publicaría por protección de datos personales.
- **(b) Un prompt o flujo de agente documentado** (Bloque 6): con claridad/contexto, su resultado de
  prueba y su **punto de control humano**.

| Criterio | Insuficiente (1–59) | Suficiente (70–84) | Excelente (95–100) |
|---|---|---|---|
| **Pertinencia del caso** | Caso trivial o mal delimitado. | Caso institucional acotado y relevante. | Caso relevante, acotado y con criterio de éxito claro. |
| **Calidad de la ingesta y transformación** | Datos sin procesar o mal documentados. | Ingesta y transformación documentadas. | Ingesta, limpieza y transformación documentadas y verificables. |
| **Orquestación e integración** | No hay flujo o no está ordenado. | Flujo con tareas y dependencias. | Flujo con dependencias, manejo de fallos y trazabilidad. |
| **Limpieza y preparación** | Pierde filas o inventa datos. | Limpia y marca faltantes. | Limpia, documenta decisiones y marca faltantes con `SIN DATO`. |
| **Licencia del dataset (nuevo)** | No declara licencia. | Declara la licencia y su condición. | Declara licencia, atribución lista y límites por datos personales. |
| **Prompt/flujo de IA (nuevo)** | No incluye componente de IA. | Incluye un prompt con claridad y contexto. | Incluye prompt o flujo, resultado de prueba y punto de control humano. |
| **Documentación y defensa** | Documento incompleto; defensa desordenada. | Documento completo y defensa clara. | Documento sólido, defensa convincente y respuestas a las preguntas. |

**Instrumentos:** participación en debates, clasificación de casos (S8), prompts y su verificación
(S9), diseño y defensa de la mini-solución (S10), y el trabajo final integrador del módulo.
