# Notas del orador — Sesión 3
**Deck:** `deck-sesion-03.html` · 16 diapositivas · 180 min
**Tema:** Ingesta: patrones de diseño e implementación de pipelines

> Guion punteado por diapositiva. Cada viñeta es algo para decir en voz alta;
> **No olvidar** marca lo imprescindible.

---

## Slide 1 — Ingesta: patrones de diseño e implementación de pipelines
- Dar la bienvenida y ubicar la sesión en el **Bloque 2 — Ingesta de Datos**: ya sabemos qué es ingerir y con qué métodos; hoy decidimos **qué considerar** y **cómo construir** un pipeline de punta a punta.
- Presentar el propósito: "Decidir bien la ingesta y llevarla a la práctica"; aclarar que el público no es especialista y que no hace falta programar para aprovechar la sesión.
- Enganchar con una pregunta al grupo: "¿qué pasaría si el informe de mañana duplica datos, o si se pierden los trámites de hoy?".
- Anunciar el recorrido: consideraciones, patrones, el esqueleto del pipeline, taller y cierre.
- **No olvidar:** presentar las palabras clave del día (frecuencia, volumen, fiabilidad, patrón, idempotencia, CDC, pipeline, verificación) y avisar que hay una pausa de 10 minutos tras el bloque de patrones.

## Slide 2 — Hoja de ruta
- Recorrer la tabla de los siete tramos anunciando el tiempo de cada uno: consideraciones (30), patrones (30), pausa (10), del diseño al pipeline (25), taller (65), cierre (10).
- Subrayar que el taller es el corazón de la sesión: "la mayor parte del tiempo lo van a pasar construyendo, no escuchando".
- Explicar la lógica de secuencia: primero decidir, luego elegir el patrón, después construir y finalmente verificar.
- Acordar las reglas de convivencia y el manejo de la atención para 180 minutos.
- **No olvidar:** que la pausa va exactamente después del bloque de patrones y que todo el material del taller debe estar listo antes del receso.

## Slide 3 — Las preguntas
- Plantear que conectar una fuente una vez es fácil; lo difícil es que **funcione todos los días** sin duplicar y sin perderse datos.
- Leer las tres preguntas que ordenan toda la sesión: ¿qué considerar antes de ingerir?, ¿qué patrón reutilizable me sirve?, ¿cómo armo el pipeline completo?.
- Anotar en la pizarra 4 o 5 respuestas del enganche; esas ideas ilustran la fiabilidad y se retoman en el taller.
- Anticipar que cada pregunta corresponde a un tramo del día y que al final las tres se integran en un mismo pipeline.
- **No olvidar:** dejar claro que estas tres preguntas son el hilo conductor y que se responderán con el grupo, no de memoria.

## Slide 4 — Tres preguntas de diseño
- Explicar que **antes de elegir herramienta o método** hay que responder tres preguntas que condicionan todo el diseño.
- Recorrer la tabla: ¿cada cuánto? condiciona método y periodicidad; ¿cuánto? condiciona técnica y capacidad; ¿qué pasa si falla? condiciona reintentos, idempotencia y monitoreo.
- Insistir en que responderlas evita duplicados y pérdidas; no se elige herramienta antes de responderlas.
- Remarcar que estas decisiones son de gestión, no solo técnicas, y que por eso competen a personal no especialista.
- **No olvidar:** decir expresamente que el orden importa: primero se responde, después se elige el patrón y la herramienta.

## Slide 5 — Frecuencia y volumen
- Explicar **frecuencia**: determina el método (batch vs. streaming) y la periodicidad; la nómina una vez al mes, los reclamos varias veces al día.
- Explicar **volumen**: determina el esfuerzo y la técnica para no saturar; 500 registros mensuales son triviales, miles de medidores cada hora exigen otro diseño.
- Preguntar al grupo: "¿sus datos cambian cada minuto o cada trimestre? ¿crecen o se mantienen estables?".
- Vincular ambas dimensiones: mucha frecuencia y mucho volumen juntos obligan a cambiar de enfoque.
- **No olvidar:** aclarar que no hay una frecuencia o un volumen "correctos" en abstracto; dependen de para qué se usará el dato.

## Slide 6 — Fiabilidad
- Presentar la fiabilidad como la pregunta ¿qué pasa si falla? y como la que define las **garantías** de la ingesta.
- Introducir el concepto clave: **idempotencia** = repetir una carga no debe producir datos duplicados ni corrompidos.
- Contar el ejemplo de la carga nocturna: si falla y se reintenta, el informe no debe contar dos veces la misma recaudación.
- Señalar las preguntas guía: ¿se puede repetir sin duplicar? ¿sabemos si algo no llegó?.
- **No olvidar:** remarcar que la fiabilidad distingue una ingesta robusta de una que **falla en silencio**, y que es la base de la etapa de verificación.

## Slide 7 — Patrones de ingesta
- Definir **patrón**: una forma probada y reutilizable de resolver un problema recurrente; no hay que inventar de cero.
- Presentar los tres grupos de tarjetas: carga completa ("mover todo"), carga incremental ("solo lo nuevo") y CDC con pull/push ("cambios · eventos").
- Anticipar que elegir bien el patrón evita rehacer el trabajo y previene duplicados.
- Anunciar que cada patrón se detalla en las tres láminas siguientes.
- **No olvidar:** dejar claro que ningún patrón es mejor que otro en general; depende del escenario.

## Slide 8 — Completa e incremental
- Explicar la **carga completa**: se mueve todo el conjunto cada vez y se reemplaza lo anterior; usar en volúmenes pequeños o datos que cambian por completo.
- Dar el ejemplo del catálogo de códigos de trámites que se recarga entero cada mes.
- Explicar la **carga incremental**: se mueve solo lo nuevo o lo modificado desde la última carga; usar en volúmenes grandes y crecientes.
- Dar el ejemplo de agregar cada día solo los trámites nuevos, no toda la historia, y advertir que la incremental exige saber qué cambió desde la última vez.
- **No olvidar:** contrastar la pregunta clave entre ambas: ¿cuánto se mueve y cada cuánto?.

## Slide 9 — CDC y pull vs push
- Explicar la **captura de cambios (CDC)**: la propia fuente registra y entrega solo los cambios (altas, bajas, modificaciones); útil para cambios exactos y casi en tiempo real.
- Dar el ejemplo del registro civil que emite eventos al actualizar un dato.
- Explicar **pull vs. push** como quién inicia: pull, nuestro sistema va a buscar los datos (un script que consulta una API cada noche); push, la fuente nos envía los datos (una API que notifica un reclamo).
- Relacionar: push suele dar más frescura, pull da más control del horario y de la carga.
- **No olvidar:** aclarar que CDC responde a "qué cambió" y pull/push a "quién inicia"; son dimensiones distintas, no alternativas excluyentes.

## Slide 10 — Patrones lado a lado
- Leer la tabla con el grupo, patrón por patrón, y pedir que cada uno piense un caso de su institución.
- Reforzar la idea central de cada fila: completa (mover todo y reemplazar), incremental (mover solo lo nuevo), CDC (la fuente entrega los cambios), pull (nosotros buscamos), push (la fuente envía).
- Insistir: el patrón se elige según frecuencia, volumen y fiabilidad, **no por moda** ni por lo que usa otra área.
- Hacer el puente: "ya saben elegir; ahora veamos cómo se lleva todo esto a un pipeline".
- **No olvidar:** cerrar este bloque anunciando la pausa de 10 minutos y pedir que, al volver, traigan su escenario de caso pensado.

## Slide 11 — Qué es un pipeline
- Definir pipeline de ingesta como la **secuencia repetible** que lleva los datos desde la fuente hasta el destino.
- Subrayar que un pipeline funcional se puede **volver a correr mañana** y produce lo mismo, sin duplicados ni pérdidas.
- Mostrar que integra todo el bloque: **método** (batch/streaming), **herramienta** (script/conector/API) y **patrón** (completa/incremental/CDC).
- Contrastar con la idea de "script suelto": un pipeline es un proceso, no un apuro que se corre una sola vez.
- **No olvidar:** repetir la frase-ancla: "si no se puede volver a correr con el mismo resultado, todavía no es un pipeline".

## Slide 12 — El esqueleto en cuatro etapas
- Recorrer el flujo: **extraer** (leer la fuente: archivo, base de datos o API), **transformar** (corregir lo mínimo: columnas, formatos, nulos), **cargar** (escribir en el destino según el patrón elegido) y **verificar** (conteos, sin duplicados, valores sensatos).
- Aclarar que la transformación **no tiene que ser exhaustiva**: lo justo para que el dato sirva en el destino.
- Presentar la verificación como control transversal que vuelve confiable al pipeline: comparar conteos de entrada y salida, revisar valores sensatos.
- Dibujar el esquema en la pizarra: Fuente → extraer → transformar → cargar → Destino, con la verificación debajo.
- **No olvidar:** decir que estas cuatro etapas son el mismo esqueleto para cualquier caso del taller, aunque cambien la fuente y el destino.

## Slide 13 — Taller
- Dar la consigna del taller: construir y entregar un **pipeline de ingesta funcional** en parejas o equipos de 2–3 personas, con 65 minutos de trabajo.
- Explicar los tres movimientos de las tarjetas: 1) **diseñar** respondiendo frecuencia, volumen y fiabilidad y eligiendo un patrón; 2) **construir** extraer → transformar → cargar → verificar sobre la fuente CSV asignada; 3) **verificar** probando el pipeline y documentando qué hace cada etapa.
- Repartir la guía de laboratorio, la fuente CSV y el destino; aclarar el entregable y que cada equipo **demuestra su pipeline** al grupo.
- Fijar el rol del docente: circular, resolver dudas puntuales y recordar las cuatro etapas; intervenir solo si un equipo no avanza.
- **No olvidar:** recordar que se espera que prueben y se equivoquen; equivocarse y corregir es parte del trabajo, no un fracaso.

## Slide 14 — Escenarios de caso
- Asignar un escenario por equipo, buscando variedad: A) consolidar diariamente los trámites nuevos de una alcaldía; B) alimentar un tablero en vivo de reclamos; C) sincronizar cada mes el padrón completo; D) detectar al instante si un trámite supera su plazo legal; E) actualizar un inventario que cambia de a poco, una vez por semana.
- Pedir que cada equipo justifique su elección con las tres preguntas (frecuencia, volumen, fiabilidad) antes de escribir código.
- Guiar con preguntas, no con respuestas: para A y C, ¿completa o incremental?; para B y D, ¿CDC o push?.
- Valorar la **coherencia** entre el patrón elegido y el escenario, más que la perfección técnica.
- **No olvidar:** dejar claro que el escenario ambienta el caso pero lo que se entrega es un pipeline funcional, no un ensayo sobre el escenario.

## Slide 15 — Cierre
- Hacer una puesta en común breve de cada equipo: qué funcionó, qué fue lo más difícil y qué harían distinto.
- Sintetizar los tres movimientos del día: **considerar** (frecuencia, volumen y fiabilidad antes de mover un dato), **elegir** (completa, incremental, CDC o pull/push) y **construir** (extraer → transformar → cargar → verificar, de forma repetible).
- Releer la tabla comparativa de patrones y reforzar la idea central: "antes de ingerir, responde; luego elige el patrón y construye de forma repetible".
- Hacer el puente a la próxima sesión: la **arquitectura de datos**, conceptos y componentes que ordenan todo el recorrido del dato.
- **No olvidar:** agradecer el trabajo del taller y recordar que la entrega del pipeline con su breve documentación es la evidencia del bloque.

## Slide 16 — Gracias
- Cerrar con un agradecimiento breve y reconocer el esfuerzo del taller.
- Dejar unos minutos para preguntas, entrega y retroalimentación final de los pipelines.
- Recordar la ruta de contacto y el lugar donde se sube el entregable, si corresponde.
- Despedirse anticipando la próxima sesión: arquitectura de datos.
- **No olvidar:** no cerrar sin confirmar que todos los equipos entregaron o saben cómo entregar su pipeline.
