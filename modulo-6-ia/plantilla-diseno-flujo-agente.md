# Plantilla — Diseño del flujo de un agente

**Módulo:** IDT 601 · Bloque 6 · Sesión 10
**Equipo:** ____________________
**Caso elegido:** ☐ 1 asistente de trámites ☐ 2 clasificador de reclamos ☐ 3 resumidor de informes
☐ 4 verificador de expedientes ☐ 5 avisos a la ciudadanía

> Esta plantilla **diseña y documenta** el flujo del agente. No hace falta ejecutarlo en vivo: se
> completa con el criterio del equipo. El flujo define **qué haría** el agente y **dónde** interviene
> una persona.

## 1. La tarea

- **Problema que resolvemos:**
  _______________________________________________________________
- **Para quién (destinatario):**
  _______________________________________________________________
- **Resultado esperado:**
  _______________________________________________________________
- **Criterio de éxito (¿cómo sabremos que sirvió?):**
  _______________________________________________________________

## 2. Los cuatro componentes

| Componente | Cómo lo definimos en nuestro caso |
|---|---|
| **Modelo** (el cerebro) | Qué LLM usamos como motor y para qué razona: ______________________________________ |
| **Herramientas** (las manos) | Qué debe poder hacer: ☐ buscar ☐ leer documentos ☐ consultar una base ☐ calcular ☐ enviar. Detalle: ______________________ |
| **Memoria** (la agenda) | Qué debe recordar de la tarea: conversación, pasos hechos, fuentes usadas: ______________________ |
| **Planificación** (el método) | Cómo ordena los pasos: ☐ flujo definido por nosotros ☐ decide pasos por su cuenta. Pasos: ______________________ |

## 3. Pasos del flujo (en orden)

1. ______________________________________________________________________
2. ______________________________________________________________________
3. ______________________________________________________________________
4. ______________________________________________________________________

> Cuidado: si el agente "decide por su cuenta", el **control** debe ser mayor. Preferimos un flujo
> definido por una persona.

## 4. Punto de control humano (obligatorio)

- **¿En qué paso revisa una persona?**
  _______________________________________________________________
- **¿Qué revisa exactamente?** (un dato, una cifra, una categoría, un listado, un texto)
  _______________________________________________________________
- **¿Qué decide la persona?** (aprobar, corregir, derivar, publicar, firmar)
  _______________________________________________________________
- **Menor privilegio (marcar):** el agente ☐ lee pero no envía ☐ sugiere pero no publica ☐ no
  modifica datos.
- **Trazabilidad:** registramos qué hizo y con qué fuentes: ☐ sí. Detalle: ______________________

## 5. Confidencialidad

- **¿Con qué datos trabajamos?** ☐ caso ficticio ☐ dato ya público ☐ documento abierto.
- **¿Qué NO se subiría al chat?** (datos de ciudadanos, documentos reservados, información no
  pública) _________________________________________________________
- **Regla:** si hay duda, **no se pega**. La responsabilidad es del funcionario, no de la
  herramienta.

## 6. Riesgos anticipados

| Riesgo | Cómo lo prevenimos |
|---|---|
| Alucinación (dato inventado) | |
| Sesgo (trato desigual) | |
| Acción indebida (envío o publicación) | |

**Entrega:** esta plantilla completada, junto con la plantilla de entrega de la mini-solución.
