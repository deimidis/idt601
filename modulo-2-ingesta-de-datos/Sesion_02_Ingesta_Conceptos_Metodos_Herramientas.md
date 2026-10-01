# Sesión 2 — Ingesta: conceptos, métodos y herramientas

**Módulo:** Ingeniería de Datos (IDT 601)
**Bloque:** 2 — Ingesta de Datos
**Duración:** 3 horas (180 min) — teóricas y prácticas
**Público:** Profesionales no especializados en ingeniería de datos

---

## Objetivos de la sesión

- Comprender qué es la ingesta de datos, por qué importa y cuál es su lugar en el ciclo de vida de los datos.
- Distinguir los conceptos de **extracción** y **carga** como los dos extremos del proceso de ingesta.
- Diferenciar la ingesta **por lotes (batch)** de la ingesta **en tiempo real (streaming)** y reconocer cuándo conviene cada una.
- Identificar las **herramientas habituales** de ingesta: conectores, scripts y APIs.
- Realizar una primera **conexión a una fuente de datos sencilla** como práctica.

## Ideas clave (qué debe quedar al final)

1. La ingesta es el **puente** entre las fuentes de datos y los sistemas que los almacenan o analizan.
2. Toda ingesta se compone de al menos dos momentos: **extraer** (tomar el dato de su origen) y **cargar** (llevarlo a su destino).
3. Hay dos grandes formas de ingerir: **por lotes (batch)** —acumular y mover en bloques— y **en tiempo real (streaming)** —mover a medida que llega cada dato.
4. No existe una sola forma de ingerir: hay **métodos** (cómo y cuándo mover) y **herramientas** (con qué mover), y conviene elegirlos por separado.
5. Las **herramientas** se agrupan en tres familias: **conectores** (piezas ya hechas), **scripts** (código propio) y **APIs** (puertas de acceso estandarizadas).
6. Conectar una fuente sencilla (un CSV, una hoja de cálculo o una API pública) ya es un **pipeline de ingesta en miniatura**.

## Cronograma sugerido (180 min)

| Bloque | Duración | Qué ocurre |
|---|---|---|
| Apertura y encuadre | 10 min | Bienvenida, ubicación del Bloque 2 y pregunta de enganche. |
| ¿Qué es la ingesta de datos? | 15 min | Definición, rol en el ciclo de vida y por qué importa. |
| Extracción y carga | 15 min | Los dos extremos del proceso, con ejemplos de gestión pública. |
| Batch vs. streaming | 30 min | Los dos modos de ingesta, cuándo usar cada uno y dinámica de clasificación. |
| Pausa | 10 min | Receso. |
| Herramientas: conectores, scripts y APIs | 30 min | Recorrido por las tres familias de herramientas. |
| Demostración guiada | 15 min | El docente muestra una conexión en vivo. |
| Práctica: conectar una fuente sencilla | 45 min | Trabajo guiado de conexión a una fuente de datos. |
| Cierre y preguntas | 10 min | Síntesis, dudas y puente a la siguiente sesión. |

---

## Apertura y encuadre (10 min)

- Ubicar el Bloque 2 — Ingesta de Datos como la continuación natural del recorrido: ya sabemos **de dónde vienen** los datos y cómo **medir su calidad** (Bloque 1); ahora toca **cómo moverlos**.
- Conectar con una idea simple: *"Tener datos guardados en muchos lugares no sirve si no podemos juntarlos para decidir. Alguien tiene que ir a buscarlos y traerlos. Eso es ingerir."*
- Presentar las preguntas que ordenan la sesión: **¿qué es la ingesta?**, **¿cómo movemos los datos?** y **¿con qué herramientas lo hacemos?**
- Palabras clave que se usarán todo el día: **ingesta, extracción, carga, batch, streaming, método, conector, script, API, pipeline**.

> Momento de enganche: preguntar al grupo *"¿cómo llegan hoy los datos de su área al lugar donde se consultan o analizan?"* y anotar 4 o 5 respuestas (a mano, archivos, correos, sistemas automáticos). Esos ejemplos se retoman en la dinámica de batch vs. streaming.

---

## ¿Qué es la ingesta de datos? (15 min)

Explicar que la ingesta es el **proceso de tomar datos de una o varias fuentes y llevarlos a un lugar donde se puedan almacenar, procesar o analizar**. Es el primer paso operativo del ciclo de vida: sin ingesta no hay análisis ni reporte.

La ingesta cumple tres tareas:

1. **Recolectar** — juntar información que ya existe pero está dispersa (planillas, sistemas, formularios, sensores).
2. **Transportar** — mover los datos desde su origen hasta un destino confiable.
3. **Preparar el terreno** — dejar los datos listos para el almacenamiento y el procesamiento que vienen después.

**Por qué importa:**

- **Evita decisiones a ciegas:** si los datos no llegan, la institución decide con información incompleta.
- **Ahorra trabajo manual:** una ingesta automatizada reemplaza horas de copiar y pegar.
- **Habilita todo lo demás:** calidad, análisis y aprendizaje automático dependen de que los datos fluyan.

**Ejemplo de gestión pública:** una alcaldía reúne cada mes los datos de recaudación, los trámites atendidos y los reclamos para armar un informe de gestión. Si nadie "trae" esos datos, el informe no existe.

**Idea para la pizarra:**
- Ingesta = **recolectar + transportar + dejar listo**.
- Es el **puente** entre la fuente y el destino.

---

## Extracción y carga (15 min)

Presentar los **dos extremos** de todo proceso de ingesta:

### Extracción

- Es **tomar** el dato de su origen (una base de datos, un archivo, un formulario, una API, un sensor).
- Implica saber **dónde está** el dato y **cómo acceder** a él.
- **Ejemplo:** descargar el reporte mensual de recaudación desde el sistema de impuestos.

### Carga

- Es **llevar** el dato a su destino (una base de datos central, un almacén de datos, un archivo consolidado).
- Implica saber **a dónde** va y en **qué formato** debe quedar.
- **Ejemplo:** volcar esos datos en la base central de la alcaldía para que todos los analistas los consulten.

**Entre los extremos:** en la práctica casi siempre hay un paso intermedio de **transformación** (limpiar, renombrar, convertir formatos). Ese proceso completo se trabajará más adelante en el módulo.

**Idea para la pizarra:**

```
Fuente ──extraer──► (transformar) ──cargar──► Destino
```

**Mensaje clave:** *"Extraer sin cargar es quedarse con el dato en la mano; cargar sin extraer no es posible. La ingesta es el recorrido completo."*

---

## Batch vs. streaming (30 min)

### Ingesta por lotes (batch)

- Se **acumulan** datos durante un período y se mueven **juntos**, a intervalos (cada hora, cada noche, cada mes).
- Es la forma **más común** y la más económica.
- **Ejemplo:** cada noche se consolida la recaudación del día; cada fin de mes se cierran los trámites.
- **Ventaja:** simple, barata, tolera bien los errores (se puede reintentar el lote entero).
- **Desventaja:** los datos no están al instante; hay un **desfase**.

### Ingesta en tiempo real (streaming)

- Cada dato se mueve **en cuanto se genera**, sin esperar a acumular.
- Se usa cuando la frescura importa y el volumen es continuo.
- **Ejemplo:** un tablero que muestra en vivo los reclamos que entran, o las lecturas de semáforos y medidores que llegan minuto a minuto.
- **Ventaja:** datos **siempre frescos**.
- **Desventaja:** más compleja y costosa de operar.

### Tabla comparativa

| Criterio | Batch (por lotes) | Streaming (tiempo real) |
|---|---|---|
| Cuándo se mueve el dato | En bloques, a intervalos | En cuanto llega |
| Frescura | Horas o días de desfase | Segundos o menos |
| Costo y complejidad | Baja | Alta |
| Tolerancia a errores | Fácil de reintentar | Más delicada |
| Uso típico | Reportes, cierres, históricos | Alertas, tableros en vivo, sensores |

### Dinámica: ¿batch o streaming? (incluida en los 30 min)

**Objetivo:** decidir, para cada caso, qué modo de ingesta conviene y por qué.

**Pasos:**
1. Conformar equipos de 3–4 personas.
2. Cada equipo recibe una lista breve de situaciones.
3. Responde: **¿batch o streaming?** y **¿por qué?**
4. Puesta en común breve: cada equipo comparte un caso y justifica su decisión.

**Casos sugeridos:**
- El cierre mensual de la nómina de la institución.
- Un tablero de emergencias que muestra incidentes en vivo.
- La consolidación nocturna de la recaudación diaria de impuestos.
- Las lecturas de semáforos inteligentes que se usan para ajustar el tránsito.
- El informe anual de ejecución presupuestaria.
- Alertas de que un trámite superó su plazo legal de respuesta.

**Guía de corrección:** valorar que distingan **frescura necesaria** (¿puede esperar?) y **costo** (¿vale la pena el esfuerzo en tiempo real?). La mayoría son batch; las alertas y los tableros en vivo son streaming.

**Mensaje puente:** *"No se trata de que una sea mejor que la otra: batch cubre casi todo lo que una institución necesita; streaming se reserva para lo que no puede esperar. Ahora veremos las herramientas concretas para hacer ambas."*

---

## Pausa (10 min)

---

## Herramientas: conectores, scripts y APIs (30 min)

Recordar que el **método** responde a *"¿cómo y cuándo movemos los datos?"* y la **herramienta** responde a *"¿con qué lo hacemos?"*. Presentar las tres familias:

### Conectores

- Piezas **ya construidas** que saben leer de una fuente o escribir en un destino específicos.
- Vienen incluidas en muchas plataformas de datos o herramientas de integración.
- **Ejemplo:** un conector que lee directamente una hoja de cálculo de Google o una base de datos PostgreSQL y la vuelca en el almacén, sin escribir código.
- **Ventaja:** rápido y confiable. **Límite:** sirven para fuentes conocidas; si la fuente es rara, quizá no exista conector.

### Scripts

- **Código propio** (en Python, R, etc.) que hace la extracción y la carga a medida.
- Dan **control total** sobre qué se mueve y cómo se transforma.
- **Ejemplo:** un script en Python que abre un CSV de recaudación, limpia los montos y los inserta en la base central.
- **Ventaja:** flexibilidad total. **Límite:** hay que saber programar y mantenerlo.

### APIs

- **Puertas de acceso estandarizadas** que exponen datos de un sistema para que otros los lean.
- Son la forma moderna en que los sistemas se pasan datos entre sí.
- **Ejemplo:** una API del registro civil que entrega datos de nacimiento a otra institución, o una API pública de clima que devuelve datos en JSON.
- **Ventaja:** acceso controlado y automatizable. **Límite:** hay que entender el contrato de la API (endpoints, claves, límites).

### Tabla comparativa

| Herramienta | ¿Qué es? | ¿Cuándo usarla? | ¿Requiere programar? |
|---|---|---|---|
| Conector | Pieza hecha para una fuente/destino | Fuentes conocidas y repetidas | No (configuración) |
| Script | Código propio | Casos a medida o transformaciones | Sí |
| API | Puerta de acceso estandarizada | Cuando el sistema la ofrece | Un poco (llamadas) |

**Mensaje puente:** *"La mayoría empieza con archivos y scripts, y agrega conectores y APIs cuando la ingesta se vuelve repetida y crítica. Ahora lo vamos a tocar en la práctica."*

---

## Demostración guiada (15 min)

- El docente muestra, en vivo, una conexión sencilla: leer un archivo CSV y mostrarlo en pantalla (o conectarse a una API pública de clima) usando una herramienta simple.
- Enfatizar los tres momentos vistos: **extraer** (leer la fuente), **transformar** (si aplica) y **cargar** (ver el resultado).
- Verificar que todos entienden el entorno antes de la práctica.

---

## Práctica: conectar una fuente sencilla (45 min)

**Objetivo:** lograr una conexión exitosa a una fuente de datos y visualizar su contenido.

**Pasos:**
1. Entregar a cada participante (o pareja) una fuente sencilla: un archivo CSV o una API pública documentada.
2. Guiar el primer intento: abrir la fuente, identificar su formato y cargarla en la herramienta del entorno.
3. Cada participante muestra en pantalla el resultado (filas/columnas o respuesta JSON).
4. Registrar: **¿qué método usamos (batch)?** y **¿qué herramienta (script/conector/API)?**

**Fuentes sugeridas:**
- Un CSV de muestra con datos de trámites o recaudación.
- Una API pública de clima que devuelve JSON.
- Una hoja de cálculo compartida de ejemplo.

**Guía de corrección:** valorar que la conexión funcione (se vean los datos) y que el participante sepa explicar qué método y herramienta usó.

**Criterios de evaluación:** conexión exitosa a la fuente y explicación del método/herramienta empleados.

---

## Cierre y preguntas (10 min)

- Síntesis con el grupo: releer en voz alta la tabla comparativa de herramientas y la de batch vs. streaming.
- Reforzar la idea central: *"Ingerir es mover los datos de donde están a donde se necesitan. El método es el cómo y cuándo; la herramienta es el con qué."*
- Anticipar la próxima sesión: *"La próxima vez veremos qué decisiones de diseño tomar al ingerir y los patrones más comunes para implementar un pipeline. Y analizaremos un escenario."*
- Espacio de preguntas y dudas.

---

## Recursos

- Presentación (láminas con definición de ingesta, extracción/carga, batch vs. streaming y tabla de herramientas).
- Pizarra o pizarra digital para los esquemas fuente → transformación → destino y método vs. herramienta.
- Ejemplos impresos para la dinámica de clasificación batch/streaming.
- Herramientas de demostración: entorno con un editor o una plataforma de datos simple, un CSV de muestra y una API pública documentada.
- Guía de la práctica con los pasos de conexión (`taller_sesion2_practica_online.md`).
- Dataset real: `datos/encuesta_profesores_recorte.csv` (AGETIC, datos abiertos, CC-BY).

## Evaluación de la sesión

| Criterio | Evidencia |
|---|---|
| Define con sus palabras qué es la ingesta de datos | Participación en el enganche y en la puesta en común |
| Distingue extracción de carga | Aportes en el bloque de extracción y carga |
| Diferencia batch de streaming y justifica la elección | Respuestas en la dinámica grupal |
| Reconoce conectores, scripts y APIs | Aportes en el bloque de herramientas |
| Conecta una fuente de datos sencilla | Resultado visible en la práctica |
| Explica el método y la herramienta usados | Registro y puesta en común de la práctica |

**Entrega:** resultado de la práctica de conexión (fuente abierta y visible) con la explicación del método y la herramienta empleados.
