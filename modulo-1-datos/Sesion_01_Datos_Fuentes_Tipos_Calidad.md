# Sesión 1 — Datos: fuentes, tipos, importancia y calidad

**Módulo:** Ingeniería de Datos (IDT 601)
**Bloque:** 1 — Datos
**Duración:** 3 horas (180 min) — teóricas y prácticas
**Público:** Profesionales no especializados en ingeniería de datos

---

## Objetivos de la sesión

- Identificar de dónde provienen los datos (fuentes) y clasificarlos según su estructura.
- Distinguir datos estructurados, semiestructurados y no estructurados, y reconocer las implicaciones de cada tipo para su almacenamiento, procesamiento y análisis.
- Valorar por qué los datos son un activo estratégico para la gestión pública.
- Comprender las dimensiones básicas de la calidad de datos (completitud, exactitud y actualidad).
- Aplicar lo aprendido en un inventario breve de datos de un caso institucional.

## Ideas clave (qué debe quedar al final)

1. Todo dato proviene de una **fuente**; conocer la fuente ayuda a anticipar su forma y su calidad.
2. Los datos se clasifican por su **estructura**: estructurados (tablas), semiestructurados (JSON/XML) y no estructurados (texto libre, imagen, audio, video).
3. El tipo de dato condiciona **cómo se almacena, procesa y analiza**: no todos los datos se tratan igual.
4. Los datos **no son un subproducto**: son un insumo para describir, explicar y predecir, y sostienen decisiones sobre recursos y servicios.
5. Un dato de mala calidad puede llevar a decisiones equivocadas; la calidad se mira con tres lentes: **completitud, exactitud y actualidad**.
6. Antes de usar datos hay que **saber qué se tiene**: por eso se levanta un inventario.

## Cronograma sugerido (180 min)

| Bloque | Duración | Qué ocurre |
|---|---|---|
| Apertura y encuadre | 10 min | Bienvenida, encuadre del módulo y las preguntas de la sesión. |
| Fuentes de datos | 20 min | Recorrido por los orígenes más comunes de los datos. |
| Tipos de datos | 35 min | Estructurados, semiestructurados y no estructurados. |
| Implicaciones para el tratamiento | 20 min | Qué significa cada tipo al almacenar, procesar y analizar. |
| Pausa | 10 min | Receso. |
| Los datos como activo estratégico | 20 min | Por qué los datos importan para decidir. |
| Calidad de datos | 25 min | Completitud, exactitud y actualidad. |
| Taller relámpago: inventario de datos | 30 min | Clasificar fuentes y tipos; detectar problemas de calidad. |
| Cierre y preguntas | 10 min | Síntesis, dudas y puente a la Sesión 2. |

---

## Apertura y encuadre (10 min)

- Presentar brevemente el módulo (IDT 601) y ubicar el Bloque 1 — Datos como el punto de partida de todo el recorrido.
- Conectar con una idea simple: *"Para gestionar un servicio o para que un sistema aprenda, primero necesitamos datos. ¿De dónde salen, qué forma tienen y qué tan buenos son?"*
- Presentar las cuatro preguntas que ordenan la sesión: **¿de dónde provienen los datos?**, **¿qué forma tienen?**, **¿por qué valen?** y **¿qué tan buenos son?**
- Palabras clave que se usarán todo el día: **fuente, formato, estructura, tabla, JSON, texto libre, calidad**.

> Momento de enganche: preguntar al grupo *"¿qué datos genera su institución en un día normal?"* y anotar 4 o 5 ejemplos en una pizarra digital (o en el chat). Esos ejemplos se retoman en el taller final.

---

## Fuentes de datos (20 min)

Explicar que toda información que registramos proviene de alguna parte. Presentar las fuentes más comunes, con ejemplos cercanos a la gestión pública boliviana:

1. **Sistemas internos** — las aplicaciones y bases de datos propias de la institución (registro de trámites, nóminas, presupuesto, inventarios, padrón de contribuyentes). Suelen ser datos **ordenados y confiables**.
2. **Web y formularios en línea** — portales de servicios, formularios de contacto y reclamos. Pueden mezclar datos ordenados con texto libre.
3. **Sensores y dispositivos** — cámaras de tránsito, medidores de agua, GPS de patrullas o camiones, estaciones meteorológicas. Generan datos **continuos y en gran volumen**.
4. **Redes sociales y medios** — menciones, comentarios y publicaciones en las cuentas de la institución. Datos **textuales, desordenados y cambiantes**.
5. **Encuestas y censos** — respuestas estructuradas (opciones) y abiertas (opiniones). Combinan ambos mundos; por ejemplo, una encuesta de satisfacción al final de un trámite.

**Idea para la pizarra digital:**
- Fuente = **origen** del dato.
- Cada fuente entrega datos con una **forma** y una **calidad** características.

---

## Tipos de datos (35 min)

### Datos estructurados

- Organizados en **tablas** con filas y columnas bien definidas.
- Cada columna tiene un tipo fijo (número, fecha, texto corto, categoría).
- Se almacenan en **bases de datos** y hojas de cálculo.
- **Ejemplo:** una tabla de ciudadanos atendidos (cédula de identidad, nombre, trámite, fecha, estado).

### Datos semiestructurados

- No viven en una tabla rígida, pero **tienen una organización** que se puede leer (etiquetas, pares clave-valor).
- Formatos típicos: **JSON** y **XML**.
- **Ejemplo:** la respuesta de un formulario web o de una API:

```json
{
  "tramite": "reclamo",
  "fecha": "2026-08-25",
  "ciudadano": { "nombre": "Ana", "dni": "1234567" },
  "descripcion": "El alumbrado de la calle 5 no funciona"
}
```

### Datos no estructurados

- Sin una organización interna fija: **texto libre, imágenes, audio, video**.
- Son la mayoría de los datos del mundo y los más difíciles de procesar directamente.
- **Ejemplo:** un correo de reclamo escrito en lenguaje natural, una foto del bache de una calle, una grabación de una audiencia o el video de una cámara de tránsito.

### Tabla comparativa

| Tipo | ¿Cómo se ve? | Formato típico | Almacenamiento | Dificultad de procesar |
|---|---|---|---|---|
| Estructurado | Tablas de filas y columnas | BD, CSV, Excel | Base de datos | Baja |
| Semiestructurado | Etiquetas / clave-valor | JSON, XML | NoSQL, archivos | Media |
| No estructurado | Texto, imagen, audio, video | .txt, .jpg, .mp3 | Archivos, objetos | Alta |

**Idea para la pizarra digital:** un mismo elemento puede contener **varios tipos**. Una encuesta de satisfacción combina opciones estructuradas (1 a 5) con un comentario no estructurado.

---

## Implicaciones para el tratamiento (20 min)

Conectar cada tipo con lo que implica "tratarlo":

- **Estructurado:** se consulta con fórmulas o lenguajes de consulta; es fácil de ordenar, filtrar y resumir. Queda listo para reportes y tableros.
- **Semiestructurado:** hay que **interpretar** las etiquetas para extraer lo que importa; es flexible pero exige transformación.
- **No estructurado:** requiere técnicas específicas (procesamiento de texto, visión por computadora, transcripción) antes de poder analizarlo.

**Mensaje puente:** *"No se trata de que un tipo sea mejor que otro. Se trata de saber qué tipo es para elegir la herramienta correcta. Después veremos por qué estos datos son un activo y cómo medir su calidad."*

---

## Pausa (10 min)

---

## Los datos como activo estratégico (20 min)

- Los datos permiten **describir** (¿qué pasó?), **explicar** (¿por qué pasó?) y **predecir** (¿qué pasará?).
- En la gestión pública, los datos sostienen decisiones sobre recursos, servicios y políticas públicas.
- **Ejemplo:** saber cuántos trámites se atienden por día y en qué zonas permite decidir dónde abrir una ventanilla, reforzar personal o priorizar cuadrillas de alumbrado.

**Idea para la pizarra digital:**
- Dato + contexto = **información**; información + decisión = **valor**.

> Momento de enganche: preguntar *"¿qué decisión de su institución mejoraría si tuviera mejores datos?"*

---

## Calidad de datos (25 min)

Presentar las tres dimensiones básicas con ejemplos de gestión pública:

1. **Completitud** — ¿faltan datos?
   - *Ejemplo:* un formulario de reclamos donde el 40% no registra la zona. No podemos saber dónde concentrar la atención.
2. **Exactitud** — ¿los datos son correctos?
   - *Ejemplo:* direcciones con errores de tipeo o cédulas mal cargadas. Se decide sobre datos errados.
3. **Actualidad** — ¿los datos están al día?
   - *Ejemplo:* un padrón de contribuyentes sin actualizar en años. Se toman decisiones con una foto vieja.

| Dimensión | Pregunta | Riesgo si falla |
|---|---|---|
| Completitud | ¿Faltan datos? | No se puede focalizar ni comparar. |
| Exactitud | ¿Los datos son correctos? | Decisiones basadas en errores. |
| Actualidad | ¿Están al día? | Se decide con información vencida. |

**Mensaje puente:** *"Un dato incompleto, inexacto o desactualizado puede ser peor que no tener dato, porque da una falsa seguridad. En el taller vamos a mirar cada dato con estos tres lentes."*

---

## Taller relámpago: inventario de datos (30 min)

**Objetivo:** aplicar en un caso breve la clasificación de fuentes y tipos, y detectar problemas de calidad.

**Caso sugerido:** el Gobierno Autónomo Municipal de Río Verde y su Dirección de Atención Ciudadana (materiales `taller_sesion1_caso_estudio.md` y `taller_sesion1_inventario.csv`, usados aquí de forma abreviada).

**Pasos:**
1. Conformar equipos de 3–4 personas.
2. Leer el caso y detectar los datos que la institución maneja (reclamos del sistema, formulario web, comentarios en redes, cámaras de tránsito, encuestas, medidores de agua, recaudación, padrón de contribuyentes, actas escaneadas, registros en papel).
3. Por cada dato, completar en la planilla: **fuente**, **tipo**, **formato** y **frecuencia**.
4. Señalar al menos **un problema de calidad** (completitud, exactitud o actualidad) y proponer una mejora concreta.

**Puesta en común (incluida en los 30 min):** cada equipo comparte un dato bien inventariado y un problema de calidad detectado.

**Rol del docente:** rotar por las salas de trabajo para destrabar dudas de clasificación y orientar la reflexión sobre calidad.

**Criterios de evaluación:** tipos y fuentes bien clasificados, todos los campos de la planilla completos y observaciones de calidad específicas (no genéricas).

---

## Cierre y preguntas (10 min)

- Síntesis con el grupo: releer en voz alta la tabla comparativa de los tres tipos y las tres dimensiones de calidad.
- Reforzar la idea central: *"Conocer la fuente, el tipo y la calidad es el primer paso para gestionar los datos."*
- Anticipar la próxima sesión: *"La próxima vez empezamos a mover los datos: la ingesta (extraer y cargar información desde las fuentes) y los pipelines de datos."*
- Espacio de preguntas y dudas.

---

## Recursos

- Presentación (láminas con fuentes, tipos, valor del dato y calidad).
- Pizarra digital colaborativa para el esquema de fuentes y tipos.
- Muestras de archivos para mostrar en vivo: un CSV, un JSON, una imagen y un texto libre.
- Caso de estudio (`taller_sesion1_caso_estudio.md`) y planilla de inventario (`taller_sesion1_inventario.csv`) para el taller relámpago.
- Guía de taller (`taller_sesion1_guia.md`) como apoyo del docente.

## Evaluación de la sesión

| Criterio | Evidencia |
|---|---|
| Identifica las fuentes de origen de los datos | Participación en el enganche y en el taller |
| Clasifica correctamente los tipos de datos | Respuestas en el taller y en la planilla |
| Relaciona el tipo de dato con su tratamiento | Aportes en el bloque de implicaciones |
| Reconoce los datos como activo estratégico | Participación en la discusión del bloque |
| Detecta problemas de calidad (completitud, exactitud, actualidad) | Observaciones de calidad y mejoras propuestas |
| Usa la terminología adecuada | Precisión de términos en la puesta en común |

**Entrega:** inventario breve del caso trabajado (planilla con fuente, tipo, formato, frecuencia y observación de calidad).
