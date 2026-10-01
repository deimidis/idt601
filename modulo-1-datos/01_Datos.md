# Bloque 1 — Datos

**Módulo:** Ingeniería de Datos (IDT 601)
**Sesión:** 1 — Datos: fuentes, tipos, importancia y calidad
**Horas:** 4 teóricas + 2 prácticas

---

## ¿De qué trata este bloque?

Este bloque es el punto de partida de todo el módulo. Antes de hablar de ingesta, arquitectura o inteligencia artificial, hay que responder dos preguntas simples pero fundamentales: **¿de dónde salen los datos?** y **¿qué forma tienen?**.

La idea central es que los datos no aparecen solos: provienen de una **fuente** (un sistema, un formulario, un sensor, una red social), y según su origen y su estructura se comportan de manera distinta. Aprender a reconocer fuentes y tipos de datos es el primer paso para poder gestionarlos, limpiarlos y usarlos en la toma de decisiones.

---

## Lectura

### 1. Las fuentes de datos

Todo dato que una institución registra proviene de algún lugar. Las fuentes más comunes en la gestión pública son:

- **Sistemas internos** — las aplicaciones y bases de datos propias de la institución (registros de trámites, nóminas, presupuesto, inventarios). Suelen entregar datos ordenados y confiables.
- **Web y formularios en línea** — portales de servicios, formularios de contacto y reclamos. Mezclan campos ordenados con texto libre.
- **Sensores y dispositivos** — cámaras, medidores, GPS, semáforos inteligentes, estaciones meteorológicas. Generan datos continuos y en gran volumen.
- **Redes sociales y medios** — menciones, comentarios y publicaciones. Datos textuales, desordenados y en constante cambio.
- **Encuestas y censos** — respuestas cerradas (opciones) y abiertas (opiniones). Combinan ambos mundos.

Conocer la fuente ayuda a anticipar **la forma y la calidad** del dato. No es lo mismo un dato que sale de una base de datos interna (confiable y estructurado) que un comentario suelto en una red social (informal y difícil de procesar).

### 2. Los tipos de datos

Los datos se clasifican por su **estructura**, es decir, por cuán organizados están:

- **Estructurados** — viven en **tablas** con filas y columnas bien definidas. Cada columna tiene un tipo fijo (número, fecha, texto corto, categoría). Se almacenan en bases de datos y hojas de cálculo. Son los más fáciles de ordenar, filtrar y resumir.
  - *Ejemplo:* una tabla de ciudadanos atendidos (DNI, nombre, trámite, fecha, estado).

- **Semiestructurados** — no viven en una tabla rígida, pero **tienen una organización** que se puede leer mediante etiquetas o pares clave-valor. Los formatos típicos son **JSON** y **XML**.
  - *Ejemplo:* la respuesta de un formulario web que llega como un objeto JSON con etiquetas.

- **No estructurados** — sin organización interna fija: **texto libre, imágenes, audio, video**. Son la mayoría de los datos del mundo y los más difíciles de procesar directamente.
  - *Ejemplo:* un correo de reclamo escrito en lenguaje natural, una foto de un bache, una grabación de una audiencia.

La regla práctica: **el tipo de dato condiciona cómo se almacena, procesa y analiza**. Un dato estructurado se consulta con una fórmula; un dato no estructurado requiere técnicas específicas (procesamiento de texto, visión por computadora, transcripción).

### 3. Los datos como activo estratégico

Los datos permiten **describir** (¿qué pasó?), **explicar** (¿por qué pasó?) y **predecir** (¿qué pasará?). Por eso son un **activo**: un recurso que, bien gestionado, sostiene decisiones sobre recursos, servicios y políticas públicas.

Un ejemplo concreto: saber cuántos trámites se atienden por día y en qué zonas permite decidir dónde abrir una ventanilla o dónde reforzar personal.

### 4. La calidad de los datos

Un dato solo es útil si es de calidad. Hay al menos tres dimensiones que conviene revisar siempre:

1. **Completitud** — ¿faltan datos? (ej.: un formulario donde el 40% no registra la zona).
2. **Exactitud** — ¿los datos son correctos? (ej.: direcciones con errores de tipeo, DNI mal cargados).
3. **Actualidad** — ¿están al día? (ej.: un padrón sin actualizar en años).

Un dato incompleto, inexacto o desactualizado puede ser **peor que no tener dato**, porque da una falsa seguridad.

---

## Ideas clave

- Todo dato proviene de una **fuente**; conocerla anticipa su forma y calidad.
- Los datos se clasifican por su **estructura**: estructurados, semiestructurados y no estructurados.
- El **tipo** condiciona cómo se almacena, procesa y analiza.
- Los datos son un **activo estratégico** para la toma de decisiones.
- La **calidad** se revisa con tres lentes: completitud, exactitud y actualidad.

## Glosario

| Término | Definición |
|---|---|
| Fuente de datos | Origen del dato (sistema interno, web, sensor, red social, encuesta). |
| Dato estructurado | Dato organizado en tablas con filas y columnas (bases de datos, CSV). |
| Dato semiestructurado | Dato con etiquetas o clave-valor, pero sin tabla rígida (JSON, XML). |
| Dato no estructurado | Dato sin organización fija (texto, imagen, audio, video). |
| Calidad de datos | Grado en que los datos cumplen completitud, exactitud y actualidad. |

## Para repasar (autoevaluación)

1. ¿Cuáles son las cinco fuentes de datos más comunes en la gestión pública?
2. Da un ejemplo de cada tipo de dato (estructurado, semiestructurado, no estructurado).
3. ¿Por qué un dato de mala calidad puede ser peor que no tener dato?
4. Explica con un ejemplo cómo los datos ayudan a decidir en una institución pública.

## Referencias recomendadas

- Luis Joyanes Aguilar, *Big Data: Análisis de grandes volúmenes de datos en organizaciones* (Alfaomega, 2013). Tipos de datos, fuentes y tecnologías.
- Luis Joyanes Aguilar, *Ciencia de Datos: Un enfoque práctico de tecnologías, herramientas y aplicaciones* (Alfaomega, 2024). Taxonomías de datos y calidad.
- Open Knowledge Foundation, *Open Data Handbook* (opendatahandbook.org, en español). Introducción clara a los datos y su apertura.

## Presentaciones del bloque

- Sesión 1 — Datos: fuentes, tipos, importancia y calidad: `presentacion_sesion1.html` (reveal) y `deck-sesion-01.html` (deck).
