# Sesión 9 — Modelos de lenguaje (LLM) y prompting

**Módulo:** Ingeniería de Datos (IDT 601)
**Bloque:** 6 — Historia y Desarrollo de la Inteligencia Artificial
**Duración:** 3 horas (180 min) — teóricas y prácticas
**Público:** Profesionales no especializados en ingeniería de datos
**Modalidad:** 100 % virtual

---

## Objetivos de la sesión

- Entender qué son los modelos de lenguaje de gran escala (LLM) y cómo generan contenido.
- Reconocer los modelos generativos (texto y código) y sus alcances y límites.
- Usar modelos de lenguaje en formato de chat e identificar el papel del prompt.
- Aplicar técnicas de prompting (claridad, contexto, ejemplos y rol) para obtener mejores resultados.
- Iterar y verificar críticamente las respuestas antes de usarlas en la gestión pública.
- Instalar la regla de **confidencialidad**: no subir datos de ciudadanos, documentos reservados ni información no pública a un chat externo.

## Ideas clave (qué debe quedar al final)

1. Un **LLM** es una **red neuronal a gran escala** entrenada sobre enormes volúmenes de texto; su tarea central es **predecir la siguiente palabra**.
2. Generar contenido es **predecir palabra por palabra usando probabilidades**, no "pensar" ni copiar de una base de datos: por eso la respuesta puede cambiar cada vez.
3. Conceptos que explican el comportamiento real: **token**, **ventana de contexto**, **temperatura** y **embedding**.
4. Los **modelos generativos** producen **texto y código** (y también imagen, audio o video), y abren nuevas formas de trabajar, también en la gestión pública.
5. Los LLM tienen **límites serios**: **alucinan** (inventan datos), **reproducen sesgos** del texto con que se entrenaron y tienen un **conocimiento con fecha de corte**.
6. Un **chat** es la interfaz para conversar con un LLM; lo que escribimos (el **prompt**) condiciona fuertemente la calidad de la respuesta.
7. Un **buen prompt** combina **claridad**, **contexto**, **ejemplos** y, cuando conviene, la definición de un **rol**; trabajar con un LLM es un proceso **iterativo**.
8. **Nunca** se da por cierta una respuesta: hay que **verificarla** contra fuentes confiables y el propio criterio experto.
9. Antes de pegar algo en un chat público: **¿son datos de ciudadanos, documentos reservados o información no pública? Si lo son, no se pega.**

## Cronograma sugerido (180 min)

| Bloque | Duración | Qué ocurre |
|---|---|---|
| Apertura y encuadre | 10 min | Bienvenida, puente con la Sesión 8 y dos preguntas disparadoras. |
| Qué es un LLM y cómo se entrena | 20 min | De la red neuronal al modelo a gran escala, con la corrección del ciclo de entrenamiento. |
| Generación por probabilidad y conceptos operativos | 15 min | Predicción de la siguiente palabra; token, ventana de contexto, temperatura y embedding. |
| Modelos generativos | 10 min | Texto y código; el panorama multimodal. |
| Pausa | 10 min | Receso. |
| Alcances, límites y confidencialidad | 20 min | Alucinación, sesgo, fecha de corte y la regla de cuidado de la información. |
| Interfaces de chat y qué es un prompt | 10 min | Cómo acceder y cómo interactuar; el prompt condiciona la respuesta. |
| Técnicas de prompting | 20 min | Claridad, contexto, ejemplos y rol. |
| Iteración y verificación | 15 min | El ciclo pedir → revisar → verificar → re-pedir. |
| Práctica: prompts para gestión pública | 30 min | Redactar prompts, evaluar respuestas e iterar. |
| Puesta en común y cierre | 20 min | Compartir el prompt mejorado, síntesis y puente a la Sesión 10. |

> **Ajuste de tiempos:** se recortan "Qué es un LLM" (25→20) y "Generación por probabilidad" (25→15) para abrir un bloque propio de **conceptos operativos** (token, ventana de contexto, temperatura y embedding). "Modelos generativos" pasa a 10 min, "límites" sube a 20 para sumar la **confidencialidad** (con enlace al Bloque 5) y "chat" baja a 10. La **práctica queda en 30 min completos** y la **puesta en común se mueve al cierre** (cierre de 20 min que incluye los últimos 10 para compartir el prompt mejorado).

---

## Apertura y encuadre (10 min)

- Dar la bienvenida y ubicar la sesión en el Bloque 6 — Historia y Desarrollo de la Inteligencia Artificial.
- Conectar con la sesión anterior: *"Vimos la red neuronal y cómo aprende. Hoy la vemos a escala gigante: los modelos de lenguaje, los que están detrás de los chats que usamos a diario. Y aprendemos a usarlos bien."*
- Presentar las dos preguntas que ordenan el día: **¿qué es un LLM y cómo genera contenido?** y **¿cómo le pedimos para obtener una buena respuesta?**
- Palabras clave: **modelo de lenguaje, entrenamiento, probabilidad, generativo, alucinación, sesgo, chat, prompt, verificar, confidencialidad**.

> Momento de enganche: abrir un chat con un LLM y mostrar dos respuestas ante un pedido vago ("háblame de impuestos") y ante uno preciso ("explicá en 5 líneas y para un funcionario municipal qué es el impuesto predial"). Preguntar: *"¿Qué diferencia notan? ¿Qué cambió?"* — anticipa el poder del prompt y el corazón de la sesión.

---

## Qué es un LLM y cómo se entrena (20 min)

Explicar sin tecnicismos, retomando la red neuronal de la sesión previa.

### LLM: "modelo de lenguaje de gran escala"

- **Modelo de lenguaje:** un sistema que aprende **cómo se combina el lenguaje** humano a partir de ejemplos.
- **Gran escala (large):** miles de millones de parámetros (pesos) y entrenado sobre **enormes volúmenes de texto**: libros, artículos, sitios web, código, documentos públicos.
- Analogía: un LLM es como un **lector incansable** que leyó una biblioteca entera y, con eso, aprendió qué palabras suelen ir juntas y en qué orden.

### Cómo se entrena

1. Se le muestran **miles de millones de frases**.
2. Se le pide, una y otra vez, **predecir la siguiente palabra**.
3. Se **compara su predicción con la palabra que realmente seguía** en el texto. Si no coinciden, se calcula el **error** y se **ajustan los pesos** para reducirlo (el mismo ciclo de la red neuronal, a escala gigante).
4. Se repite millones de veces.

> **Precisión importante (evita un error frecuente):** durante el preentrenamiento **no hay un "refuerzo" cuando acierta**. El modelo no aprende con premios ni castigos: simplemente **compara** su salida con la palabra que seguía en el texto y **corrige los pesos** para acercarse cada vez más. Eso es **descenso de gradiente**, y **no es aprendizaje por refuerzo**. El aprendizaje por refuerzo (con recompensas) es otra cosa y se vio en la Sesión 8.

**No hay un humano escribiendo reglas:** el modelo **descubre los patrones del lenguaje** solo.

**Idea para la pizarra:** dibujar la red neuronal de la sesión anterior y "agrandarla" millones de veces; anotar al lado **entrenamiento = comparar la predicción con la palabra real y corregir los pesos**.

> Demostración sugerida: pedirle al LLM que complete la frase "La recaudación tributaria del municipio aumentó porque..." y mostrar que continúa de forma natural, no porque tenga la respuesta guardada, sino porque sabe cómo suele seguir la frase.

---

## Generación por probabilidad y conceptos operativos (15 min)

### La "predicción" de la siguiente palabra

- Cuando escribimos un pedido, el modelo calcula **qué palabra es más probable que venga después**, según todo lo que leyó.
- **No busca** en una base de datos ni "recuerda" textos: **genera palabra por palabra**, eligiendo entre las opciones más probables.
- Cada palabra elegida pasa a formar parte del contexto para elegir la siguiente.

**Ideas para la pizarra:**

1. Entrada: *"El informe de gestión del año 2025..."*
2. El modelo asigna **probabilidades** a la siguiente palabra: "señala" (0,42), "muestra" (0,31), "indica" (0,18), otras (0,09).
3. Elige una y continúa. Por eso, ante la misma pregunta, la respuesta puede **variar** cada vez.

**Qué implica que sea probabilístico:** no hay **una única respuesta correcta**, sino respuestas **más o menos probables**; elige la palabra probable, no la verdad. Esto explica por qué es útil y por qué a veces falla.

### Cuatro conceptos que explican el comportamiento real

| Concepto | Qué es | Por qué importa |
|---|---|---|
| **Token** | Fragmento de texto (palabra, parte de palabra o signo) que el modelo usa como unidad. | El modelo no "lee" letras ni palabras completas: cuenta y predice tokens. Explica por qué se equivoca al contar letras o al escribir palabras raras. |
| **Ventana de contexto** | Cantidad máxima de texto que el modelo puede tener en cuenta en una conversación. | Más allá de ese límite, los mensajes viejos **se pierden**: el modelo "olvida" lo dicho al principio si la conversación crece demasiado. |
| **Temperatura** | Parámetro que regula qué tan variadas o predecibles son las respuestas. | Baja = respuestas más repetibles y prudentes; alta = más variadas y creativas, pero también más impredecibles. No es "inteligencia": es cuánto se arriesga a elegir opciones menos probables. |
| **Embedding (vector)** | Representación numérica del significado de un texto, que permite comparar y buscar por parecido. | Es la base de la búsqueda por similitud y de la recuperación de información (RAG, que se verá en la Sesión 10). |

> **Idea puente:** estos cuatro conceptos no son teoría de laboratorio; **explican por qué el modelo a veces olvida, a veces repite y a veces inventa**. La próxima vez que una respuesta se corte o se desvíe, probablemente sea por la ventana de contexto o por la temperatura.

### Modelos generativos: texto y código

| Tipo | Qué genera | Ejemplo en gestión pública |
|---|---|---|
| Texto | Redacta, resume, traduce, explica y responde | Primera versión de una nota o de una respuesta a un reclamo |
| Código | Escribe y explica código; ayuda a automatizar | Fórmula de planilla o script para ordenar un archivo de datos |

También existen modelos que generan **imagen, audio (voz) y video**, y modelos **multimodales**, que combinan texto e imagen en la misma conversación.

**Mensaje puente:** *"Todos comparten la misma idea: un modelo entrenado que genera contenido nuevo. Ahora veamos qué tan confiable es todo eso."*

---

## Pausa (10 min)

---

## Alcances, límites y confidencialidad (20 min)

### Alucinaciones

- El modelo **inventa información** con total seguridad: citas, datos, leyes o referencias que **no existen**.
- Ocurre porque genera **lo más probable**, no **lo verdadero**.
- **Ejemplo:** pedir el "artículo 45 de la Ley N° 1234" y recibir un texto inventado, coherente pero falso.
- **Regla práctica:** todo lo que salga de un LLM debe **verificarse** contra fuentes confiables.

### Sesgos

- El modelo **reproduce los sesgos** del texto con que se entrenó (género, edad, región, tono, prejuicios).
- **Ejemplo:** preguntar por profesiones y observar que ciertos roles se asocian de forma estereotipada.

### Actualidad del conocimiento

- El modelo **"sabe" hasta su fecha de corte** (cuando terminó su entrenamiento); no conoce hechos posteriores salvo que se le proporcione contexto nuevo o consulte internet.
- **Ejemplo:** puede no conocer una norma aprobada el mes pasado.

### Síntesis en tabla

| Límite | Qué es | Riesgo en la gestión pública |
|---|---|---|
| Alucinación | Inventa información verosímil pero falsa | Cifras, normas o referencias incorrectas |
| Sesgo | Repite prejuicios del entrenamiento | Trato desigual, lenguaje estereotipado |
| Fecha de corte | No conoce lo posterior a su entrenamiento | Normativa o datos desactualizados |

### Regla de confidencialidad (enlace con el Bloque 5)

> Antes de pegar cualquier cosa en un chat público: **¿son datos de ciudadanos, documentos reservados o información no pública?** Si lo son, **no se pega**. Se trabaja con **ejemplos ficticios**, con **datos ya públicos** o con **documentos abiertos**. En el Estado, la responsabilidad es del funcionario, no de la herramienta.

- Lo trabajado en el Bloque 5 vuelve aquí: una cosa es **publicar un dato abierto** con su licencia y otra es **subir datos personales o información reservada a un servicio externo**.
- Si se necesita usar un caso real, se **anonimiza** (se cambian nombres, se quitan identificadores) o se reemplaza por un caso ficticio equivalente.

---

## Interfaces de chat y qué es un prompt (10 min)

### Cómo se accede hoy

- La forma más común de usar un LLM es mediante un **chat**: un cuadro de texto donde escribimos y recibimos una respuesta.
- Es una **plataforma genérica de chat**: sirve cualquiera de las conocidas (**ChatGPT, Gemini o Copilot**, por ejemplo). No hay una obligatoria: el método de esta sesión funciona con cualquiera.
- **Plan B sin cuenta:** si no se puede crear una cuenta, la práctica se hace con un **documento compartido** donde cada persona escribe su prompt, y el docente corre una **demostración guiada** en pantalla con el chat.
- Cada interacción forma parte de una **conversación**: el modelo usa lo anterior como **contexto** para responder.
- La conversación tiene **límite de memoria** (la **ventana de contexto**): más allá de cierta longitud, los mensajes viejos se pierden.

**Ideas para la pizarra:**

- Entrada del usuario → **prompt**.
- Salida del modelo → **respuesta generada**.
- El historial de la conversación alimenta la siguiente respuesta (hasta el límite de la ventana de contexto).

### Buenas prácticas de interacción

- Hacer **una pregunta por vez** para no dispersar al modelo.
- Pedir **reformulación o aclaración** si la respuesta no sirve.
- Saber que la respuesta **no es la verdad**, sino una propuesta a revisar.

### Qué es un prompt

- El **prompt** es el texto que le damos al modelo: la **instrucción** o pedido.
- La calidad de la respuesta depende, en gran parte, de **cómo está redactado** el prompt.

---

## Técnicas de prompting (20 min)

### Técnica 1 — Claridad

- Pedir de forma **específica y concreta**: qué queremos, qué formato, qué extensión, qué tono.
- **Débil:** "Háblame del trámite de licencia."
- **Fuerte:** "Explicá en 5 líneas, en tono formal, los requisitos para tramitar una licencia de funcionamiento de un comercio en un municipio."

### Técnica 2 — Contexto

- Aportar **antecedentes** para que el modelo sepa para quién y para qué responde.
- **Ejemplo:** "Soy funcionario de un gobierno municipal y debo responder una consulta ciudadana. Redactá la respuesta usando lenguaje claro."

### Técnica 3 — Ejemplos (few-shot)

- Dar uno o dos **ejemplos del resultado esperado** para guiar el formato y el tono.
- **Ejemplo:** "Redactá el aviso siguiendo este modelo: 'Se informa a la población que…'"

### Técnica 4 — Rol

- Pedirle que asuma un **papel** para ajustar la voz y el enfoque.
- **Ejemplo:** "Actuá como un asesor de transparencia y explicá…"

### Resumen en tabla

| Técnica | Qué es | Ejemplo breve |
|---|---|---|
| Claridad | Pedido específico y con formato | "En 5 líneas, tono formal…" |
| Contexto | Antecedentes de quién y para qué | "Soy funcionario municipal…" |
| Ejemplos | Mostrar el resultado esperado | "Seguí este modelo: 'Se informa…'" |
| Rol | Asumir un papel | "Actuá como asesor de transparencia…" |

La guía ampliada, con un mismo pedido reescrito paso a paso, está en `guia-prompting.md`.

---

## Iteración y verificación (15 min)

### Iterar

- La primera respuesta rara vez es la definitiva: trabajar con un LLM es **diálogo**.
- Ciclo sugerido: **pedir → revisar → verificar → re-pedir**.
- Se puede pedir que **acorte, aclare, reformule, cambie el tono** o **detalle** un punto.
- **Ejemplo:** "Ahora resumí eso en tres viñetas" o "Escribilo en lenguaje más sencillo, para un ciudadano".

### Verificar

- Recordar los límites ya vistos: **alucinaciones, sesgos y fecha de corte**.
- Toda respuesta con **datos, cifras, normas o referencias** debe **verificarse** contra la fuente oficial.
- Usar el **criterio experto**: el profesional conoce su área y detecta lo incorrecto.

**Idea para la pizarra:** dibujar el ciclo **Pedir → Revisar → Verificar → Re-pedir** y destacar "verificar" como paso obligatorio.

> Demostración: pedir al LLM un dato normativo que probablemente invente, detectar el error en grupo y mostrar cómo re-pedir con la fuente correcta.

---

## Práctica: prompts para gestión pública (30 min)

> El taller completo, con reparto minuto a minuto, entregable, Modo A/B, Plan B y rúbrica, está en `taller_sesion9_prompts_gestion_publica.md`.

**Objetivo:** redactar prompts para una tarea real de gestión pública y evaluar críticamente las respuestas.

**Consigna general:** cada participante (o pareja) elige una tarea institucional y elabora un prompt que aplique al menos **claridad + contexto** y, si puede, **rol o ejemplo**.

**Tareas sugeridas:**

1. Redactar una **respuesta a un reclamo** frecuente sobre un servicio municipal.
2. Elaborar un **aviso institucional** para informar la suspensión temporal de un trámite.
3. Resumir un **informe técnico** en un párrafo para una autoridad.
4. Explicar un **requisito de trámite** en lenguaje sencillo para la ciudadanía.
5. Generar una **lista de verificación** de documentos para un expediente.

**Pasos:**

1. Redactar el prompt en el chat LLM (o en el documento compartido, Plan B).
2. Leer la respuesta y **evaluarla** con tres preguntas: ¿responde a lo pedido? ¿el tono y formato son los correctos? ¿hay algo dudoso que verificar?
3. **Iterar** al menos una vez: mejorar el prompt y comparar.
4. Anotar el **prompt mejorado + una observación de verificación** en `plantilla-captura-prompt.md`.

**Acceso:** plataforma genérica de chat (cualquiera de las conocidas sirve). **Plan B sin cuenta:** documento compartido + demostración guiada del docente.

**Guía de corrección:** valorar que el prompt incluya **claridad** (qué, formato, extensión) y **contexto** (para quién y para qué), y que la persona **identifique** al menos un punto a verificar en la respuesta.

**Criterios de evaluación:** calidad del prompt elaborado y capacidad de evaluar críticamente la respuesta.

---

## Puesta en común y cierre (20 min)

### Puesta en común (10 min)

- Cada participante o pareja comparte en 1–2 minutos su **prompt mejorado** y **qué cambió** respecto del primero.
- Cada uno nombra **un dato que verificaría** antes de usar la respuesta.
- El docente contrasta los prompts y refuerza las ideas fuerza: *un buen prompt más verificación son la diferencia entre un resultado útil y uno engañoso*.

### Síntesis y cierre (10 min)

- Releer la tabla de técnicas (claridad, contexto, ejemplos, rol) y la tabla de límites (alucinación, sesgo, fecha de corte).
- Reforzar la idea central: *"Un LLM genera palabra por palabra usando probabilidades; un buen prompt y la verificación son la diferencia entre un resultado útil y uno engañoso."*
- Repetir la **regla de confidencialidad**: no se suben datos de ciudadanos ni documentos reservados a un chat público.
- Anticipar la próxima sesión: *"La próxima vez el LLM deja de solo responder y empieza a actuar: los agentes de IA y el taller integrador del módulo."*
- Espacio de preguntas y dudas.

---

## Recursos

- Presentación `presentacion_sesion9.html` y deck `deck-sesion-09.html`.
- `guia-prompting.md`: guía de prompting (claridad, contexto, ejemplos, rol) con ejemplos.
- `plantilla-captura-prompt.md`: plantilla de entregable (prompt v1 → evaluación → prompt v2).
- `taller_sesion9_prompts_gestion_publica.md`: taller con reparto, Modo A/B, Plan B y rúbrica.
- `insumos/tareas-practica-s9.md`: las cinco tareas sugeridas y las notas de acceso al chat.
- Un chat LLM accesible por navegador (plataforma genérica) y el Plan B sin cuenta (documento compartido).
- Pizarra o pizarra digital para el esquema de "predicción de la siguiente palabra" y el ciclo de iteración.

## Evaluación de la sesión

| Criterio | Evidencia |
|---|---|
| Explica qué es un LLM y cómo se entrena | Participación en el bloque de LLM y en el cierre |
| Describe la generación por probabilidad y los conceptos operativos | Aportes al explicar por qué las respuestas varían, se cortan o se olvidan |
| Reconoce tipos de modelos generativos | Respuestas en el panorama de texto y código |
| Identifica límites (alucinación, sesgo, corte) | Observaciones en el bloque de alcances y límites |
| Aplica claridad, contexto, ejemplos o rol en el prompt | Prompt elaborado durante la práctica |
| Evalúa críticamente la respuesta e itera | Observaciones de verificación y prompt mejorado en la puesta en común |
| Cuida la información | Uso de casos ficticios o públicos y mención de la regla de confidencialidad |

**Entrega:** prompt mejorado de una tarea de gestión pública, con una observación de verificación sobre la respuesta obtenida.
