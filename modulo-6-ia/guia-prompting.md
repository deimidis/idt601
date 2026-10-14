# Guía de prompting — Bloque 6, Sesión 9

**Módulo:** Ingeniería de Datos (IDT 601)
**Uso:** guía de apoyo para escribir prompts en un chat de IA (LLM). Incluye las cuatro técnicas
básicas, un ejemplo reescrito paso a paso y la regla de confidencialidad.

---

## La idea central

El **prompt** es la instrucción que le damos al modelo. Un LLM genera texto **prediciendo la palabra
más probable** según el contexto; por eso **lo que le damos de contexto es lo que condiciona** la
respuesta. No hay un prompt "correcto" único: hay prompts **más o menos útiles** para una tarea.

> Regla simple: **cuanto más claro y contextualizado el pedido, menos hay que adivinar desde el otro lado.**

## Las cuatro técnicas

| Técnica | Qué es | Pregunta que responde |
|---|---|---|
| **Claridad** | Pedir de forma específica y con formato: qué, extensión, tono. | ¿Qué quiero exactamente y cómo lo quiero? |
| **Contexto** | Dar los antecedentes: para quién y para qué. | ¿Para quién es y con qué objetivo? |
| **Ejemplos (few-shot)** | Mostrar uno o dos ejemplos del resultado esperado. | ¿Cómo se ve un buen resultado? |
| **Rol** | Pedir que asuma un papel para ajustar la voz y el enfoque. | ¿Con qué perspectiva debe responderme? |

Se pueden **combinar**. No es obligatorio usar las cuatro: para muchas tareas alcanza con claridad y contexto.

---

## Técnica 1 — Claridad

**Qué pedir:** el contenido (qué), el formato (párrafo, viñetas, tabla), la extensión (líneas, palabras) y el tono (formal, cercano, técnico).

- **Débil:** "Háblame del trámite de licencia."
- **Fuerte:** "Explicá en 5 líneas, en tono formal, los requisitos para tramitar una licencia de funcionamiento de un comercio en un municipio."

**Por qué mejora:** el modelo ya no tiene que adivinar extensión ni tono, y la respuesta se puede usar casi tal cual.

## Técnica 2 — Contexto

**Qué dar:** quién pide, para quién es, y cuál es el objetivo.

- **Ejemplo:** "Soy funcionario de un gobierno municipal y debo responder una consulta ciudadana. Redactá la respuesta usando lenguaje claro, para una persona sin conocimientos técnicos."

**Por qué mejora:** sitúa al modelo en la realidad institucional y evita respuestas genéricas.

## Técnica 3 — Ejemplos (few-shot)

**Qué dar:** uno o dos ejemplos del formato o estilo esperado, para que el modelo lo imite.

- **Ejemplo:** "Redactá el aviso siguiendo este modelo: 'Se informa a la población que…'. Mantené ese encabezado y un párrafo breve."

**Por qué mejora:** en vez de describir el estilo, se lo **muestra**; el modelo copia la estructura.

## Técnica 4 — Rol

**Qué dar:** un papel desde el cual responder.

- **Ejemplo:** "Actuá como un asesor de transparencia y explicá, en lenguaje sencillo, cómo se publica un dato abierto."

**Por qué mejora:** ajusta la voz y el enfoque. No cambia los hechos, pero sí el registro y el encuadre.

---

## El mismo pedido, reescrito paso a paso

Partimos de un pedido vago y lo mejoramos sumando técnicas.

**Versión 0 (vaga):**
> "Ayudame con un reclamo de basura."

**Versión 1 — + claridad:**
> "Redactá una respuesta de 6 líneas, en tono formal, a un reclamo por demora en la recolección de basura."

**Versión 2 — + contexto:**
> "Soy funcionario municipal y debo responder un reclamo ciudadano por demora en la recolección de basura en el barrio X. Redactá una respuesta de 6 líneas, en tono formal y empático."

**Versión 3 — + rol y ejemplo:**
> "Actuá como responsable de atención al ciudadano. Redactá, en 6 líneas y tono formal y empático, una respuesta a un reclamo por demora en la recolección de basura. Seguí este modelo: 'Le agradecemos su comunicación. Lamentamos los inconvenientes…'. Cerrá indicando el canal para hacer seguimiento."

**Qué ganamos con cada paso:** extensión y tono definidos (claridad), realidad institucional (contexto), voz adecuada (rol) y estructura lista (ejemplo).

---

## El ciclo: pedir → revisar → verificar → re-pedir

Un prompt no termina en la primera respuesta. La primera salida es un **borrador**.

1. **Pedir.** Escribir el prompt con claridad y contexto.
2. **Revisar.** ¿Responde a lo pedido? ¿El formato y el tono son correctos?
3. **Verificar.** Comprobar **datos, cifras, normas y referencias** contra la fuente oficial.
4. **Re-pedir.** Ajustar: "resumí esto en tres viñetas", "cambialo a lenguaje más sencillo", "agregá un párrafo de cierre".

**Frases útiles para re-pedir:**

- "Ahora resumilo en tres viñetas."
- "Reescribilo en lenguaje más sencillo, para un ciudadano."
- "Cambiá el tono a más formal."
- "Dejá solo lo que esté respaldado; si no estás seguro de un dato, marcalo como 'a verificar'."

---

## Regla de confidencialidad (no se negocia)

> Antes de pegar cualquier cosa en un chat público: **¿son datos de ciudadanos, documentos reservados
> o información no pública?** Si lo son, **no se pega**.

- **No subir:** nombres, documentos, domicilios, datos de salud, expedientes, borradores reservados, información no publicada.
- **Sí usar:** casos **ficticios**, datos ya **públicos** o información **anonimizada**.
- En el Estado, la **responsabilidad es del funcionario**, no de la herramienta.

## Cuidado con los límites del modelo

- **Alucinación:** puede inventar datos, normas o citas con apariencia de verdad.
- **Sesgo:** reproduce prejuicios del texto con que se entrenó.
- **Fecha de corte:** no conoce lo posterior a su entrenamiento (salvo que se le dé el contexto).

Por eso, **verificar es parte del trabajo**. El modelo **sugiere**; el criterio experto decide.

## Lista de control antes de enviar un prompt

- [ ] ¿Está claro **qué** quiero y en qué **formato**?
- [ ] ¿Incluí **para quién** es y **para qué**?
- [ ] ¿Sumé un **ejemplo** o un **rol** si hacía falta?
- [ ] ¿Usé un caso **ficticio o público** (sin datos de personas)?
- [ ] Cuando llegue la respuesta, ¿**verificaré** los datos antes de usarlos?
