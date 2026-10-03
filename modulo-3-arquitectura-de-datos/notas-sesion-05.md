# Notas del orador — Sesión 5
**Deck:** `deck-sesion-05.html` · 16 diapositivas · 180 min
**Tema:** Arquitectura: patrones y diseño

> Guion punteado por diapositiva. Cada viñeta es algo para decir en voz alta;
> **No olvidar** marca lo imprescindible.

---

## Slide 1 — Arquitectura: patrones y diseño
- Dar la bienvenida, presentarse y ubicar la sesión: Bloque 3, Sesión 5, el tramo que cierra la arquitectura de datos.
- Recuperar en dos frases la Sesión 4: ya sabemos qué es una arquitectura y que tiene cuatro piezas (almacenamiento, procesamiento, catálogo y gobernanza); hoy vemos cómo se combinan y cómo se diseña una.
- Anunciar el recorrido del día: primero los cuatro patrones, después la comparativa, luego el proceso de diseño paso a paso y al final el taller con entrega.
- Aclarar que el público no necesita programar: hoy se trata de elegir bien y justificar, no de configurar herramientas.
- **No olvidar:** avisar desde el arranque que hay una pausa de 10 minutos a mitad de sesión y que la jornada termina con un taller cuyo entregable se recoge.

## Slide 2 — Hoja de ruta
- Leer la tabla en voz alta y fijar el contrato de tiempo: 35 minutos de patrones, 10 de comparativa, 30 de diseño paso a paso, 75 de taller y 10 de cierre.
- Explicar que el tramo de taller incluye el trabajo en equipos y la puesta en común; por eso es el bloque más largo de la jornada.
- Señalar dónde cae la pausa: después de la comparativa y antes de empezar el diseño paso a paso.
- Anticipar que el cierre deja un puente hacia la Sesión 6, con la integración de datos, ETL y orquestación.
- **No olvidar:** pedir al grupo que vaya anotando sus dudas, porque el cierre reserva 10 minutos para preguntas.

## Slide 3 — Encuadre
- Instalar la definición de trabajo: un **patrón** es una forma típica y probada de organizar los datos para un propósito; no se inventa cada vez, se elige.
- Presentar las tres preguntas que recorrerán toda la sesión: dónde se guarda, cómo se procesa y quién lo usa con qué reglas.
- Lanzar el enganche: "¿necesitan sus datos para reportes del mes pasado, para análisis del momento, o para ambos?" y anotar las respuestas en la pizarra.
- Cerrar el encuadre nombrando las dos tareas del arquitecto: **elegir** con fundamento y **documentar** en un plano.
- **No olvidar:** dejar las respuestas del enganche escritas en la pizarra; se reutilizan en la comparativa y en el cierre.

## Slide 4 — Los cuatro patrones
- Anunciar que veremos cuatro patrones conocidos y probados: data warehouse, data lake, data lakehouse y lambda.
- Aclarar que no son cuatro tecnologías, sino cuatro formas de organizar el dato según su propósito.
- Adelantar la idea que ordena todo el bloque: no hay un patrón mejor, hay uno adecuado para cada caso.
- Enumerar los criterios de elección que se usarán: el caso, el volumen, la estructura del dato y la necesidad de tiempo real.
- **No olvidar:** insistir en que la elección se justifica en el caso y no en preferencias personales ni en modas tecnológicas.

## Slide 5 — Data warehouse
- Definir el data warehouse: guarda datos ya procesados, limpios y estructurados, listos para reportes y análisis.
- Destacar sus rasgos: esquema fijo, alta confiabilidad y consultas ágiles porque el dato llega ya depurado.
- Aterrizar con el ejemplo de la recaudación tributaria mensual por departamento, consolidada y validada para reportes de gestión.
- Reconocer el costo: exige transformar antes de guardar y resulta poco flexible ante datos nuevos o no estructurados.
- **No olvidar:** dejar claro que la confiabilidad del warehouse se paga con trabajo previo de limpieza y con menor flexibilidad.

## Slide 6 — Data lake
- Definir el data lake: guarda datos en su forma cruda y original, de cualquier tipo y a gran escala.
- Explicar la clave técnica en palabras simples: esquema al leer, es decir, la estructura se define cuando se consulta y no al guardar.
- Dar ejemplos institucionales: lecturas de medidores de agua, logs de sistemas y documentos escaneados sin procesar.
- Nombrar el riesgo: sin gobierno ni catálogo, el lake se convierte en un "pantano de datos" (data swamp) que nadie aprovecha.
- **No olvidar:** remarcar que el lake no elimina el orden; solo lo traslada del momento de guardar al momento de leer.

## Slide 7 — Data lakehouse
- Presentar el lakehouse como la combinación: la flexibilidad del lake con la estructura y el gobierno del warehouse.
- Explicar su ventaja central: guardar datos crudos y consultarlos con esquema dentro de un mismo repositorio.
- Ilustrar con datos crudos de trámites a los que se aplica esquema y gobierno, y sobre los que se generan reportes confiables.
- Señalar el costo: requiere más herramientas y una madurez de gobierno mayor que un lake o un warehouse por separado.
- **No olvidar:** decir que el lakehouse es la respuesta para quien quiere analizar sin perder el dato original.

## Slide 8 — Arquitectura lambda
- Explicar que lambda corre dos caminos en paralelo: una capa por lotes (batch) y una capa de velocidad en tiempo real.
- Describir la capa batch: procesa la historia completa con precisión, cada cierto tiempo (por ejemplo, cada noche).
- Describir la capa de velocidad: procesa lo que acaba de llegar, de inmediato, aunque con menor precisión.
- Ilustrar con tránsito: reportes históricos cada noche y, a la vez, alerta inmediata ante un congestionamiento.
- **No olvidar:** advertir el costo de lambda: mantener dos lógicas que a veces duplican trabajo y aumentan la complejidad.

## Slide 9 — Comparativa de patrones
- Recorrer la tabla columna por columna: qué guarda cada patrón, cuál es su foco principal y si cubre tiempo real.
- Detenerse en el contraste: warehouse y lake no cubren tiempo real; lakehouse lo cubre de forma parcial; lambda lo cubre plenamente.
- Usar cada fila para repasar un patrón en una frase y conectar con los ejemplos ya vistos.
- Escribir en la pizarra la regla de oro: no hay un patrón mejor, hay un patrón adecuado para cada caso.
- **No olvidar:** cerrar la comparativa anunciando la pausa de 10 minutos y anticipar que al volver empieza el diseño paso a paso.

## Slide 10 — Diseño paso a paso
- Presentar el diseño como un proceso ordenado de cinco pasos y no como una inspiración o un golpe de intuición.
- Nombrar la secuencia completa: entender el caso, mapear las fuentes, definir componentes, elegir el patrón y documentar.
- Fijar la idea de la pizarra: "el plano no es la casa"; el diseño va antes de pensar en herramientas.
- Aclarar que los cinco pasos sirven para cualquier caso y que hoy los recorreremos con un ejemplo de trámites de licencias.
- **No olvidar:** insistir en que saltarse el paso 1 o el 2 lleva a elegir tecnología sin haber entendido la necesidad.

## Slide 11 — Pasos 1 y 2
- Desarrollar el paso 1: preguntar qué necesita la institución y qué preguntas debe responder con datos, y formular el objetivo en una frase.
- Dar el ejemplo del avance mensual de los trámites de licencias como objetivo concreto, periódico y medible.
- Desarrollar el paso 2: listar de dónde salen los datos y de qué tipo son, retomando lo visto en la Sesión 1.
- Ilustrar las tres fuentes del ejemplo: sistema de trámites (tablas), formularios web (JSON) y documentos escaneados.
- **No olvidar:** el orden importa: primero el caso y las preguntas, y solo después los datos que van a hacer falta.

## Slide 12 — Pasos 3 y 4
- Definir los cuatro componentes del paso 3 con una pregunta cada uno: almacenamiento (dónde), procesamiento (cómo), catálogo (qué es) y gobernanza (quién y con qué reglas).
- Dar el ejemplo completo: base operacional, data warehouse, proceso nocturno, diccionario de datos y política de acceso.
- Desarrollar el paso 4: elegir el patrón según el caso — warehouse para reportes confiables, lake para datos crudos, lakehouse para ambos y lambda para lotes más tiempo real.
- Aterrizar el ejemplo: warehouse para reportes mensuales confiables, porque el caso pide exactitud y periodicidad.
- **No olvidar:** recordar que catálogo y gobernanza son capas transversales y no se pueden dejar fuera del plano.

## Slide 13 — Documentar
- Presentar el paso 5 como la prueba de que el diseño existe: dibujar el flujo desde la fuente hasta el uso, nombrar cada componente y registrar las reglas.
- Recorrer la plantilla sección por sección: caso y objetivo, fuentes de datos, componentes, patrón elegido, diagrama de flujo y reglas de gobernanza.
- Explicar que la plantilla completa es el entregable del taller y que se evalúa, sobre todo, su coherencia interna.
- Repasar los errores típicos que la plantilla ayuda a evitar: confundir almacenamiento con procesamiento y olvidar catálogo o gobernanza.
- **No olvidar:** documentar es tan importante como dibujar; un diseño no documentado no se puede sostener ni auditar.

## Slide 14 — Taller
- Leer el caso en voz alta: reclamos en tres sistemas (ventanilla, teléfono y web), inspecciones en papel e indicadores armados a mano en Excel.
- Explicitar la meta doble: un reporte mensual confiable y una alerta inmediata cuando un reclamo crítico se repite en la misma zona.
- Dar la consigna y los tiempos: equipos de 4 a 5 personas, 60 minutos de trabajo con la plantilla y 15 minutos de puesta en común.
- Recordar los cinco pasos y el entregable del taller: diagrama de flujo, plantilla completa y justificación del patrón elegido.
- **No olvidar:** circular por los equipos recordando las tres preguntas (dónde, cómo, quién) y confirmar el énfasis de cada equipo (reportes, alerta o histórico).

## Slide 15 — Cierre
- Sintetizar las tres ideas de la jornada: no hay un patrón mejor, el diseño sigue un proceso ordenado y el diseño se documenta.
- Releer con el grupo la secuencia completa: caso, fuentes, componentes, patrón y documentación.
- Recuperar las respuestas del enganche inicial y mostrar cómo ahora cada necesidad se mapea a un patrón.
- Anticipar la Sesión 6: la integración de datos con ETL/ELT, automatización y orquestación.
- **No olvidar:** recoger las entregas del taller antes de cerrar; son la evidencia de aprendizaje del bloque.

## Slide 16 — Gracias
- Agradecer la participación y el trabajo de los equipos durante el taller.
- Abrir el espacio de preguntas, priorizando las que quedaron anotadas durante la pausa.
- Reiterar que la próxima sesión abre el Bloque 4 con la integración de datos, ETL y orquestación.
- Indicar dónde encontrar el material de la sesión y recordar los canales de contacto.
- **No olvidar:** despedirse confirmando día y hora de la próxima sesión.
