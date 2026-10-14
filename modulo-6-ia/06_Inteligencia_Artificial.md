# Bloque 6 — Inteligencia Artificial: historia, redes, LLMs y agentes

**Módulo:** Ingeniería de Datos (IDT 601)
**Bloque:** 6 — Historia y Desarrollo de la Inteligencia Artificial
**Sesiones:** 8, 9 y 10
**Horas:** 14 teóricas + 4 prácticas

---

## ¿De qué trata este bloque?

Este bloque cierra el módulo mirando hacia adelante: la **inteligencia artificial**. Recorremos su
historia, entendemos sus dos grandes enfoques (determinista e indeterminista), vemos cómo aprenden
las redes neuronales —y por qué a veces fallan al salir de la demo— y llegamos a la IA actual: los
**modelos de lenguaje (LLM)** que usamos en chats, y los **agentes** que automatizan tareas.

El objetivo no es programar, sino **entender las ideas** y saber **trabajar con estas herramientas**
de forma crítica y útil en la gestión pública. En todo el bloque rige una regla de cuidado: **no
subir datos de ciudadanos, documentos reservados ni información no pública a un chat externo**.

---

## Lectura

### 1. Historia: de las reglas fijas al aprendizaje

La IA no es un solo método. A lo largo de su historia conviven dos filosofías:

- **Determinista** — el sistema sigue **reglas fijas** escritas por un humano. Ante la misma entrada,
  siempre da la misma salida. Es predecible y explicable. *Ejemplo:* un semáforo programado, un
  sistema que valida campos de un formulario.
- **Indeterminista** — el sistema **aprende patrones de los datos**. No hay reglas escritas a mano;
  la salida es probabilística y a veces no es del todo explicable. *Ejemplo:* un sistema de
  recomendación, un filtro de spam.

Cinco momentos que resumen el recorrido:

| Momento | Aportación |
|---|---|
| 1950s — La pregunta | Turing: ¿puede una máquina comportarse como un humano? |
| 1960–70s — Las reglas | Sistemas expertos: conocimiento codificado en reglas "si… entonces". |
| 1980–90s — El aprendizaje | Codificar todas las reglas es imposible → dar ejemplos. |
| 2000s — Datos y cómputo | Internet produce datos masivos y hay potencia de cálculo. |
| Hoy — IA generativa | No solo clasifica: genera texto, imágenes y código. |

La regla práctica: si las reglas son claras y estables → determinista; si hay muchos datos y
patrones difíciles de codificar → indeterminista. No hay uno "mejor": depende del problema. Y a veces
conviene **combinar** ambos (un filtro de correo mezcla reglas del remitente con aprendizaje del contenido).

### 2. Redes neuronales: cómo aprenden y por qué fallan

Una **red neuronal** es un modelo inspirado en el cerebro: neuronas organizadas en **capas**,
conectadas por **pesos** (números que indican cuánto importa cada conexión). **Aprender es ajustar
esos pesos** a partir de ejemplos.

El ciclo de entrenamiento:

1. Se presentan **ejemplos**.
2. La red produce una **salida**.
3. Se compara con la respuesta esperada y se calcula el **error** (función de pérdida).
4. Se **ajustan los pesos** para reducir ese error.
5. Se repite muchas veces (cada pasada completa es una **época**).

**Por qué a veces "funciona en la demo y falla en producción".** Si medimos el desempeño con los
mismos datos con que el modelo aprendió, siempre parecerá bueno. Por eso se separa:

- **Entrenamiento:** los ejemplos con los que el modelo aprende.
- **Validación:** un grupo aparte para ajustar decisiones durante el desarrollo.
- **Prueba:** un grupo que el modelo nunca vio, para medir cómo funcionará con **casos nuevos**.

Cuando el modelo **memoriza** los ejemplos de entrenamiento en vez de captar el patrón, tenemos
**sobreajuste**: acierta en lo conocido y falla en lo nuevo. Para detectarlo se usan **métricas**:

- **Exactitud:** proporción de aciertos sobre el total.
- **Precisión:** de los casos que el modelo marcó como positivos, cuántos lo eran de verdad.

Una exactitud alta con precisión baja (o al revés) obliga a preguntar *para qué* se usará el modelo:
no es lo mismo filtrar unos pocos casos dudosos que decidir sobre un trámite.

### 3. Tipos de aprendizaje

Según cómo aprende, se distinguen tres tipos:

- **Supervisado** — aprende de **datos etiquetados** (ejemplos con su respuesta correcta). Cubre la
  **clasificación** (asignar una categoría) y la **regresión** (predecir un número). Ej.: clasificar
  trámites como "urgente" o "no urgente"; predecir la demanda de un servicio.
- **No supervisado** — descubre **patrones y agrupaciones** sin etiquetas. Ej.: segmentar
  contribuyentes por comportamiento; detectar trámites que se salen del patrón.
- **Por refuerzo** — aprende por **ensayo, error y recompensa**, actuando en un entorno. Ej.:
  optimizar semáforos o rutas de recolección.

| Tipo | Qué datos necesita | Qué aprende | Señal de aprendizaje |
|---|---|---|---|
| Supervisado | Etiquetados | Predecir etiqueta o valor | Respuesta correcta |
| No supervisado | Sin etiquetas | Agrupar y hallar patrones | Estructura de los datos |
| Por refuerzo | Interacción con el entorno | Decidir acciones | Recompensa / penalización |

### 4. LLMs y modelos generativos

Un **modelo de lenguaje de gran escala (LLM)** es una red neuronal entrenada sobre enormes volúmenes
de texto. Su tarea central es **predecir la siguiente palabra**: por eso la misma pregunta puede
dar respuestas distintas cada vez.

**Cuidado con una confusión frecuente.** Durante el preentrenamiento, cuando el modelo yerra, **no
se "refuerza"**: se comparan sus pesos con la palabra que realmente seguía y se **corrigen** para
reducir el error (el mismo ciclo de la red neuronal, a escala gigante). El **refuerzo** con
recompensas es otra cosa: es el aprendizaje por refuerzo del punto 3.

**Conceptos operativos que explican el comportamiento real:**

- **Token:** la unidad en que el modelo parte el texto (palabra, parte de palabra o signo).
- **Ventana de contexto:** el máximo de texto que el modelo puede tener en cuenta; más allá, olvida.
- **Temperatura:** cuánto se arriesga a elegir opciones menos probables; baja = predecible, alta = variada.
- **Embedding (vector):** la representación numérica del significado de un texto, que permite
  comparar y **buscar por parecido** (es la base de la recuperación de información).

Los **modelos generativos** no solo clasifican: **generan** texto, imágenes, código, audio y video
(algunos son **multimodales**). Tienen tres límites que conviene tener siempre presentes:

| Límite | Qué es | Riesgo en la gestión pública |
|---|---|---|
| Alucinación | Inventa información verosímil pero falsa | Cifras, normas o referencias incorrectas |
| Sesgo | Repite prejuicios del entrenamiento | Trato desigual, lenguaje estereotipado |
| Fecha de corte | No conoce lo posterior a su entrenamiento | Normativa o datos desactualizados |

Por eso, **verificar lo que producen** es parte del trabajo, no un paso opcional.

### 5. Trabajo con LLMs: chats y prompting

Trabajar con un LLM en formato de **chat** es una habilidad práctica. La clave está en el **prompt**:
la instrucción que le damos. Técnicas básicas:

- **Claridad** — pedir exactamente lo que se necesita (qué, formato, extensión, tono).
- **Contexto** — dar la información necesaria: para quién y para qué.
- **Ejemplos** (few-shot) — mostrar el formato o estilo esperado.
- **Rol** — indicar cómo debe comportarse ("actuá como un analista de transparencia…").

Y siempre **iterar** (pedir → revisar → re-pedir) y **verificar** (no creer todo sin revisar).

> **Regla de confidencialidad.** Antes de pegar cualquier cosa en un chat público: ¿son datos de
> ciudadanos, documentos reservados o información no pública? Si lo son, **no se pega**. Se trabaja
> con ejemplos ficticios, con datos ya públicos o con documentos abiertos. En el Estado, la
> responsabilidad es del funcionario, no de la herramienta.

### 6. Agentes de IA

Un **agente de IA** va un paso más allá del chat: combina un LLM con **herramientas** para
**realizar tareas** con cierta autonomía. Sus componentes:

- **Modelo** — el LLM que razona.
- **Herramientas** — lo que puede hacer (buscar, leer, calcular, consultar, enviar).
- **Memoria** — lo que recuerda de la conversación o de la tarea.
- **Planificación** — descomponer una tarea en pasos y ordenarlos.

Usos típicos: **asistentes** que responden sobre documentos internos (**RAG**, recuperación
aumentada: busca en las fuentes y responde **citando**), y **automatización** de tareas repetitivas.

Como **actúa**, un agente **amplifica** los límites del LLM: un error no es solo una frase, puede ser
una acción. De ahí las salvaguardas:

- **Supervisión humana (human-in-the-loop):** revisar y aprobar las acciones críticas.
- **Principio de menor privilegio:** dejar que lea, pero no que envíe o publique; que sugiera, no que decida.
- **Auditoría y trazabilidad:** registrar qué hizo y con qué fuentes.

**La regla de oro:** *el agente sugiere, el humano decide.*

---

## Ideas clave

- La IA tiene dos enfoques: **determinista** (reglas) e **indeterminista** (aprende de datos).
- Una red neuronal aprende **ajustando pesos** para reducir el **error**; hay aprendizaje **supervisado, no supervisado y por refuerzo**.
- Medir con los mismos datos del entrenamiento engaña: por eso existen **prueba/validación**, el **sobreajuste** y las **métricas**.
- Un **LLM** genera texto prediciendo la siguiente palabra; puede **alucinar** y su conocimiento tiene **fecha de corte**.
- Trabajar con chats es cuestión de **buenos prompts** (claridad, contexto, ejemplos, rol) y **verificación**.
- Un **agente** combina LLM + herramientas + memoria + planificación; exige **supervisión humana**.
- En el sector público, **no se suben datos sensibles a un chat externo**.

## Glosario

| Término | Definición |
|---|---|
| Determinista | Sistema que sigue reglas fijas y es predecible. |
| Indeterminista | Sistema que aprende patrones de los datos (probabilístico). |
| Red neuronal | Modelo de neuronas conectadas por pesos que se ajustan al aprender. |
| Sobreajuste | Memorizar el entrenamiento y fallar con casos nuevos. |
| LLM | Modelo de lenguaje de gran escala que genera texto. |
| Token | Fragmento de texto que el modelo usa como unidad. |
| Prompt | Instrucción que se da a un modelo de lenguaje. |
| Alucinación | Contenido inventado por un LLM con apariencia de verdad. |
| Agente de IA | Sistema que combina un LLM con herramientas para realizar tareas. |
| Supervisión humana | Persona que revisa y aprueba las acciones críticas del agente. |

El glosario completo del bloque está en `GLOSSARY.md`.

## Para repasar (autoevaluación)

1. ¿Cuál es la diferencia entre un enfoque determinista y uno indeterminista?
2. Nombra los tres tipos de aprendizaje y un ejemplo de cada uno.
3. ¿Qué es el sobreajuste y por qué se separa un conjunto de prueba?
4. ¿Qué es una alucinación de un LLM y por qué importa verificarla?
5. Menciona tres técnicas para escribir un buen prompt.
6. ¿Qué componentes tiene un agente de IA y qué significa "el agente sugiere, el humano decide"?
7. ¿Qué no se debe subir nunca a un chat público?

## Referencias recomendadas

- Stuart Russell y Peter Norvig, *Inteligencia artificial: un enfoque moderno* (Pearson). Texto de referencia general.
- Joel Grus, *Ciencia de datos desde cero* (Anaya). Aprendizaje supervisado y no supervisado, sobreajuste y métricas.
- Luis Joyanes Aguilar, *Ciencia de datos: un enfoque práctico* (Alfaomega, 2024).
- Microsoft Learn, *Inteligencia artificial generativa para principiantes* (learn.microsoft.com/es-es).
- OpenAI, *Buenas prácticas para la ingeniería de prompts* (help.openai.com/es-es).
- Microsoft Learn, *Fundamentos de IA generativa y agentes* (learn.microsoft.com/es-es).

## Presentaciones del bloque

- Sesión 8 — Historia, redes neuronales y aprendizaje: `presentacion_sesion8.html`
- Sesión 9 — LLMs y prompting: `presentacion_sesion9.html`
- Sesión 10 — Agentes de IA y taller integrador: `presentacion_sesion10.html`
