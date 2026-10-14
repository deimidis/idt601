# Guía de solución del docente — Sesión 9

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 6 — Historia y Desarrollo de la Inteligencia Artificial
**Práctica:** `taller_sesion9_prompts_gestion_publica.md`
**Uso:** prompt de ejemplo resuelto, criterios de corrección, errores frecuentes y rúbrica con niveles.

---

## 1. Prompt de ejemplo resuelto (tarea: respuesta a un reclamo)

Sirve como modelo para abrir la práctica o para el Modo B.

**Versión 1 (mejorable):**
> "Escribí una respuesta a un reclamo de basura."

Problema: sin contexto (quién pide, para quién), sin formato, sin extensión ni tono.

**Versión 2 (mejorada, con claridad + contexto + rol + ejemplo):**
> "Actuá como responsable de atención al ciudadano de un gobierno municipal. Debo responder un reclamo
> ciudadano por demora en la recolección de basura. Redactá una respuesta de 6 líneas, en tono formal y
> empático, para una persona sin conocimientos técnicos. Seguí este modelo: 'Le agradecemos su
> comunicación. Lamentamos los inconvenientes…'. Cerrá indicando el canal para hacer seguimiento."

**Qué cambió:** se sumó contexto (quién y para qué), claridad (extensión y tono), rol (atención al
ciudadano) y un ejemplo de estructura. El resultado pasa de genérico a utilizable como borrador.

**Observación de verificación (ejemplo):** el plazo o la frecuencia de recolección que aparezca en la
respuesta debe comprobarse contra la **ordenanza o el plan de servicios vigente** del municipio, no
darse por cierto.

## 2. Criterios de corrección

| Criterio | Qué se observa | Cumple si… |
|---|---|---|
| **Claridad** | Qué, formato, extensión, tono | El prompt define al menos dos de estos elementos |
| **Contexto** | Para quién y para qué | El prompt sitúa la tarea en una situación institucional |
| **Rol o ejemplos** | Papel asumido o modelo a seguir | Aparece al menos uno (no es obligatorio, pero eleva el nivel) |
| **Iteración** | Prompt v1 → v2 | Hay dos versiones y una mejora explicada |
| **Verificación** | Observación de verificación | Nombra un dato/cifra/norma y una fuente oficial |
| **Confidencialidad** | Cuidado de la información | Usa caso ficticio o público y no pega datos de personas |

> Recordar la escala del módulo: 1–59 insuficiente · 60–69 básico · 70–84 suficiente · 85–94 alto · 95–100 excelente.

## 3. Errores frecuentes y cómo orientarlos

| Error | Cómo se detecta | Cómo orientar |
|---|---|---|
| Prompt vago | "Resumí esto" sin formato ni destinatario | Pedir extensión, tono y para quién; comparar antes/después |
| No iterar | Solo hay v1 | Recordar que la primera respuesta es un **borrador**; pedir una segunda versión |
| Verificar de menos | No hay observación de verificación | Preguntar: "¿qué dato comprobarías y dónde?" |
| Confiar en datos del modelo | Repite cifras o normas sin chequear | Explicar **alucinación** y **fecha de corte**; verificar contra la fuente oficial |
| Pegar datos reales de ciudadanos | El prompt contiene nombres, documentos o un expediente real | Detener, reemplazar por un caso ficticio y repetir la **regla de confidencialidad** |
| Confundir el chat con un buscador | "Que me diga la normativa exacta" | Aclarar que genera lo probable; puede inventar. El chat no siempre consulta la web |
| Describir el estilo en vez de mostrarlo | Pide "con estilo formal" sin ejemplo | Usar **few-shot**: dar un ejemplo del formato esperado |

## 4. Rúbrica con niveles (Sesión 9)

| Nivel | Descriptor |
|---|---|
| **Insuficiente (1–59)** | Prompt vago, sin claridad ni contexto; no itera ni verifica; usaría datos reales de ciudadanos. |
| **Suficiente (70–84)** | Incluye claridad y contexto; itera al menos una vez y señala algo a verificar. |
| **Alto (85–94)** | Incluye claridad, contexto y rol o ejemplos; el prompt es reutilizable; itera y explica qué cambió. |
| **Excelente (95–100)** | Todo lo anterior, más: verifica un dato contra la **fuente oficial** y explicita la **regla de confidencialidad**. |

> La rúbrica completa del bloque (sesiones 8, 9 y 10 y trabajo final) está en `rubrica-modulo.md`.

## 5. Confidencialidad — recordatorio para el docente

- La práctica se hace con **casos ficticios o públicos**; si alguien trae un caso real, se **anonimiza** antes de pegar nada.
- Enlazar con el **Bloque 5**: publicar un dato abierto con licencia es distinto de subir datos personales a un servicio externo.
- Mensaje para el grupo: **el agente sugiere, el humano decide**; y la **responsabilidad es del funcionario**, no de la herramienta.
