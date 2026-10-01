# Notas del orador — Sesión 2
**Deck:** `deck-sesion-02.html` · 15 diapositivas · 180 min
**Tema:** Ingesta de datos: conceptos, métodos y herramientas

> Guion punteado por diapositiva. Cada viñeta es algo para decir en voz alta;
> **No olvidar** marca lo imprescindible.

---

## Slide 1 — Ingesta: conceptos, métodos y herramientas
- Dar la bienvenida y presentarse; ubicar la sesión en el Bloque 2 — Ingesta de Datos, como continuación del Bloque 1 (de dónde vienen los datos y cómo se mide su calidad).
- Encuadrar la pregunta que ordena todo el día: *"¿cómo llegan los datos desde la fuente hasta el sistema?"*.
- Aclarar que el público no es especialista: no hace falta saber programar hoy, solo entender las ideas.
- Anunciar el recorrido en una frase: qué es ingerir, extraer y cargar, batch vs. streaming, herramientas y una práctica de conexión.
- **No olvidar:** avisar desde el arranque que habrá una pausa de 10 minutos tras el bloque de batch vs. streaming y que al final hay práctica de conexión.

## Slide 2 — Hoja de ruta
- Recorrer la tabla de tramos en voz alta y fijar el contrato de tiempo: 15 + 15 + 30 + 30 + 60 + 10 minutos.
- Explicar que el tramo "Práctica" agrupa la demostración del docente y la conexión guiada de cada participante.
- Señalar que la dinámica de clasificación batch/streaming va dentro del tramo de 30 minutos de modos de ingesta.
- Ubicar la pausa: después de batch vs. streaming, antes de herramientas.
- **No olvidar:** pedir que nadie se retire en la pausa sin haber anotado su duda, porque el cierre reserva 10 minutos para preguntas.

## Slide 3 — ¿Qué es la ingesta?
- Definir con palabras simples: ingerir es **tomar datos de una o varias fuentes y llevarlos** a un lugar donde se puedan almacenar, procesar o analizar.
- Instalar la metáfora central del bloque: la ingesta es el **puente** entre la fuente y el destino; no es análisis, es el paso previo que lo hace posible.
- Contar el ejemplo de la alcaldía: recaudación, trámites y reclamos de un mes dispersos; si nadie los "trae", el informe de gestión no existe.
- Aterrizar en la institución del público: preguntar quién arma hoy un informe juntando datos a mano.
- **No olvidar:** dejar claro que sin ingesta no hay análisis ni reporte; es el primer paso operativo del ciclo de vida de los datos.

## Slide 4 — Qué hace la ingesta
- Explicar las tres tareas como una secuencia: **recolectar** (juntar lo disperso), **transportar** (mover al destino confiable) y **preparar el terreno** (dejar listo para almacenar y procesar).
- Dibujar el esquema en la pizarra: ingesta = recolectar + transportar + dejar listo.
- Justificar por qué importa con tres beneficios: **evita decisiones a ciegas**, **ahorra trabajo manual** y **habilita** el análisis y el aprendizaje automático.
- Dar un caso cotidiano: horas de copiar y pegar planillas que una ingesta automatizada reemplaza.
- **No olvidar:** remarcar que la ingesta no decide ni interpreta; su valor es que los datos *lleguen* completos y a tiempo.

## Slide 5 — Extracción y carga
- Presentar **extracción** como tomar el dato de su origen (base de datos, archivo, formulario, API, sensor) y saber dónde está y cómo acceder.
- Presentar **carga** como llevar el dato a su destino (base central, almacén, archivo consolidado) sabiendo a dónde va y en qué formato queda.
- Escribir el recorrido en la pizarra: Fuente → extraer → (transformar) → cargar → Destino.
- Avisar que entre los extremos casi siempre hay una **transformación** (limpiar, renombrar, convertir formatos) que se verá más adelante en el módulo.
- **No olvidar:** la frase que resume todo: *"extraer sin cargar es quedarse con el dato en la mano; cargar sin extraer no es posible"*.

## Slide 6 — Dos formas de ingerir
- Introducir que hay dos grandes modos: **por lotes (batch)** —acumular y mover en bloques, a intervalos— y **en tiempo real (streaming)** —mover cada dato en cuanto llega.
- Plantear la pregunta que decide todo: **¿cuán frescos deben estar los datos?** y **¿cuánto cuesta mantenerlos así?**.
- Anticipar que ninguna es mejor: la elección depende de la necesidad de frescura y del costo de operarla.
- Anunciar que vienen dos slides con cada modo y luego una comparación y una dinámica.
- **No olvidar:** pedir al grupo que escuche pensando en sus propios casos; la dinámica los usará.

## Slide 7 — Ingesta por lotes
- Describir el batch: los datos se **acumulan** y se mueven **juntos**, a intervalos (cada hora, cada noche, cada mes).
- Destacar que es la forma **más común y económica**, y que **tolera bien los errores** porque el lote entero se puede reintentar.
- Nombrar su límite: hay un **desfase**; los datos no están al instante.
- Ilustrar con el ejemplo local: cada noche se consolida la recaudación del día; cada fin de mes se cierran los trámites.
- **No olvidar:** subrayar que el batch es la base de casi toda la operación diaria de una institución pública.

## Slide 8 — Ingesta en tiempo real
- Describir el streaming: cada dato se mueve **en cuanto se genera**, sin esperar a acumular.
- Explicar cuándo se usa: cuando la **frescura importa** y el volumen es continuo.
- Reconocer su costo: es **más compleja y costosa** de operar y mantener.
- Ilustrar con ejemplos: un tablero en vivo de reclamos, o lecturas de semáforos y medidores minuto a minuto.
- **No olvidar:** aclarar que el streaming se reserva para lo que no puede esperar (alertas, monitoreo); no es la opción por defecto.

## Slide 9 — Batch vs streaming
- Recorrer la tabla criterio por criterio, leyendo en voz alta las dos columnas: cuándo se mueve, frescura, costo, tolerancia a errores y uso típico.
- Detenerse en la **frescura**: horas o días en batch frente a segundos o menos en streaming.
- Traducir la tabla a una regla práctica: batch para reportes, cierres e históricos; streaming para alertas, tableros en vivo y sensores.
- Insistir en que no hay una "mejor": **batch cubre casi todo; streaming se reserva para lo urgente**.
- **No olvidar:** cerrar el slide lanzando la dinámica de clasificación para que el grupo aplique la tabla.

## Slide 10 — Método y herramienta
- Separar las dos decisiones: el **método** responde *¿cómo y cuándo movemos los datos?* (batch o streaming); la **herramienta** responde *¿con qué lo hacemos?* (conectores, scripts, APIs).
- Enfatizar que se eligen **por separado**: primero se decide el método según la necesidad, después la herramienta según la fuente y el entorno.
- Aclarar que confundirlos es el error más común: "usar Python" no es un método, es una herramienta.
- Anunciar que el próximo bloque entra de lleno en las herramientas.
- **No olvidar:** dejar escrito en la pizarra el par de preguntas "¿cómo y cuándo?" / "¿con qué?" para usarlo durante toda la práctica.

## Slide 11 — Herramientas tres familias
- Presentar las tres familias de un vistazo: **conectores** (piezas ya hechas), **scripts** (código propio) y **APIs** (puertas de acceso estandarizadas).
- Explicar cada una con su ejemplo: conector que lee una hoja de cálculo y la vuelca en el almacén; script en Python que abre un CSV y lo inserta en la base; API del registro civil o de clima que entrega datos en JSON.
- Señalar la ventaja y el límite de cada familia: el conector es rápido pero depende de que exista; el script da control total pero hay que mantenerlo; la API automatiza pero exige entender su contrato.
- Contar cómo evoluciona una institución: empieza con archivos y scripts, y suma conectores y APIs cuando la ingesta se vuelve repetida y crítica.
- **No olvidar:** aclarar que estas tres familias sirven tanto para batch como para streaming; la herramienta no define el método.

## Slide 12 — Herramientas comparadas
- Recorrer la tabla de las tres familias con las columnas qué es, cuándo usarla y si requiere programar.
- Remarcar que el **conector** es cuestión de configuración, el **script** exige programar y mantener, y la **API** requiere un poco de programación (llamadas) y entender endpoints, claves y límites.
- Dar la heurística de elección: fuente conocida y repetida → conector; caso a medida → script; el sistema ofrece API → úsala.
- Vincular con la práctica que viene: cada participante reconocerá qué familia usó.
- **No olvidar:** repetir que la mayoría de las instituciones no necesita programar para empezar; con conectores y APIs sencillas ya se ingiere.

## Slide 13 — Práctica
- Dar la consigna con los tres pasos: **1) extrae** (abrir el CSV o la API e identificar el formato), **2) carga** (llevar los datos a la herramienta del entorno y visualizarlos), **3) registra** (anotar qué método y qué herramienta se usó).
- Presentar las fuentes sugeridas: un CSV de trámites o recaudación, una API pública de clima o una hoja de cálculo compartida.
- Fijar el objetivo concreto: lograr una **conexión exitosa** y ver los datos en pantalla (filas y columnas, o respuesta JSON).
- Circular por los puestos para destrabar errores y verificar que todos logren ver el resultado.
- **No olvidar:** al cerrar cada puesto, pedir que expliquen en voz alta qué método y qué herramienta usaron; esa explicación es la evidencia de aprendizaje.

## Slide 14 — Cierre
- Sintetizar en tres frases: la ingesta es el **puente** entre fuentes y sistemas; el **método** es el cómo y cuándo; la **herramienta** es el con qué.
- Releer con el grupo, en voz alta, la regla final: batch para casi todo, streaming para lo urgente y continuo.
- Recuperar dos o tres respuestas del enganche inicial y mostrar cómo ahora se clasifican (batch o streaming) y con qué herramienta.
- Anticipar la próxima sesión: decisiones de diseño y patrones de implementación de **pipelines de ingesta**, con análisis de escenarios.
- **No olvidar:** recordar la entrega: el resultado visible de la práctica con la explicación del método y la herramienta empleados.

## Slide 15 — Gracias
- Agradecer la participación y el trabajo en la práctica.
- Abrir el espacio de preguntas y dudas, priorizando las anotadas durante la pausa.
- Reiterar que la próxima sesión trabaja los patrones de diseño e implementación de pipelines de ingesta.
- Dejar los canales de contacto y recordar dónde encontrar el material y la guía de la práctica.
- **No olvidar:** despedirse confirmando día y hora de la próxima sesión.
