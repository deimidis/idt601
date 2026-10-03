<!-- .slide: class="cover" -->
<div class="kicker">Ingeniería de Datos · IDT 601</div>
<h1>Arquitectura: patrones y diseño</h1>
<p class="lead">¿Qué patrones existen y cómo se diseña una arquitectura?</p>
<div class="mark">Bloque 3 · Sesión 5 · EGPP</div>
<div class="cover-side" aria-hidden="true"><div class="code-stack"><span>diseño =</span><span>caso</span><span>+ componentes + patrón</span></div></div>

Note:
- Dar la bienvenida y presentarse; ubicar la sesión como el cierre práctico del Bloque 3 (Arquitectura de Datos).
- Recuperar la Sesión 4: ya conocemos qué es una arquitectura y cuáles son sus cuatro piezas; hoy vemos cómo se combinan en patrones probados.
- Anunciar el recorrido: cuatro patrones, comparativa, diseño paso a paso y taller con entrega.
- Aclarar que no hace falta programar; se trata de elegir con fundamento y documentar.
- **No olvidar:** avisar que hay una pausa de 10 minutos a mitad de sesión y que la jornada termina con un taller cuyo entregable se recoge.

---

## Hoja de ruta de la sesión

| Momento | Tiempo | Qué haremos |
|---|---|---|
| Patrones | 35 min | Warehouse, lake, lakehouse y lambda. |
| Comparativa | 10 min | Criterios para elegir un patrón. |
| Diseño paso a paso | 30 min | El proceso y la plantilla de diseño. |
| Taller | 75 min | Diseñar la arquitectura de un caso institucional. |
| Cierre | 10 min | Síntesis, dudas y puente a la Sesión 6. |

Note:
- Leer la tabla en voz alta y fijar el contrato de tiempo: 35 + 10 + 30 + 75 + 10 minutos.
- Explicar que el tramo de taller incluye el trabajo en equipos y la puesta en común.
- Señalar que la pausa de 10 minutos cae después de la comparativa y antes del diseño paso a paso.
- Anticipar que el cierre deja un puente hacia la Sesión 6 (integración de datos).
- **No olvidar:** pedir al grupo que anote sus dudas para el bloque de cierre.

---

## Las preguntas de la sesión

- ¿Qué **patrón** conviene para cada caso?
- ¿**Dónde** se guardan los datos?
- ¿**Cómo** se procesan?
- ¿**Quién** los usa y con qué reglas?

Elegir y documentar: las dos tareas del arquitecto de datos.

Note:
- Instalar la definición de patrón: una forma típica y probada de organizar los datos para un propósito.
- Recordar las tres preguntas de la sesión: dónde se guarda, cómo se procesa y quién lo usa con qué reglas.
- Lanzar el enganche: "¿necesitan sus datos para reportes del mes pasado, para análisis en el momento, o para ambos?" y anotar las respuestas en la pizarra.
- Nombrar las dos tareas del arquitecto: elegir con fundamento y documentar en un plano.
- **No olvidar:** dejar las respuestas del enganche escritas; se retoman en la comparativa y en el cierre.

---

## ¿Qué es un patrón de arquitectura?

Una **forma típica y probada** de organizar los datos para un propósito. No se inventa cada vez: se elige.

Hoy veremos cuatro:

1. **Data warehouse**
2. **Data lake**
3. **Data lakehouse**
4. **Lambda**

Note:
- Definir un patrón de arquitectura como una forma típica y probada; no se inventa cada vez, se elige.
- Enumerar los cuatro que veremos: data warehouse, data lake, data lakehouse y lambda.
- Adelantar que no son tecnologías, sino formas de organizar el dato según su propósito.
- Fijar los criterios de elección: el caso, el volumen, la estructura del dato y la necesidad de tiempo real.
- **No olvidar:** subrayar desde el inicio que no hay un patrón mejor, solo uno adecuado para cada caso.

---

## Data warehouse

Datos **ya procesados, limpios y estructurados**, listos para reportes.

- **Esquema fijo**, alta confiabilidad.
- Responde: *"¿cuánto recaudamos el trimestre pasado por departamento?"*

<div class="card">
<h3>Ejemplo</h3>
<p>Almacén institucional con recaudación tributaria mensual, depurada y validada para reportes de gestión.</p>
</div>

Note:
- Definir el warehouse: datos ya procesados, limpios y estructurados para reportes.
- Resaltar esquema fijo, alta confiabilidad y consultas ágiles.
- Dar el ejemplo de la recaudación tributaria mensual por departamento, depurada y validada.
- Reconocer el costo: transformar antes de guardar y poca flexibilidad ante datos nuevos.
- **No olvidar:** la confiabilidad se paga con trabajo previo de limpieza y con menor flexibilidad.

---

## Data lake

Datos en **forma cruda y original**, de cualquier tipo y a gran escala.

- **Esquema al leer**, flexible, bajo costo por volumen.
- Responde: *"guardar todo lo que se genera, aunque no sepamos para qué."*

<div class="card">
<h3>Ejemplo</h3>
<p>Repositorio con lecturas de medidores de agua, logs de sistemas y documentos escaneados sin procesar.</p>
</div>

Note:
- Definir el lake: datos en su forma cruda y original, de cualquier tipo y a gran escala.
- Explicar el esquema al leer: la estructura se define al consultar, no al guardar.
- Dar ejemplos: lecturas de medidores de agua, logs de sistemas y documentos escaneados.
- Nombrar el riesgo: sin gobierno se vuelve un "pantano de datos" (data swamp).
- **No olvidar:** el lake no elimina el orden; lo traslada del momento de guardar al momento de leer.

---

## Data lakehouse

**Combina** la flexibilidad del lake con la estructura y el gobierno del warehouse.

- Datos crudos **y** consultas con esquema en un mismo repositorio.

<div class="card">
<h3>Ejemplo</h3>
<p>Datos crudos de trámites con esquema y gobierno, sobre los que se generan reportes confiables.</p>
</div>

Note:
- Presentar el lakehouse como la combinación de la flexibilidad del lake con la estructura y el gobierno del warehouse.
- Explicar que permite guardar datos crudos y consultarlos con esquema en un mismo repositorio.
- Ilustrar con datos crudos de trámites con esquema y gobierno, sobre los que se generan reportes confiables.
- Señalar el costo: más herramientas y mayor madurez de gobierno.
- **No olvidar:** es la respuesta para quien quiere analizar sin perder el dato original.

---

## Arquitectura lambda

**Dos caminos en paralelo:**

1. **Capa batch (lotes):** la historia completa, precisa, cada cierto tiempo.
2. **Capa de velocidad (tiempo real):** lo que acaba de llegar, inmediato.

<div class="card">
<h3>Ejemplo</h3>
<p>Tránsito: reportes históricos cada noche + alerta en tiempo real ante un congestionamiento.</p>
</div>

Note:
- Explicar los dos caminos: capa batch (historia completa, con precisión, cada cierto tiempo) y capa de velocidad (lo recién llegado, inmediato, menos preciso).
- Dar el ejemplo del tránsito: reportes históricos cada noche y alerta inmediata ante un congestionamiento.
- Reconocer el costo: dos lógicas que mantener y a veces duplicar.
- Ubicar lambda como el patrón que cubre reportes confiables y alertas inmediatas a la vez.
- **No olvidar:** el beneficio de cubrir ambos mundos se paga con mayor complejidad de operación.

---

## Los cuatro, lado a lado

| Patrón | Qué guarda | Foco | Tiempo real |
|---|---|---|---|
| Data warehouse | Procesado y limpio | Reportes | No |
| Data lake | Crudo y diverso | Guardar todo | No |
| Data lakehouse | Crudo + esquema | Ambos | Parcial |
| Lambda | Batch + velocidad | Ambos | Sí |

Note:
- Leer la tabla columna por columna: qué guarda cada patrón, su foco principal y el tiempo real.
- Contrastar: warehouse y lake no cubren tiempo real; el lakehouse lo cubre parcialmente; lambda sí.
- Repasar cada fila en una frase, conectando con los ejemplos ya vistos.
- Escribir la regla de oro en la pizarra: no hay uno mejor, hay uno adecuado.
- **No olvidar:** cerrar anunciando la pausa de 10 minutos y anticipar que al volver empieza el diseño paso a paso.

---

## Diseñar es un proceso ordenado

1. **Entender el caso** — qué necesita la institución.
2. **Mapear las fuentes** — de dónde salen los datos.
3. **Definir los componentes** — las cuatro piezas.
4. **Elegir el patrón** — warehouse, lake, lakehouse o lambda.
5. **Documentar** — dibujar y registrar las reglas.

Note:
- Presentar el diseño como un proceso ordenado de cinco pasos, no como una inspiración.
- Nombrar la secuencia: entender, mapear, definir componentes, elegir el patrón y documentar.
- Fijar la idea de la pizarra: "el plano no es la casa".
- Aclarar que los pasos sirven para cualquier caso y que hoy se recorren con un ejemplo de trámites de licencias.
- **No olvidar:** el diseño va antes de pensar en herramientas; la tecnología viene después.

---

## Pasos 1 y 2 — El caso y las fuentes

**Paso 1 · Entender el caso**

¿Qué necesita la institución? ¿Qué **preguntas** debe responder con datos? Ejemplo: reportar mensualmente el avance de los trámites de licencias.

**Paso 2 · Mapear las fuentes**

¿De dónde salen los datos y **qué tipo** son? Ejemplo: sistema de trámites (tablas), formularios web (JSON), documentos escaneados.

Note:
- Desarrollar el paso 1: qué necesita la institución y qué preguntas debe responder con datos.
- Dar el ejemplo del avance mensual de los trámites de licencias como objetivo concreto.
- Desarrollar el paso 2: de dónde salen los datos y qué tipo son, retomando la Sesión 1.
- Ilustrar las fuentes: sistema de trámites (tablas), formularios web (JSON) y documentos escaneados.
- **No olvidar:** el tipo de dato condiciona cómo se almacena y se procesa; primero el caso, después los datos.

---

## Paso 3 — Definir los componentes

Las **cuatro piezas** del plano:

- **Almacenamiento** — dónde.
- **Procesamiento** — cómo.
- **Catálogo** — qué es.
- **Gobernanza** — quién y con qué reglas.

<div class="card">
<h3>Ejemplo</h3>
<p>Base operacional + data warehouse + proceso nocturno + diccionario de datos + política de acceso.</p>
</div>

Note:
- Definir los cuatro componentes con una pregunta cada uno: almacenamiento (dónde), procesamiento (cómo), catálogo (qué es) y gobernanza (quién y con qué reglas).
- Dar el ejemplo completo: base operacional, data warehouse, proceso nocturno, diccionario de datos y política de acceso.
- Retomar la Sesión 4 para conectar la plantilla con las piezas ya conocidas.
- Avisar del error típico: confundir almacenamiento con procesamiento.
- **No olvidar:** catálogo y gobernanza son capas transversales y no se pueden omitir.

---

## Paso 4 — Elegir el patrón

Según el caso:

- **Warehouse** → reportes confiables.
- **Lake** → datos crudos y diversos.
- **Lakehouse** → ambos.
- **Lambda** → lotes + tiempo real.

<div class="card">
<h3>Ejemplo</h3>
<p>Data warehouse para reportes mensuales confiables.</p>
</div>

Note:
- Recordar las correspondencias: warehouse para reportes confiables, lake para datos crudos, lakehouse para ambos y lambda para lotes más tiempo real.
- Aterrizar el ejemplo: warehouse para reportes mensuales confiables.
- Explicar que la justificación se apoya en el caso, el volumen, la estructura del dato, el tiempo real y el gobierno.
- Pedir a los equipos que descarten explícitamente las alternativas, no solo que elijan una.
- **No olvidar:** la elección se justifica en el caso y no en preferencias personales o modas.

---

## Paso 5 — Documentar

Dibujar el **flujo** desde la fuente hasta el uso, nombrar cada **componente** y registrar las **reglas** de gobernanza.

**Plantilla de diseño:**

| Sección | Qué completar |
|---|---|
| Caso y objetivo | Qué necesita y qué pregunta responde |
| Fuentes de datos | De dónde salen y su tipo |
| Componentes | Almacenamiento, procesamiento, catálogo, gobernanza |
| Patrón elegido | Cuál y por qué |
| Diagrama de flujo | Desde la fuente hasta el uso |
| Reglas de gobernanza | Quién accede, calidad y seguridad |

Note:
- Presentar el paso 5: dibujar el flujo desde la fuente hasta el uso, nombrar cada componente y registrar las reglas.
- Recorrer la plantilla sección por sección: caso y objetivo, fuentes, componentes, patrón, diagrama y reglas.
- Explicar que la plantilla completa es el entregable del taller y que se evalúa su coherencia interna.
- Avisar de los olvidos típicos: catálogo, gobernanza y justificación del patrón.
- **No olvidar:** documentar es tan importante como dibujar; un diseño sin documentar no se sostiene.

---

## Taller: la gobernación y la atención al ciudadano

**El caso:** reclamos en **tres sistemas** (ventanilla, teléfono y web), inspecciones anotadas en papel e indicadores armados a mano en Excel. Se necesita un reporte mensual confiable **y** una alerta inmediata ante un reclamo crítico repetido en la misma zona.

**En equipos de 4–5**, con la plantilla:

1. Definir el objetivo.
2. Listar fuentes y tipos.
3. Definir los cuatro componentes.
4. Elegir y justificar el patrón.
5. Dibujar el flujo y completar la plantilla.

**Entregable:** diagrama + plantilla + justificación del patrón.

Note:
- Leer el caso: reclamos en tres sistemas, inspecciones en papel e indicadores armados a mano en Excel.
- Explicitar la meta doble: reporte mensual confiable y alerta inmediata ante un reclamo crítico repetido en la misma zona.
- Dar la consigna y los tiempos: equipos de 4 a 5 personas, 60 minutos de trabajo y 15 de puesta en común.
- Recordar el entregable: diagrama de flujo, plantilla completa y justificación del patrón.
- **No olvidar:** circular entre equipos recordando las tres preguntas (dónde, cómo, quién) y asignar un énfasis distinto a cada uno (reportes, alerta o análisis histórico).

---

## Cierre

- **Patrón:** no hay uno mejor; hay uno adecuado para cada caso.
- **Diseño:** un proceso ordenado — caso → fuentes → componentes → patrón → documentación.
- **Entrega:** el diseño documentado evidencia que se integró todo el bloque.

**Próxima sesión:** la **integración de datos** — ETL/ELT, automatización y orquestación.

¿Preguntas?

Note:
- Repetir el mensaje central: no hay un patrón mejor, hay uno **adecuado para cada caso**.
- Recorrer el proceso de diseño: caso → fuentes → componentes → patrón → documentación.
- Subrayar que la entrega es el diseño documentado, evidencia de haber integrado todo el bloque.
- Anunciar la próxima sesión: integración de datos con ETL/ELT, automatización y orquestación.
- **No olvidar:** dejar claro que documentar el diseño es parte del trabajo, no un extra opcional.

---

<!-- .slide: class="dark" -->
## Gracias

**EGPP · IDT 601 · Ingeniería de Datos**  
Bloque 3 · Sesión 5 · Patrones y diseño

Note:
- Recoger las entregas del taller y cerrar el Bloque 3 con las tres ideas fuerza de la jornada.
- Agradecer la participación y abrir el espacio de preguntas.
- Recordar que la próxima sesión abre el Bloque 4 con la integración de datos, ETL/ELT y orquestación.
- Indicar dónde encontrar el material y confirmar día y hora de la próxima sesión.
- **No olvidar:** cerrar confirmando la próxima sesión y que el diseño entregado es la evidencia del bloque.
