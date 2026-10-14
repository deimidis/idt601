# Insumo — Los cinco casos de mini-solución (Sesión 10)

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 6 — Inteligencia Artificial
**Uso:** taller de la Sesión 10. Cada equipo elige **un** caso y lo desarrolla con las plantillas.
**Regla transversal:** se trabaja con **datos ficticios o públicos**. No se sube a un chat público
ningún dato de ciudadanos, documento reservado ni información no pública.

---

## El caso institucional

> *Una institución pública quiere usar un LLM para aliviar una tarea repetitiva. El equipo debe
> elegir **una** tarea acotada, **definir** para quién es y qué resultado espera, **armar** el prompt
> (chat) o el flujo (agente), **evaluarlo** con un caso ficticio y **mejorarlo**. No hace falta una
> plataforma de agentes real: el flujo del agente **se diseña y se documenta** con la plantilla,
> aunque no se ejecute en vivo.*

**Entregable:** la mini-solución documentada, con tarea, prompt/flujo, resultado de una prueba,
evaluación crítica y mejora aplicada. La defensa es de **2 min por equipo**.

**Cómo se lee cada caso:** destinatario · resultado esperado · herramienta (chat o agente) · prompt o
flujo sugerido · **punto de control humano** · qué **no** se sube.

---

## Caso 1 — Asistente de trámites

- **Destinatario:** la ciudadanía que consulta requisitos antes de iniciar un trámite.
- **Resultado esperado:** respuestas claras sobre requisitos, con la **referencia** de la normativa
  institucional.
- **Herramienta:** **chat** con la normativa cargada como contexto (o un agente con **RAG** si se
  quiere documentar el flujo de búsqueda).
- **Prompt o flujo sugerido:** dar el rol ("asistente de atención de trámites"), la lista de
  requisitos y el formato de respuesta; pedir que **cite** el documento usado.
- **Punto de control humano:** el contenido final de la guía de trámites lo aprueba la unidad
  responsable antes de publicarse.
- **Qué NO se sube:** consultas reales de ciudadanos; se usa una consulta ficticia ("¿qué necesita
  para renovar X?").
- **Qué se documenta:** si se plantea como agente RAG, el flujo `buscar en normativa → citar →
  responder` con su punto de revisión.

## Caso 2 — Clasificador de reclamos (reescrito)

- **Destinatario:** el área de atención al ciudadano que recibe reclamos y debe derivarlos.
- **Resultado esperado:** para cada reclamo, una **categoría sugerida** (por ejemplo: atención,
  infraestructura, trámites) y el **área** a la que correspondería.
- **Herramienta:** **chat**. El clasificador se resuelve con un **buen prompt** (rol, categorías,
  ejemplos) y **criterio humano**; **no requiere** una plataforma de agentes real.
- **Cómo se resuelve sin plataforma:**
  1. Se definen las categorías y se dan **dos o tres ejemplos** de cada una (few-shot).
  2. Se pega un reclamo **ficticio** y se pide la categoría en un formato fijo (categoría + área +
     motivo).
  3. La persona que atiende **revisa la sugerencia**, la corrige si hace falta y **deriva** ella
     misma.
- **Flujo del agente (se diseña y documenta, no se ejecuta en vivo):** modelo + herramienta "leer
  planilla de reclamos ficticia" + memoria de la conversación + planificación "clasificar → asignar
  área → preparar borrador de derivación", con **punto de control humano antes de derivar**.
- **Punto de control humano:** la persona **confirma o cambia** la categoría y decide la derivación.
  El clasificador **sugiere**; el funcionario **decide**.
- **Qué NO se sube:** reclamos reales con datos de personas. Se usa un reclamo **ficticio** o
  anonimizado.
- **Señal de calidad:** la sugerencia acierta en el caso de prueba y el equipo explica **qué
  revisó** antes de aceptarla.

## Caso 3 — Resumidor de informes

- **Destinatario:** una autoridad que necesita un resumen breve de un informe técnico.
- **Resultado esperado:** un resumen de extensión y tono fijos, fiel al documento.
- **Herramienta:** **chat**.
- **Prompt o flujo sugerido:** rol ("analista que resume para una autoridad"), longitud, secciones
  (hallazgos, riesgos, recomendación) y un ejemplo de estilo.
- **Punto de control humano:** quien redactó o conoce el informe **verifica las cifras** del resumen
  contra el original antes de enviarlo.
- **Qué NO se sube:** informes reservados o con datos no públicos; se usa un informe **público** o
  un texto **ficticio**.
- **Señal de calidad:** el resumen no inventa datos y conserva las cifras del original.

## Caso 4 — Verificador de expedientes (reescrito)

- **Destinatario:** el área que recibe un expediente y debe controlar que estén los documentos
  obligatorios.
- **Resultado esperado:** una **lista de verificación** marcada: qué documentos figuran y cuáles
  faltan.
- **Herramienta:** **chat**. La verificación se resuelve con una **lista de control** y un caso
  **ficticio**; **no requiere** una plataforma de agentes real.
- **Cómo se resuelve sin plataforma:**
  1. Se escribe la **lista de documentos obligatorios** y se pide una respuesta en formato tabla
     (documento · presente · observación).
  2. Se pega el **índice de un expediente ficticio** (nombres de documentos, sin contenido
     reservado).
  3. La persona **confirma** qué falta y revisa cualquier duda contra el expediente.
- **Flujo del agente (se diseña y documenta, no se ejecuta en vivo):** modelo + herramienta "leer
  índice del expediente" + memoria del checklist + planificación "comparar con la lista → marcar
  faltantes → preparar observación", con **punto de control humano antes de dar por válido el
  expediente**.
- **Punto de control humano:** una persona **confirma** la lista y **decide** si el expediente está
  completo. El agente **sugiere**; el funcionario **valida**.
- **Qué NO se sube:** expedientes reales ni documentos reservados. Se usa un **índice ficticio** con
  nombres de documentos.
- **Señal de calidad:** la lista marca correctamente lo faltante en el caso de prueba y el equipo
  explica **qué confirmó** a mano.

## Caso 5 — Avisos a la ciudadanía

- **Destinatario:** la ciudadanía a la que se comunica un servicio, corte o trámite.
- **Resultado esperado:** un aviso claro, breve y sin tecnicismos, con qué, cuándo y dónde.
- **Herramienta:** **chat**.
- **Prompt o flujo sugerido:** rol ("comunicador público"), tono cercano, longitud máxima y datos
  concretos que debe incluir; pedir una versión para redes y una para web.
- **Punto de control humano:** comunicación institucional **revisa y aprueba** el texto antes de
  publicarlo.
- **Qué NO se sube:** datos personales de las personas afectadas ni información reservada.
- **Señal de calidad:** el aviso es comprensible para un público no especialista y no promete nada
  que la institución no pueda cumplir.

---

## Cómo elegir el caso (2 min al inicio del taller)

- Elijan **uno** de los cinco y **acótenlo**: un paso pequeño y útil rinde más que un proyecto enorme.
- Prefieran el que puedan **probar** con un caso ficticio o público en los 60 minutos de taller.
- Escriban el **problema** y el **destinatario** en una frase antes de empezar.

## Advertencia de confidencialidad (repetirla en voz alta)

> Antes de pegar cualquier cosa en un chat público: ¿son **datos de ciudadanos**, **documentos
> reservados** o **información no pública**? Si lo son, **no se pegan**. Se trabaja con **ejemplos
> ficticios**, datos ya **públicos** o documentos **abiertos**. En el Estado, la responsabilidad es
> del **funcionario**, no de la herramienta.
