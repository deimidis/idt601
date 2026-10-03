# Notas del orador — Sesión 4
**Deck:** `deck-sesion-04.html` · 16 diapositivas · 180 min
**Tema:** Arquitectura de datos: conceptos y componentes

> Guion punteado por diapositiva. Cada viñeta es algo para decir en voz alta;
> **No olvidar** marca lo imprescindible.

---

## Slide 1 — Arquitectura de datos: conceptos y componentes
- Dar la bienvenida, presentarse y ubicar la sesión: **Bloque 3 — Arquitectura de Datos**, después de los bloques de Datos, Calidad y Almacenamiento.
- Conectar con lo ya visto: "ya sabemos de dónde salen los datos, cómo medir su calidad y dónde guardarlos; hoy: ¿cómo los organizamos para que toda la institución pueda usarlos?".
- Encuadrar el público no especialista: no hace falta saber programar, hablamos de **decisiones de diseño**.
- Anunciar la pregunta central de la sesión y el recorrido: definir, entender por qué importa, conocer las piezas y practicar.
- **No olvidar:** aclarar que hoy hay una práctica en equipos al final y que la sesión dura 180 minutos con una pausa.

## Slide 2 — Hoja de ruta
- Recorrer los seis tramos de la tabla y dar el ritmo: 25 min de concepto, 20 de por qué importa, 30 de componentes, 25 de flujo y diagramas, 50 de práctica y 10 de cierre.
- Ubicar la **pausa de 10 minutos** justo antes del bloque de los cuatro componentes.
- Avisar que la práctica de 50 minutos incluye la puesta en común, así que el tiempo es ajustado.
- Anticipar que todo el bloque gira sobre una frase clave que se escribirá en la pizarra y se retomará al cierre.
- **No olvidar:** decir explícitamente que la práctica final es obligatoria y que cada equipo se llevará un esquema sin etiquetas para completar.

## Slide 3 — ¿Qué es?
- Definir sin rodeos: la arquitectura de datos es el **plano** que define qué datos existen, dónde se guardan, cómo se mueven, quién los usa y con qué reglas.
- Recurrir a la analogía de la casa y el plano: antes de construir se dibuja dónde van las habitaciones, las cañerías y las conexiones eléctricas.
- Remarcar el límite del concepto: **no es un software**, es una **decisión de diseño** que antecede a la tecnología.
- Escribir en la pizarra: **plano ≠ ladrillo**; las herramientas implementan el diseño, no lo reemplazan.
- **No olvidar:** preguntar al grupo "¿alguna vez pidieron un dato a otra área y tardaron semanas, o lo recibieron con valores distintos?" y anotar 4 o 5 respuestas para retomarlas más adelante.

## Slide 4 — Tres preguntas
- Presentar las tres preguntas que toda arquitectura responde: **¿dónde vive?**, **¿cómo se mueve?**, **¿quién lo usa?**.
- Mapear cada pregunta con su componente: dónde → **almacenamiento**; cómo → **procesamiento**; quién y con qué reglas → **acceso y gobernanza**.
- Aclarar que estas tres preguntas son la columna vertebral del bloque y de toda la sesión.
- Pedir al grupo que repita las tres preguntas en voz alta para fijarlas.
- **No olvidar:** remarcar que estas preguntas son la base para identificar componentes en cualquier esquema, incluida la práctica.

## Slide 5 — Por qué importa
- Explicar las tres consecuencias de decidir sin arquitectura: **silos** (cada área guarda "su" dato), **duplicación** (el mismo dato capturado con valores distintos) y **desconfianza** (cada reporte cuenta una historia distinta).
- Enfatizar que sin plano común la institución **no puede crecer**: sumar una fuente o un servicio obliga a reconstruir todo desde cero.
- Retomar las respuestas anotadas en el enganche y mostrarlas como ejemplos reales de estos síntomas.
- Cerrar con el mensaje puente: **diseñar es barato; reparar una arquitectura improvisada es caro**.
- **No olvidar:** insistir en que el costo de no diseñar se paga después, en decisiones lentas y proyectos que no escalan.

## Slide 6 — Síntomas
- Recorrer la tabla de síntomas y traducir cada uno a la vida institucional cotidiana.
- Detenerse en el ejemplo fuerte: el **padrón de contribuyentes** que no coincide entre Recaudaciones y Catastro.
- Señalar los otros síntomas: datos encerrados por área, reportes lentos o manuales, migraciones traumáticas y reglas poco claras.
- Preguntar al grupo cuál de estos síntomas reconoce en su propia institución y pedir que lo describa en una frase.
- **No olvidar:** vincular el último síntoma (reglas poco claras) con la pregunta "¿quién es dueño del dato?", que se responderá al hablar de gobernanza.

## Slide 7 — Cuatro componentes
- Presentar la tabla con las **cuatro piezas**: almacenamiento, procesamiento, catálogo y gobernanza.
- Recorrer cada componente con su pregunta y un ejemplo: base de trámites y escaneos, consolidación nocturna de pagos, diccionario que define "DNI" y autorización para modificar el sueldo.
- Decir que estas cuatro piezas son la grilla con la que se leerá cualquier arquitectura de ahora en adelante.
- Preguntar al grupo: "si tuvieran que guardar, ordenar y repartir los datos de su institución, ¿qué piezas necesitarían?" y mapear sus respuestas a los cuatro componentes.
- **No olvidar:** dejar claro que ninguno es opcional ni intercambiable; cada uno responde una pregunta distinta.

## Slide 8 — Almacenamiento
- Definir el almacenamiento como la respuesta a **¿dónde vive el dato y en qué forma?**.
- Nombrar los tipos: bases de datos, **data warehouse**, **data lake** y archivos.
- Distinguir datos **estructurados** (tablas, como la base de trámites) de **no estructurados** (documentos escaneados, imágenes, audios).
- Usar el ejemplo local: la base de datos de trámites junto al repositorio de documentos escaneados del municipio.
- **No olvidar:** diferenciar el almacenamiento operacional (donde se registra el día a día) del de análisis (donde se consolida para consultar).

## Slide 9 — Procesamiento
- Definir el procesamiento como la respuesta a **¿cómo se mueven y transforman los datos?**: limpieza, unión y cálculo de indicadores.
- Presentar las dos velocidades: por **lotes** (batch, cada noche) y en **tiempo real** (streaming).
- Usar el ejemplo: cada noche se consolidan los pagos del día para actualizar el reporte de recaudación.
- Explicar la analogía de la **"cocina"**: el procesamiento convierte datos crudos en datos utilizables.
- **No olvidar:** aclarar que procesar no es guardar ni mover por mover; el objetivo es que el dato quede listo para usarse.

## Slide 10 — Catálogo
- Definir el catálogo como la respuesta a **¿qué datos existen y qué significan?**.
- Explicar qué documenta cada dato: definición, formato, dueño y origen.
- Introducir el término **metadatos** y su forma más conocida: el diccionario de datos.
- Ejemplificar con "DNI": un diccionario que define que es el número de identificación oficial, con su formato y el área responsable.
- **No olvidar:** sin catálogo nadie sabe qué significa cada campo; es lo que permite que dos áreas hablen del mismo dato con el mismo nombre.

## Slide 11 — Gobernanza
- Definir la gobernanza como la respuesta a **¿quién puede usarlo y con qué reglas?**.
- Enumerar lo que cubre: calidad, seguridad, privacidad, responsabilidad y acceso.
- Explicar que establece los **dueños del dato** y las condiciones de uso.
- Usar el ejemplo: solo el área de personal modifica el sueldo; ver datos personales exige autorización.
- **No olvidar:** remarcar que la gobernanza no es burocracia; es lo que hace que el dato sea confiable y seguro.

## Slide 12 — El flujo
- Dibujar el flujo completo en la pizarra: **Fuente → Almacenamiento → Procesamiento → Uso**.
- Explicar cada paso: los datos nacen en sistemas, formularios y sensores; se guardan; se limpian, unen y transforman; quedan disponibles para reportes y decisiones.
- Señalar la idea central: el **catálogo** y la **gobernanza** no son una etapa del flujo, son **capas transversales** que atraviesan todo el trayecto.
- Aclarar el error frecuente de dibujarlos como "una caja más" en la fila.
- **No olvidar:** repetir que todo el trayecto está documentado (catálogo) y regulado (gobernanza), de la fuente al uso.

## Slide 13 — Leer un diagrama
- Presentar el procedimiento de cinco preguntas para leer cualquier esquema: ¿dónde nacen?, ¿dónde se guardan?, ¿qué los transforma?, ¿dónde está su definición?, ¿quién controla el acceso?.
- Mostrar o dibujar un esquema sencillo y responder las cinco preguntas en voz alta junto con el grupo.
- Enfatizar que este mismo procedimiento se usará en la práctica, solo que en equipos y con otro esquema.
- Señalar que no hace falta saber tecnología: basta con responder las cinco preguntas para entender un diagrama.
- **No olvidar:** este slide es el **puente** hacia la práctica; no pasar de largo sin haber leído un diagrama en conjunto.

## Slide 14 — Práctica
- Dar la consigna: en equipos de **3 a 4 personas**, con un esquema sin etiquetas y una hoja de trabajo con las cuatro categorías.
- Explicar los tres pasos: etiquetar cada caja y flecha con su componente, justificar la elección y describir el flujo de la fuente al uso.
- Recordar el tiempo: 50 minutos en total, incluida la puesta en común.
- Circular entre los equipos para destrabar dudas y orientar la lectura del esquema.
- **No olvidar:** en la puesta en común cada equipo expone **un componente y su justificación**; valorar que distingan almacenamiento de procesamiento y que reconozcan catálogo y gobernanza como capas transversales.

## Slide 15 — Cierre
- Sintetizar con el grupo las tres ideas: la arquitectura es el **plano**, cuatro componentes (**almacenamiento, procesamiento, catálogo y gobernanza**), y un **flujo** de la fuente al uso con capas transversales.
- Releer en voz alta la frase de la pizarra: **dónde / cómo / qué es / quién**.
- Reforzar el mensaje central: conocer los componentes permite **leer y diseñar cualquier arquitectura**.
- Anticipar la Sesión 5: los **patrones de arquitectura** — data warehouse, data lake, data lakehouse y lambda, también con práctica.
- **No olvidar:** dejar claro que la entrega es la hoja de trabajo con el esquema etiquetado, las justificaciones y la descripción del flujo.

## Slide 16 — Gracias
- Agradecer la participación y abrir el espacio de **preguntas y dudas**.
- Repasar brevemente el recorrido de la sesión para quienes quedaron con dudas puntuales.
- Recordar la entrega pendiente y el material de la Sesión 5.
- Cerrar con el puente: la próxima sesión sigue en el Bloque 3 con los patrones de arquitectura y diseño.
- **No olvidar:** quedarse disponible para consultas y confirmar el canal de contacto del curso.
