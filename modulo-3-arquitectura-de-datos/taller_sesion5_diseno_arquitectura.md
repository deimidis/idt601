# Taller — Sesión 5: diseñar la arquitectura de un caso institucional

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 3 — Arquitectura de Datos
**Duración:** 75 min de taller (10 de consigna + 50 de trabajo + 15 de puesta en común), dentro de la sesión de 3 horas
**Modalidad:** presencial o en línea (salas)
**Materiales:** esta guía, plantilla de diseño impresa o compartida, papelógrafos o pizarra digital

---

## Objetivo

Producir el **diseño de arquitectura completo y documentado** para el caso asignado: entender el caso, mapear fuentes, definir componentes, elegir y justificar el patrón, y dibujar y documentar el flujo con sus reglas de gobernanza.

## Caso institucional

> *Una gobernación quiere mejorar la atención al ciudadano. Hoy los reclamos se registran en tres sistemas (ventanilla, teléfono y formulario web), las inspecciones se anotan en papel y los indicadores se arman a mano en Excel. Se necesita un **reporte mensual confiable** de reclamos atendidos y una **alerta inmediata** cuando un reclamo crítico se repite en la misma zona.*

**Variantes por equipo** (para comparar elecciones de patrón):
- **Énfasis A — reportes mensuales:** prioriza datos limpios y confiables.
- **Énfasis B — alerta inmediata:** prioriza frescura de los datos.
- **Énfasis C — análisis histórico:** prioriza guardar todo para explorar después.

## Reparto del tiempo

| Momento | Tiempo | Quién |
|---|---|---|
| Apertura: consigna y conformación de equipos (4 personas) | 10 min | Docente |
| Trabajo en equipos con la plantilla | 50 min | Equipos |
| Puesta en común | 15 min | Todos |

## Pasos del trabajo en equipos

1. **Entender el caso.** Definir el objetivo y las preguntas que la arquitectura debe responder.
2. **Mapear las fuentes.** Listar de dónde salen los datos y qué tipo son (estructurado, semiestructurado, no estructurado).
3. **Definir los componentes.** Almacenamiento, procesamiento, catálogo y gobernanza (con atención a las capas transversales).
4. **Elegir y justificar el patrón.** Data warehouse, data lake, data lakehouse o lambda, y por qué.
5. **Dibujar y documentar.** Trazar el diagrama de flujo de la fuente al uso y completar las reglas de gobernanza.

## Plantilla de diseño

| Sección | Qué completar |
|---|---|
| **Caso y objetivo** | Qué necesita la institución y qué pregunta responde |
| **Fuentes de datos** | De dónde salen los datos y su tipo |
| **Componentes** | Almacenamiento, procesamiento, catálogo, gobernanza |
| **Patrón elegido** | Cuál y por qué (contrastar con al menos una alternativa descartada) |
| **Diagrama de flujo** | Esquema desde la fuente hasta el uso |
| **Reglas de gobernanza** | Quién accede, calidad y seguridad |

## Puesta en común

Cada equipo expone su diseño en **3–4 minutos**: diagrama, componentes y patrón elegido. El docente y los demás equipos preguntan: *¿por qué ese patrón? ¿cómo garantizan la calidad? ¿quién accede?*. Registrar en la pizarra las distintas elecciones de patrón para contrastarlas.

## Guía de corrección y bloqueos típicos

| Bloqueo | Cómo se detecta | Cómo orientar |
|---|---|---|
| Confunden almacenamiento con procesamiento | "Guardamos y limpiamos" en la misma caja | Separar dónde se guarda de lo que transforma. |
| Eligen patrón sin justificarlo | El patrón no se conecta con el caso | Volver a las cuatro preguntas: uso, volumen, estructura, tiempo real. |
| Olvidan catálogo y gobernanza | No aparecen en el diagrama | Recordar que son capas transversales obligatorias. |
| Ignoran el tipo de dato | Tratan igual el formulario web y las inspecciones en papel | Retomar los tipos de datos (Bloque 1). |

## Evaluación y entrega

| Criterio | Evidencia |
|---|---|
| Comprende el caso y define el objetivo | Sección "Caso y objetivo" de la plantilla |
| Mapea las fuentes y su tipo | Sección "Fuentes de datos" |
| Define los cuatro componentes | Sección "Componentes" |
| Elige y justifica el patrón | Sección "Patrón elegido" + alternativa descartada |
| Dibuja el flujo de la fuente al uso | Diagrama |
| Incluye catálogo y gobernanza | Diagrama + "Reglas de gobernanza" |
| Entrega un diseño coherente | Conjunto de la plantilla |

**Entrega por equipo:** diagrama de flujo + plantilla completa + justificación del patrón elegido.

## Variante en línea

Compartir la plantilla en una hoja colaborativa (Google Docs o Sheets). Cada equipo trabaja en su pestaña y dibuja el diagrama con una herramienta sencilla (Google Drawings, Miro o incluso una tabla). La puesta en común se hace proyectando cada diseño en la sala general.
