# Guía de solución del docente — Taller Sesión 10

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 6 — Inteligencia Artificial
**Taller:** `taller_sesion10_minisolucion_ia.md`
**Uso:** criterios, casos resueltos de ejemplo, errores frecuentes y rúbrica con niveles (Sesión 10 y
trabajo final integrador).

---

## 1. Qué se espera de la entrega

Cada equipo entrega **dos** piezas, cerradas en la sesión:

1. **Mini-solución documentada** (`plantilla-entrega-minisolucion.md`): tarea, prompt/flujo, resultado
   de una prueba, evaluación crítica y mejora aplicada.
2. **Flujo del agente diseñado** (`plantilla-diseno-flujo-agente.md`): modelo, herramientas, memoria,
   planificación y **punto de control humano**.

Criterios rectores:

- La tarea debe ser **acotada y útil**, con destinatario y criterio de éxito.
- El flujo debe nombrar los **cuatro componentes** y justificarlos según la tarea.
- Debe existir un **punto de control humano** explícito (qué revisa y qué decide una persona).
- La prueba se hace con un caso **ficticio o público**; nunca con datos de ciudadanos.
- Debe haber **al menos una mejora** y la conciencia de **qué se verificó**.

---

## 2. Caso resuelto de ejemplo — Caso 2: clasificador de reclamos (chat)

**Cómo se resuelve:** con **chat + criterio + supervisión humana**, sin plataforma de agentes real.

**Tarea:** para un reclamo, sugerir la **categoría** y el **área** a la que corresponde.
**Destinatario:** el área de atención al ciudadano.
**Criterio de éxito:** la categoría sugerida coincide con la esperada en el caso de prueba y el equipo
explica qué revisó.

**Prompt final (ejemplo):**

> Actuá como clasificador de reclamos de una alcaldía. Categorías: **Atención** (trato del personal),
> **Infraestructura** (calles, alumbrado, parques), **Trámites** (demoras o errores en un trámite).
> Devolvé solo: `categoría | área | motivo (una frase)`. Si no estás seguro, escribí
> `REVISIÓN HUMANA`. Ejemplos:
> - "El funcionario de la ventanilla 3 no me quiso atender" → `Atención | Recursos Humanos | Trato del personal`
> - "La calle Sucre lleva dos meses sin luz" → `Infraestructura | Servicios | Alumbrado público`
> - "Mi trámite lleva un mes sin respuesta" → `Trámites | Ventanilla Única | Demora en trámite`
> Ahora clasificá: "El ascensor del edificio municipal está roto desde hace una semana".

**Resultado de la prueba (ficticio):** `Infraestructura | Servicios | Ascensor fuera de servicio`.
**Evaluación crítica:** fue correcto, pero el caso límite "no estoy seguro" debe forzar
`REVISIÓN HUMANA`; se verificó que la sugerencia **no invente** un área inexistente.
**Mejora aplicada:** se agregó la instrucción "si la duda es entre dos categorías, elegí la dominante y
marcá `REVISIÓN HUMANA`".

**Punto de control humano:** la persona que atiende **confirma o corrige** la categoría y **deriva**
ella misma. El clasificador sugiere; el funcionario decide.

**Flujo del agente (documentado, no ejecutado):** modelo (LLM) + herramienta "leer planilla de reclamos
ficticia" + memoria de la conversación + planificación `clasificar → asignar área → preparar borrador de
derivación`, con **punto de control humano antes de derivar**.

**Confidencialidad:** se usa un reclamo **ficticio**; no se suben reclamos reales.

---

## 3. Caso resuelto de ejemplo — Caso 4: verificador de expedientes (chat)

**Cómo se resuelve:** con **chat + criterio + supervisión humana**, usando una lista de verificación y
un expediente **ficticio**.

**Tarea:** marcar qué documentos obligatorios figuran y cuáles faltan.
**Destinatario:** el área que recibe el expediente.
**Criterio de éxito:** la lista marca correctamente los faltantes del caso ficticio.

**Prompt final (ejemplo):**

> Actuá como verificador de expedientes. Lista obligatoria: **1) solicitud, 2) fotocopia de DNI,
> 3) informe técnico, 4) declaración jurada**. Te paso el índice de un expediente y devolvés una tabla
> `documento | presente (sí/no) | observación`. No inventes documentos que no estén en el índice.
> Índice: "solicitud, declaración jurada, informe técnico".

**Resultado de la prueba (ficticio):**

| documento | presente | observación |
|---|---|---|
| solicitud | sí | — |
| fotocopia de DNI | no | falta |
| informe técnico | sí | — |
| declaración jurada | sí | — |

**Evaluación crítica:** correcto en el caso de prueba; se verificó que **no** inventara el DNI.
**Mejora aplicada:** se pidió además "resaltá la primera fila con `FALTA`" para que el revisor la vea.

**Punto de control humano:** una persona **confirma** la lista y **decide** si el expediente está
completo. El agente sugiere; el funcionario valida.

**Flujo del agente (documentado, no ejecutado):** modelo + herramienta "leer índice del expediente" +
memoria del checklist + planificación `comparar con la lista → marcar faltantes → preparar observación`,
con **punto de control humano antes de dar por válido el expediente**.

**Confidencialidad:** se usa un **índice ficticio** con nombres de documentos; no se sube el expediente
real ni documentos reservados.

---

## 4. Respuestas modelo de los otros casos (síntesis)

| Caso | Tarea acotada | Punto de control humano | Mejora típica |
|---|---|---|---|
| 1 Asistente de trámites | Responder requisitos citando la normativa | La unidad aprueba la guía antes de publicar | Pedir que cite el documento usado |
| 3 Resumidor de informes | Resumen de 150 palabras para una autoridad | Quien conoce el informe verifica las cifras | "No inventes cifras; cita el párrafo" |
| 5 Avisos a la ciudadanía | Aviso claro para redes y web | Comunicación revisa y aprueba antes de publicar | Ajustar el tono a público no especialista |

> Común a los cinco: los **cuatro componentes** del flujo están nombrados y el **punto de control
> humano** indica **qué** revisa una persona y **qué** decide.

---

## 5. Errores frecuentes y cómo orientarlos

| Error | Cómo se detecta | Cómo orientar |
|---|---|---|
| Tarea desmedida | "Un asistente para todo el municipio" | Reducir a **un paso**: un tipo de consulta, de reclamo o de informe. |
| Prompt vago | "Resumime esto" | Pedir rol, formato, longitud y un ejemplo de estilo. |
| Sin supervisión humana | No aparece quién revisa | Exigir el **punto de control**: qué revisa y qué decide la persona. |
| Confundir ejecutar con diseñar | "No tengo plataforma de agentes" | El flujo **se diseña y se documenta** con la plantilla; no hace falta ejecutarlo. |
| Pegar datos reales | Prueban con datos del trabajo | Detener, borrar y usar un **caso ficticio**; repetir la confidencialidad. |
| No verificar | Aceptan la primera respuesta | Verificar **una cifra o un dato** contra la fuente original. |
| No hay mejora | Cierran con la versión 1 | Pedir el "**antes y después**" de un cambio concreto. |
| Confundir RAG con automatización | Todo lo llaman "agente" | RAG **busca y cita**; automatización **ejecuta pasos repetitivos**. |

---

## 6. Rúbrica con niveles — Sesión 10 (mini-solución)

| Criterio | Insuficiente (1–59) | Suficiente (70–84) | Excelente (95–100) |
|---|---|---|---|
| **Define la tarea** | Tarea vaga o desmedida. | Tarea acotada, con destinatario y resultado esperado. | Tarea acotada y **útil**, con criterio de éxito explícito. |
| **Diseña el flujo** (modelo, herramientas, memoria, planificación) | No identifica los componentes. | Identifica los cuatro componentes. | Identifica los componentes y los justifica según la tarea. |
| **Incorpora supervisión humana** | No prevé control humano. | Menciona revisión humana al final. | Define **puntos de control** y aplica menor privilegio y trazabilidad. |
| **Prueba y evalúa** | No prueba o no evalúa. | Prueba un caso y evalúa con las tres preguntas. | Prueba, detecta alucinación/sesgo y lo documenta. |
| **Mejora y defiende** | No aplica mejoras. | Aplica una mejora y la explica. | Aplica mejoras y justifica la decisión con criterio experto. |
| **Confidencialidad** | Usa datos sensibles. | Usa datos ficticios o públicos. | Usa datos ficticios o públicos y **prevé el resguardo** de datos de ciudadanos. |

## 7. Rúbrica con niveles — Trabajo final integrador (cierre del arco)

El trabajo final recorre el módulo y suma **dos componentes obligatorios**: **(a)** la declaración de
licencia del dataset usado (Bloque 5) y **(b)** un prompt o flujo de agente documentado con su punto de
control humano (Bloque 6).

| Criterio | Insuficiente (1–59) | Suficiente (70–84) | Excelente (95–100) |
|---|---|---|---|
| **Pertinencia del caso** | Caso trivial o mal delimitado. | Caso institucional acotado y relevante. | Caso relevante, acotado y con criterio de éxito claro. |
| **Calidad de la ingesta y transformación** | Datos sin procesar o mal documentados. | Ingesta y transformación documentadas. | Ingesta, limpieza y transformación documentadas y verificables. |
| **Orquestación e integración** | No hay flujo o no está ordenado. | Flujo con tareas y dependencias. | Flujo con dependencias, manejo de fallos y trazabilidad. |
| **Limpieza y preparación** | Pierde filas o inventa datos. | Limpia y marca faltantes. | Limpia, documenta decisiones y marca faltantes con `SIN DATO`. |
| **Licencia del dataset (nuevo)** | No declara licencia. | Declara la licencia y su condición. | Declara licencia, atribución lista y límites por datos personales. |
| **Prompt/flujo de IA (nuevo)** | No incluye componente de IA. | Incluye un prompt con claridad y contexto. | Incluye prompt o flujo, resultado de prueba y **punto de control humano**. |
| **Documentación y defensa** | Documento incompleto; defensa desordenada. | Documento completo y defensa clara. | Documento sólido, defensa convincente y respuestas a las preguntas. |

> Escala del módulo (Plan de Clases): 1–59 inicial · 60–69 muy parcial · 70–84 suficiente · 85–94 alto
> porcentaje · 95–100 logro total esperado.

---

## 8. Cómo cerrar la devolución

- Reconocer el **paso útil** que logró cada equipo, aunque sea pequeño.
- Insistir en que **el agente sugiere y el humano decide**, y en que un error del agente puede ser una
  **acción**, no una frase.
- Recordar el **trabajo final integrador** y sus dos componentes obligatorios: la **licencia del
  dataset** y el **prompt/flujo con punto de control humano**.
