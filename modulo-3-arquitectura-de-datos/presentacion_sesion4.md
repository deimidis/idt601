<!-- .slide: class="cover" -->
<div class="kicker">Ingeniería de Datos · IDT 601</div>
<h1>Arquitectura de datos: conceptos y componentes</h1>
<p class="lead">¿Cómo se organizan los datos en una plataforma?</p>
<div class="mark">Bloque 3 · Sesión 4 · EGPP</div>
<div class="cover-side" aria-hidden="true"><div class="code-stack"><span>arquitectura =</span><span>almacenar</span><span>+ procesar + gobernar</span></div></div>

Note:
- Dar la bienvenida, presentarse y ubicar la sesión: **Bloque 3 — Arquitectura de Datos**, después de los bloques de Datos, Calidad y Almacenamiento.
- Conectar con lo ya visto: "ya sabemos de dónde salen los datos, cómo medir su calidad y dónde guardarlos; hoy: ¿cómo los organizamos para que toda la institución pueda usarlos?".
- Encuadrar al público no especialista: no hace falta saber programar, hablamos de **decisiones de diseño**.
- Anunciar la pregunta central y el recorrido: definir, entender por qué importa, conocer las piezas y practicar.
- **No olvidar:** aclarar que hay una práctica en equipos al final y que la sesión dura 180 minutos con una pausa.

---

## Hoja de ruta de la sesión

| Momento | Tiempo | Qué haremos |
|---|---|---|
| ¿Qué es? | 25 min | Definición, analogía del plano y límites del concepto. |
| Por qué importa | 20 min | Consecuencias de diseñar o no la arquitectura. |
| Componentes | 30 min | Almacenamiento, procesamiento, catálogo y gobernanza. |
| Flujo y diagramas | 25 min | Cómo se conectan las piezas y cómo leer un esquema. |
| Práctica | 50 min | Identificar componentes en un esquema sin etiquetas. |
| Cierre | 10 min | Síntesis y puente a la Sesión 5. |

Note:
- Recorrer los seis tramos de la tabla y marcar el ritmo: 25 min de concepto, 20 de por qué importa, 30 de componentes, 25 de flujo y diagramas, 50 de práctica y 10 de cierre.
- Ubicar la **pausa de 10 minutos** justo antes del bloque de los cuatro componentes.
- Avisar que la práctica de 50 minutos incluye la puesta en común, así que el tiempo es ajustado.
- Anticipar que todo el bloque gira sobre una frase clave que se escribirá en la pizarra y se retomará al cierre.
- **No olvidar:** decir explícitamente que la práctica final es parte de la evaluación y que cada equipo recibirá un esquema sin etiquetas.

---

## ¿Qué es una arquitectura de datos?

La **arquitectura de datos es el plano** que define:

- **Qué** datos existen en la institución.
- **Dónde** se guardan y **cómo** se mueven.
- **Quién** los usa y con **qué reglas**.

No es un software: es una **decisión de diseño** que antecede a la tecnología.

Note:
- Enganche: "¿alguna vez pidieron un dato a otra área y tardaron semanas, o recibieron el mismo dato con valores distintos?".
- Anotar 4 o 5 respuestas en la pizarra y dejarlas visibles; se retoman al hablar de por qué importa el diseño.
- Definir sin rodeos: la arquitectura es el **plano** que define qué datos existen, dónde se guardan, cómo se mueven, quién los usa y con qué reglas.
- Advertir que **no es un software**: es una **decisión de diseño** que antecede a la tecnología.
- **No olvidar:** anotar las respuestas del grupo; son el hilo conductor del resto de la sesión.

---

## La analogía del plano

Antes de construir una casa se dibuja un **plano**:

- Dónde van las habitaciones y las cañerías.
- Cómo se conectan electricidad y agua.

La arquitectura de datos es **ese plano, pero para los datos de la institución**.

<div class="card">
<h3>Clave</h3>
<p>El plano <strong>no es</strong> la casa. La arquitectura <strong>no es</strong> la herramienta.</p>
</div>

Note:
- Insistir en la distinción: el plano no es el ladrillo; la arquitectura no es la herramienta.
- Explicar que las herramientas implementan decisiones de diseño, no las reemplazan.
- Dar un ejemplo cercano: dos municipios con el mismo software pueden tener arquitecturas muy distintas según cómo deciden organizar sus datos.
- **No olvidar:** remarcar que primero se decide el diseño y después se elige la tecnología, nunca al revés.

---

## Tres preguntas que responde

1. ¿**Dónde** vive cada dato? → almacenamiento.
2. ¿**Cómo** se mueve y transforma? → procesamiento.
3. ¿**Quién** puede usarlo y con qué reglas? → acceso y gobernanza.

**Arquitectura de datos = plano de la información institucional.**

Note:
- Presentar las tres preguntas: **¿dónde vive?**, **¿cómo se mueve?**, **¿quién lo usa?**.
- Mapear cada pregunta con su componente: dónde → **almacenamiento**; cómo → **procesamiento**; quién y con qué reglas → **acceso y gobernanza**.
- Aclarar que estas tres preguntas son la columna vertebral del bloque y de toda la sesión.
- Pedir al grupo que repita las tres preguntas en voz alta para fijarlas.
- **No olvidar:** estas preguntas son la base para identificar componentes en cualquier esquema, incluida la práctica final.

---

## Por qué importa el diseño

Decidir sin arquitectura tiene consecuencias concretas:

| Consecuencia | Qué ocurre |
|---|---|
| **Silos** | Cada área guarda "su" dato y nadie ve el conjunto. |
| **Duplicación** | El mismo dato se captura varias veces, con distintos valores. |
| **Desconfianza** | Cada reporte cuenta una historia distinta. |
| **No crece** | Sumar una fuente o servicio obliga a reconstruir todo. |

**Mensaje:** diseñar es barato; reparar una arquitectura improvisada es caro.

Note:
- Retomar las respuestas del enganche y mostrar que son ejemplos reales de silos, duplicación y desconfianza.
- Enfatizar que el costo de no diseñar se paga después, en decisiones lentas y proyectos que no escalan.
- Nombrar las cuatro consecuencias de la tabla: silos, duplicación, desconfianza y no poder crecer.
- Cerrar con el mensaje puente: **diseñar es barato; reparar una arquitectura improvisada es caro**.
- **No olvidar:** vincular el "no crece" con la idea de que sumar una fuente o servicio obliga a reconstruir todo desde cero.

---

## Síntomas de una mala arquitectura

1. El **mismo dato con valores distintos** (padrón de contribuyentes entre Recaudaciones y Catastro).
2. Datos **encerrados** en cada área.
3. Reportes **lentos o manuales** (exportar y copiar en Excel durante días).
4. Cambios **traumáticos** al migrar sistemas.
5. Reglas **poco claras**: ¿quién es dueño del dato?

Note:
- Pedir al grupo que reconozca cuál de estos síntomas vive en su propia institución y lo describa en una frase.
- Detenerse en el ejemplo fuerte: el **padrón de contribuyentes** que no coincide entre Recaudaciones y Catastro.
- Repasar los demás síntomas: datos encerrados, reportes lentos o manuales, migraciones traumáticas y reglas poco claras.
- **No olvidar:** conectar el síntoma de "reglas poco claras" con la pregunta "¿quién es dueño del dato?", que se responde al hablar de gobernanza.

---

## Los cuatro componentes

Toda arquitectura se arma con **cuatro piezas**:

| Componente | Pregunta que responde |
|---|---|
| **Almacenamiento** | ¿Dónde se guardan los datos? |
| **Procesamiento** | ¿Cómo se mueven y transforman? |
| **Catálogo** | ¿Qué datos existen y qué significan? |
| **Gobernanza** | ¿Quién puede usarlos y con qué reglas? |

Note:
- Enganche: "si tuvieran que guardar, ordenar y repartir los datos de su institución, ¿qué piezas necesitarían?".
- Mapear las respuestas del grupo a los cuatro componentes: almacenamiento, procesamiento, catálogo y gobernanza.
- Anunciar que esta es la grilla con la que se leerá cualquier arquitectura de ahora en adelante.
- **No olvidar:** dejar claro que ninguno es opcional ni intercambiable; cada componente responde una pregunta distinta.

---

## 1. Almacenamiento

Responde: **¿dónde** vive el dato y en qué forma?

- Bases de datos, data warehouse, data lake, archivos.
- Datos **estructurados** (tablas) y **no estructurados** (documentos, imágenes).

<div class="card">
<h3>Ejemplo</h3>
<p>Base de datos de trámites + repositorio de documentos escaneados del municipio.</p>
</div>

Note:
- Definir el almacenamiento como la respuesta a **¿dónde vive el dato y en qué forma?**.
- Nombrar los tipos: bases de datos, **data warehouse**, **data lake** y archivos.
- Distinguir datos **estructurados** (tablas) de **no estructurados** (documentos, imágenes).
- Usar el ejemplo local: la base de datos de trámites junto al repositorio de documentos escaneados del municipio.
- **No olvidar:** diferenciar el almacenamiento operacional (el día a día) del de análisis (donde se consolida para consultar).

---

## 2. Procesamiento

Responde: **¿cómo** se mueven y transforman los datos?

- Limpieza, unión y cálculo de indicadores.
- Por **lotes** (batch, cada noche) o en **tiempo real** (streaming).

<div class="card">
<h3>Ejemplo</h3>
<p>Cada noche se consolidan los pagos del día para actualizar el reporte de recaudación.</p>
</div>

Note:
- Explicar que el procesamiento convierte datos crudos en datos utilizables: es la "cocina" que prepara el dato antes de usarlo.
- Describir las tareas: limpieza, unión y cálculo de indicadores.
- Presentar las dos velocidades: por **lotes** (batch, cada noche) y en **tiempo real** (streaming).
- Usar el ejemplo: cada noche se consolidan los pagos del día para actualizar el reporte de recaudación.
- **No olvidar:** aclarar que procesar no es mover por mover; el objetivo es que el dato quede listo para usarse.

---

## 3. Catálogo de datos

Responde: **¿qué** datos existen y **qué significan**?

- Documenta cada dato: definición, formato, dueño y origen.
- Incluye **metadatos** (diccionario de datos).

<div class="card">
<h3>Ejemplo</h3>
<p>Un diccionario que define "DNI" como el número de identificación oficial, con formato y área responsable.</p>
</div>

Note:
- Definir el catálogo como la respuesta a **¿qué datos existen y qué significan?**.
- Detallar qué documenta cada dato: definición, formato, dueño y origen.
- Introducir el término **metadatos** y su forma más conocida: el diccionario de datos.
- Ejemplificar con "DNI": un diccionario que define que es el número de identificación oficial, con formato y área responsable.
- **No olvidar:** sin catálogo, nadie sabe qué significa cada campo; es lo que permite que dos áreas hablen del mismo dato con el mismo nombre.

---

## 4. Gobernanza

Responde: **¿quién** puede usarlo y con **qué reglas**?

- Calidad, seguridad, privacidad, responsabilidad y acceso.
- Define dueños del dato y condiciones de uso.

<div class="card">
<h3>Ejemplo</h3>
<p>Solo el área de personal modifica el sueldo registrado; acceder a datos personales exige autorización.</p>
</div>

Note:
- Definir la gobernanza como la respuesta a **¿quién puede usarlo y con qué reglas?**.
- Enumerar lo que cubre: calidad, seguridad, privacidad, responsabilidad y acceso.
- Explicar que establece los **dueños del dato** y las condiciones de uso.
- Usar el ejemplo: solo el área de personal modifica el sueldo; ver datos personales exige autorización.
- **No olvidar:** remarcar que la gobernanza no es burocracia; es lo que hace que el dato sea confiable y seguro.

---

## El flujo entre componentes

**Fuente → Almacenamiento → Procesamiento → Uso**

- Los datos **entran** desde las fuentes (sistemas, formularios, sensores).
- Se **guardan**, se **transforman** y quedan **disponibles** para reportes y análisis.
- El **catálogo** y la **gobernanza** no son una etapa: son **capas transversales** que atraviesan todo el flujo.

Note:
- Enfatizar que el **catálogo** y la **gobernanza** no son "una caja más del flujo".
- Explicar que documentan y regulan todo el trayecto, de la fuente al uso, como **capas transversales**.
- Dibujar el flujo en la pizarra: **Fuente → Almacenamiento → Procesamiento → Uso**.
- **No olvidar:** corregir el error frecuente de dibujar catálogo y gobernanza como un paso más de la fila.

---

## Leyendo un diagrama

Con un esquema de arquitectura, preguntar por cada elemento:

| Pregunta | Componente |
|---|---|
| ¿Dónde **nacen** los datos? | Fuentes. |
| ¿Dónde se **guardan**? | Almacenamiento. |
| ¿Qué los **transforma**? | Procesamiento. |
| ¿Dónde está su **definición**? | Catálogo. |
| ¿Quién controla el **acceso**? | Gobernanza. |

Note:
- Presentar el procedimiento de cinco preguntas: ¿dónde nacen?, ¿dónde se guardan?, ¿qué los transforma?, ¿dónde está su definición?, ¿quién controla el acceso?.
- Mostrar o dibujar un esquema sencillo y responder las preguntas en voz alta junto con el grupo.
- Señalar que no hace falta saber tecnología: basta con las cinco preguntas para entender un diagrama.
- **No olvidar:** este slide es el **puente** hacia la práctica; no pasar de largo sin leer un diagrama en conjunto.

---

## Práctica: identificar componentes

**En equipos de 3–4**, con un esquema sin etiquetas:

1. **Etiqueten** cada elemento con su componente.
2. **Justifiquen** cada elección.
3. **Describan el flujo** de datos, de la fuente al uso.

**Puesta en común:** cada equipo expone un componente y su justificación.

Note:
- Dar la consigna: en equipos de **3 a 4 personas**, con un esquema sin etiquetas y una hoja con las cuatro categorías.
- Explicar los tres pasos: etiquetar cada elemento, justificar cada elección y describir el flujo de la fuente al uso.
- Recordar el tiempo: 50 minutos en total, incluida la puesta en común.
- Circular entre los equipos para destrabar dudas y orientar la lectura del esquema.
- **No olvidar:** en la puesta en común cada equipo expone un componente y su justificación; valorar que distingan almacenamiento de procesamiento y que reconozcan catálogo y gobernanza como capas transversales.

---

## Cierre

- La arquitectura de datos es el **plano** de la información institucional, no una herramienta.
- Cuatro componentes: **almacenamiento, procesamiento, catálogo y gobernanza**.
- Forman un **flujo** desde la fuente hasta el uso, con capas transversales.

**Próxima sesión:** los **patrones de arquitectura** — data warehouse, data lake, data lakehouse y lambda. ¡Con práctica!

¿Preguntas?

Note:
- Síntesis con el grupo: releer en voz alta la frase de la pizarra **dónde / cómo / qué es / quién**.
- Reforzar la idea central: conocer los componentes permite leer y diseñar cualquier arquitectura.
- Anticipar la Sesión 5: los **patrones de arquitectura** — data warehouse, data lake, data lakehouse y lambda, también con práctica.
- **No olvidar:** recordar que la entrega es la hoja de trabajo con el esquema etiquetado, las justificaciones y la descripción del flujo.

---

<!-- .slide: class="dark" -->
## Gracias

**EGPP · IDT 601 · Ingeniería de Datos**  
Bloque 3 · Sesión 4 · Arquitectura de datos

Note:
- Agradecer la participación y abrir el espacio de preguntas y dudas.
- Repasar brevemente el recorrido de la sesión para quienes quedaron con dudas puntuales.
- Recordar la entrega pendiente y el material de la Sesión 5.
- Cerrar con el puente: la próxima sesión sigue en el Bloque 3 con los patrones de arquitectura y diseño.
- **No olvidar:** quedarse disponible para consultas y confirmar el canal de contacto del curso.
