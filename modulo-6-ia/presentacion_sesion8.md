<!-- .slide: class="cover" -->
<div class="kicker">Ingeniería de Datos · IDT 601</div>
<h1>Inteligencia artificial: historia, redes neuronales y aprendizaje</h1>
<p class="lead">De las reglas fijas al aprendizaje con datos.</p>
<div class="mark">Bloque 6 · Sesión 8 · EGPP</div>
<div class="cover-side" aria-hidden="true"><div class="code-stack"><span>IA =</span><span>reglas + datos</span><span>+ aprendizaje</span></div></div>

Note:
- Dar la bienvenida y ubicar el **Bloque 6 — Historia y Desarrollo de la Inteligencia Artificial**.
- Encuadrar la sesión como un recorrido: **de las reglas fijas al aprendizaje con datos**.
- Aclarar que el público no es especialista: "no hace falta programar; vamos a entender las ideas".
- Anunciar las palabras clave del día: **regla, dato, modelo, predicción, neurona, peso, entrenamiento, etiqueta, sobreajuste, métrica**.
- **No olvidar:** avisar que hay una **pausa de 10 minutos** y que el cierre incluye una dinámica en equipos.

---

<div class="topline"><span class="kicker">01 / Hoja de ruta</span><span class="mark">180 minutos</span></div>
<div class="content single"><h2 class="slide-title">Una sola sesión, nueve tramos</h2>
  <table class="type-table">
    <thead><tr><th>Bloque</th><th>Tiempo</th><th>Qué haremos</th></tr></thead>
    <tbody>
      <tr><td>Apertura y encuadre</td><td>10 min</td><td>Bienvenida, Bloque 6 y las tres preguntas.</td></tr>
      <tr><td>Historia de la IA</td><td>20 min</td><td>Cinco momentos, sin tecnicismos.</td></tr>
      <tr><td>Dos perspectivas</td><td>25 min</td><td>Determinista vs. indeterminista y cuándo conviene cada una.</td></tr>
      <tr><td>Pausa</td><td>10 min</td><td>Receso.</td></tr>
      <tr><td>Qué es una red neuronal</td><td>35 min</td><td>Neurona, capas, pesos, entrenamiento, sobreajuste y métricas.</td></tr>
      <tr><td>Tipos de aprendizaje</td><td>25 min</td><td>Supervisado, no supervisado y por refuerzo.</td></tr>
      <tr><td>Ejemplos en la gestión pública</td><td>10 min</td><td>Casos aplicados a datos del Estado.</td></tr>
      <tr><td>Dinámica: ¿regla, dato o aprendizaje?</td><td>30 min</td><td>Dos rondas de 4 casos y puesta en común (3 equipos).</td></tr>
      <tr><td>Cierre y preguntas</td><td>15 min</td><td>Síntesis y puente a los LLM.</td></tr>
    </tbody>
  </table>
</div>
<div class="footer"><span>Hoja de ruta</span><span>02</span></div>

Note:
- Presentar los **nueve tramos** contando esta apertura: historia, dos perspectivas, pausa, redes neuronales, tipos de aprendizaje, ejemplos, dinámica y cierre.
- Marcar los tiempos: 20 min de historia, 25 de perspectivas, 35 de redes, 25 de tipos, 10 de ejemplos, 30 de dinámica y 15 de cierre.
- Explicar que la teoría y la práctica se alternan para que nadie se canse de escuchar.
- **No olvidar:** remarcar la **pausa de 10 min** y el bloque de la dinámica, los dos respiros de las tres horas.

---

<div class="topline"><span class="kicker">02 / Encuadre</span><span class="mark">Tres preguntas</span></div>
<div class="content">
  <div><h2 class="slide-title">Las preguntas de la sesión</h2><p class="body-copy">Saber responderlas es entender cómo <strong>piensa</strong> —y cómo <strong>falla</strong>— la IA de hoy.</p></div>
  <div><p class="body-copy">1. ¿<strong>Qué es</strong> la IA y de dónde viene?<br>2. ¿Sigue <strong>reglas</strong> o <strong>aprende</strong> de los datos?<br>3. ¿<strong>Cómo aprende</strong> una red neuronal?</p></div>
</div>
<div class="footer"><span>Encuadre</span><span>03</span></div>

Note:
- Plantear las tres preguntas: **¿qué es la IA y de dónde viene?**, **¿sigue reglas o aprende de los datos?**, **¿cómo aprende una red neuronal?**.
- Enganchar: "¿cómo aprendiste a distinguir un trámite **urgente** de uno normal? ¿con ejemplos etiquetados, agrupando o a los golpes?".
- Señalar que cada respuesta anticipa uno de los **tres tipos de aprendizaje** que veremos más adelante.
- **No olvidar:** decir que quien responda estas tres preguntas entiende cómo piensa y cómo falla la IA actual.

---

<div class="topline"><span class="kicker">03 / Qué es la IA</span><span class="mark">Dos caminos</span></div>
<div class="content">
  <div><h2 class="slide-title">Dos caminos para la misma tarea</h2><p class="body-copy">La IA busca que las máquinas hagan tareas que requieren inteligencia humana. Hay dos maneras de lograrlo, y casi siempre se <strong>mezclan</strong>.</p></div>
  <div><div class="card"><h3>Decirle qué hacer</h3><p>Reglas fijas escritas por un humano. El sistema las cumple paso a paso.</p></div></div>
</div>
<div class="footer"><span>Qué es la IA</span><span>04</span></div>

Note:
- Presentar los dos caminos como el hilo de toda la sesión: **determinista e indeterminista**.
- Explicar "decirle qué hacer": reglas fijas escritas por un humano, cumplidas paso a paso.
- Explicar "dejar que descubra": el sistema aprende **patrones de los datos** y no le escribimos las reglas.
- Preguntar al grupo en qué camino ubicarían el trabajo de su institución.
- **No olvidar:** advertir que la IA real casi siempre **mezcla** los dos caminos y no hay uno mejor que el otro.

---

<div class="topline"><span class="kicker">04 / Historia</span><span class="mark">Cinco momentos</span></div>
<div class="content single"><h2 class="slide-title">Historia de la IA en cinco momentos</h2>
  <table class="type-table">
    <thead><tr><th>Momento</th><th>Aportación</th></tr></thead>
    <tbody>
      <tr><td>1950s — La pregunta</td><td>Turing: ¿puede una máquina comportarse como un humano?</td></tr>
      <tr><td>1960–70s — Las reglas</td><td>Sistemas expertos: el conocimiento codificado en reglas "si… entonces".</td></tr>
      <tr><td>1980–90s — El aprendizaje</td><td>Imposible escribir todas las reglas → dar ejemplos.</td></tr>
      <tr><td>2000s — Datos y cómputo</td><td>Internet produce datos masivos y hay potencia de cálculo.</td></tr>
      <tr><td>Hoy — IA generativa</td><td>No solo clasifica: genera texto, imágenes y código.</td></tr>
    </tbody>
  </table>
  <img class="diagram diagram--sm" src="assets/esquema-linea-tiempo-ia.svg" alt="Línea de tiempo con cinco momentos: la pregunta de Turing, las reglas, el aprendizaje, los datos y cómputo, y la IA generativa." />
</div>
<div class="footer"><span>Historia de la IA</span><span>05</span></div>

Note:
- Recorrer los cinco momentos como un relato, sin tecnicismos: **1950s la pregunta**, **1960–70s las reglas**, **1980–90s el aprendizaje**, **2000s datos y cómputo**, **hoy IA generativa**.
- Contar el punto de partida: **Turing** y su pregunta por una máquina que se comporte como humano.
- Explicar el giro de los 80–90: codificar todas las reglas del mundo es imposible, mejor dar **ejemplos**.
- **Esquema en pantalla (línea de tiempo):** cinco hitos sobre la línea; conectar el presente con la vida cotidiana (traducción, asistentes de chat, reconocimiento de imágenes).
- **No olvidar:** cerrar con el mensaje puente: en toda esta historia conviven las **dos filosofías** (decirle qué hacer o dejar que descubra).

---

<div class="topline"><span class="kicker">05 / Perspectivas</span><span class="mark">Comparación</span></div>
<div class="content single"><h2 class="slide-title">Dos perspectivas</h2>
  <table class="type-table">
    <thead><tr><th>Aspecto</th><th>Determinista</th><th>Indeterminista</th></tr></thead>
    <tbody>
      <tr><td>Reglas</td><td>Escritas a mano.</td><td>Aprendidas de los datos.</td></tr>
      <tr><td>Comportamiento</td><td>Predecible.</td><td>Probabilístico.</td></tr>
      <tr><td>Explicabilidad</td><td>Alta.</td><td>Puede ser baja.</td></tr>
      <tr><td>Datos necesarios</td><td>Pocos.</td><td>Muchos.</td></tr>
      <tr><td>Ideal para</td><td>Reglas claras y estables.</td><td>Patrones complejos y cambiantes.</td></tr>
      <tr><td>Ejemplos</td><td>Verificación de documentos, semáforo.</td><td>Recomendación, predicción.</td></tr>
    </tbody>
  </table>
</div>
<div class="footer"><span>Dos perspectivas</span><span>06</span></div>

Note:
- Leer la tabla con el grupo, fila por fila, deteniéndose en **explicabilidad** y **cantidad de datos**.
- Aclarar que el determinista es **predecible y auditable**; el indeterminista es **probabilístico** y a veces "caja negra".
- Reforzar: **no es cuál es mejor, sino cuál se ajusta al problema**.
- Preguntar: "¿qué trámites de su institución son 100% verificables y cuáles requieren criterio?".
- **No olvidar:** remarcar que un sistema indeterminista **puede equivocarse** y a veces no sabemos por qué, por eso exige control humano.

---

<div class="topline"><span class="kicker">05 / Perspectivas</span><span class="mark">Determinista</span></div>
<div class="content">
  <div><h2 class="slide-title">Perspectiva determinista</h2><p class="body-copy">Funciona con <strong>reglas fijas</strong> escritas por un humano. Misma entrada → <strong>siempre</strong> la misma salida, y se puede seguir el razonamiento paso a paso.</p></div>
  <div><div class="card"><h3>Ejemplo</h3><p>Un sistema que aprueba un trámite solo si están todos los documentos obligatorios. O un <strong>semáforo programado</strong>: no "piensa", cumple un plan.</p></div></div>
</div>
<div class="footer"><span>Dos perspectivas</span><span>07</span></div>

Note:
- Explicar la regla `si (condición) entonces (acción)`: misma entrada, **siempre** la misma salida.
- Destacar las ventajas: **predecible, auditable y fácil de explicar**.
- Usar los ejemplos: verificación de documentos de un trámite y un **semáforo programado** que cumple un plan.
- Señalar el límite: ante un caso **no previsto**, el sistema no sabe qué hacer.
- **No olvidar:** insistir en que su fuerza y su debilidad son la misma: solo hace lo que **alguien escribió** antes.

---

<div class="topline"><span class="kicker">05 / Perspectivas</span><span class="mark">Indeterminista</span></div>
<div class="content">
  <div><h2 class="slide-title">Perspectiva indeterminista</h2><p class="body-copy">El sistema <strong>aprende patrones de ejemplos</strong>. No hay reglas escritas: se construyen de los datos. La salida es <strong>probabilística</strong> y a veces poco explicable.</p></div>
  <div><div class="card"><h3>Ejemplo</h3><p>Un sistema que clasifica <strong>reclamos por tema</strong>: no le dijimos la regla; aprendió de miles de reclamos ya derivados.</p></div></div>
</div>
<div class="footer"><span>Dos perspectivas</span><span>08</span></div>

Note:
- Explicar que el sistema **aprende patrones de ejemplos** y que las reglas se construyen de los datos.
- Señalar que la salida es **probabilística**: da una respuesta con un nivel de confianza, no con certeza.
- Ilustrar con el clasificador de **reclamos por tema**, que aprendió de miles de reclamos ya derivados.
- Hablar del límite: **menos explicable a veces**, la llamada "caja negra".
- **No olvidar:** aclarar que "caja negra" no significa magia, sino que nos cuesta **seguir el razonamiento** de la máquina.

---

<div class="topline"><span class="kicker">05 / Perspectivas</span><span class="mark">¿Cuál conviene?</span></div>
<div class="content single"><h2 class="slide-title">¿Cuándo conviene cada enfoque?</h2>
  <div class="cards">
    <article class="card"><h3>Determinista</h3><p><strong>Trámite</strong> con requisitos claros y fijos → verificación de documentos.</p></article>
    <article class="card"><h3>Indeterminista</h3><p><strong>Predicción de demanda</strong> según estación y clima → hay patrones, no reglas simples.</p></article>
    <article class="card"><h3>Combinada</h3><p>Un <strong>filtro de spam</strong> mezcla reglas del remitente con aprendizaje del contenido.</p></article>
  </div>
</div>
<div class="footer"><span>Dos perspectivas</span><span>09</span></div>

Note:
- Recorrer las tres tarjetas: determinista con **requisitos claros**, indeterminista cuando **hay patrones**, combinada con **reglas + datos**.
- Aterrizar con ejemplos: un trámite municipal con requisitos fijos y la **predicción de demanda** de un servicio.
- Explicar la combinada con el **filtro de spam**: reglas del remitente más aprendizaje del contenido.
- Dar la regla práctica: "¿puedo escribir la regla en una frase? → determinista; ¿necesito ver muchos ejemplos? → indeterminista".
- **No olvidar:** hacer la transición: "cuando el sistema realmente aprende de los datos, aparece su herramienta estrella, la **red neuronal**".

---

<div class="topline"><span class="kicker">06 / Redes neuronales</span><span class="mark">La neurona</span></div>
<div class="content">
  <div><h2 class="slide-title">La neurona artificial</h2><p class="body-copy">Inspirada en la neurona biológica: recibe <strong>entradas</strong>, las <strong>pondera</strong> (da más importancia a unas que a otras) y produce una <strong>salida</strong>.</p></div>
  <div><div class="card"><h3>Analogía</h3><p>Un funcionario de ventanilla: recibe varios papeles, da más peso a unos y decide una respuesta.</p></div></div>
</div>
<div class="footer"><span>Redes neuronales</span><span>10</span></div>

Note:
- Explicar la analogía del **funcionario de ventanilla**: recibe papeles (entradas), da más peso a unos y decide una respuesta (salida).
- Definir **entradas**, **ponderación** y **salida** con palabras simples.
- Dibujar en la pizarra una neurona con varias entradas y una salida.
- Anticipar que esas "importancias" se llaman **pesos** y que serán la clave del aprendizaje.
- **No olvidar:** quedarse en la analogía cotidiana, sin fórmulas, porque el público no es especialista.

---

<div class="topline"><span class="kicker">06 / Redes neuronales</span><span class="mark">Las capas</span></div>
<div class="content single"><h2 class="slide-title">Las capas de la red</h2>
  <div class="cards">
    <article class="card"><h3>Entrada</h3><p>Recibe los datos: las características de cada ejemplo.</p></article>
    <article class="card"><h3>Capas ocultas</h3><p>Procesan y combinan la información.</p></article>
    <article class="card"><h3>Salida</h3><p>Entrega el resultado: una etiqueta, un número, una decisión.</p></article>
  </div>
  <img class="diagram diagram--sm" src="assets/esquema-red-neuronal.svg" alt="Tres neuronas de entrada conectadas por pesos a una capa oculta y esta a una neurona de salida; si la salida no coincide con lo esperado se calcula el error y se corrigen los pesos." />
</div>
<div class="footer"><span>Redes neuronales</span><span>11</span></div>

Note:
- Presentar las tres capas: **entrada** (recibe los datos), **ocultas** (procesan y combinan) y **salida** (entrega el resultado).
- Usar la analogía de la **cadena de decisiones**: cada oficina recibe lo que resolvió la anterior y lo refina.
- **Esquema en pantalla (red):** mostrar 3 entradas → capa oculta → salida, y que cada flecha tiene un peso (`w`, `v`).
- Aclarar que las capas ocultas son las que permiten combinar información compleja.
- **No olvidar:** decir que todas las conexiones entre capas tienen **pesos** que la red aprenderá a ajustar.

---

<div class="topline"><span class="kicker">06 / Redes neuronales</span><span class="mark">Entrenamiento</span></div>
<div class="content">
  <div><h2 class="slide-title">Pesos y entrenamiento</h2><p class="body-copy">Cada conexión tiene un <strong>peso</strong>: cuánto importa esa entrada. <strong>Aprender = ajustar los pesos</strong> para reducir el error.</p>
    <ol>
      <li>Se presentan <strong>ejemplos</strong>.</li>
      <li>La red produce una <strong>salida</strong>.</li>
      <li>Se compara con lo esperado y se calcula el <strong>error</strong> (función de pérdida).</li>
      <li>Se <strong>ajustan los pesos</strong> para reducir el error.</li>
      <li>Se repite muchas veces: cada pasada completa es una <strong>época</strong>.</li>
    </ol>
  </div>
  <div><div class="card"><h3>Analogía</h3><p>Afinar un instrumento o tirar al aro: repetir y corregir en función del error.</p></div></div>
</div>
<div class="footer"><span>Redes neuronales</span><span>12</span></div>

Note:
- Definir el **peso** como cuánto importa cada entrada, y sentenciar: **aprender = ajustar los pesos**.
- Recorrer el ciclo: ejemplos → salida → error → ajuste de pesos → repetir. Nombrar la **función de pérdida** como la medida del error y la **época** como una pasada completa.
- Usar la analogía de **afinar un instrumento** o **tirar al aro**: repetir y corregir según el error.
- **No olvidar:** recalcar que el **error** es el motor del aprendizaje; sin comparar con lo esperado, la red no aprende.

---

<div class="topline"><span class="kicker">06 / Redes neuronales</span><span class="mark">Demo vs. producción</span></div>
<div class="content">
  <div><h2 class="slide-title">Funciona en la demo, falla en producción</h2><p class="body-copy">Si medimos con los <strong>mismos datos</strong> con que aprendió, siempre parece bueno. Por eso se separan los datos en tres grupos y se vigila el <strong>sobreajuste</strong>.</p></div>
  <div><div class="card"><h3>Los tres grupos</h3><p><strong>Entrenamiento:</strong> con él aprende. <strong>Validación:</strong> para ajustar durante el desarrollo. <strong>Prueba:</strong> nunca lo vio; estima los casos nuevos.</p></div></div>
</div>
<div class="footer"><span>Redes neuronales</span><span>13</span></div>

Note:
- Explicar por qué medir con los mismos datos engaña: el modelo los **memoriza**.
- Presentar los tres grupos: **entrenamiento**, **validación** y **prueba**; la prueba es la que estima el desempeño con casos nuevos.
- Definir **sobreajuste**: acierta en lo conocido y falla en lo nuevo; es la causa típica del "en la demo andaba y en producción no".
- **No olvidar:** el conjunto de prueba **no se usa para aprender**; es el espejo de la realidad.

---

<div class="topline"><span class="kicker">06 / Redes neuronales</span><span class="mark">Métricas</span></div>
<div class="content single"><h2 class="slide-title">Cómo medimos: exactitud y precisión</h2>
  <div class="split">
    <div class="split-panel"><h3>Exactitud</h3><p>Proporción de aciertos sobre el <strong>total</strong> de casos evaluados.</p></div>
    <div class="split-panel"><h3>Precisión</h3><p>De los casos que el modelo marcó como <strong>positivos</strong>, cuántos lo eran de verdad.</p></div>
  </div>
  <p class="body-copy">No son lo mismo. Una exactitud alta con precisión baja obliga a preguntar <strong>para qué</strong> se usará el modelo: el costo del error cambia según el trámite.</p>
</div>
<div class="footer"><span>Redes neuronales</span><span>14</span></div>

Note:
- Definir **exactitud** (aciertos sobre el total) y **precisión** (de los marcados como positivos, cuántos lo eran).
- Aclarar que **no son lo mismo** y que la métrica a mirar depende del costo del error.
- Dar un ejemplo de gestión: no es lo mismo filtrar unos pocos casos dudosos que decidir sobre un trámite.
- **No olvidar:** elegir bien la métrica es una decisión de gestión, no solo técnica.

---

<div class="topline"><span class="kicker">07 / Tipos de aprendizaje</span><span class="mark">La tabla central</span></div>
<div class="content single"><h2 class="slide-title">Tres tipos de aprendizaje</h2>
  <table class="type-table">
    <thead><tr><th>Tipo</th><th>Datos</th><th>¿Qué aprende?</th><th>Señal</th></tr></thead>
    <tbody>
      <tr><td>Supervisado</td><td>Etiquetados</td><td>Predecir etiqueta o valor.</td><td>Respuesta correcta</td></tr>
      <tr><td>No supervisado</td><td>Sin etiquetas</td><td>Agrupar y hallar patrones.</td><td>Estructura de los datos</td></tr>
      <tr><td>Por refuerzo</td><td>Interacción</td><td>Decidir acciones.</td><td>Recompensa / penalización</td></tr>
    </tbody>
  </table>
</div>
<div class="footer"><span>Tipos de aprendizaje</span><span>15</span></div>

Note:
- Presentar la tabla: **supervisado** (datos etiquetados), **no supervisado** (sin etiquetas) y **por refuerzo** (interacción).
- Explicar la señal de cada uno: **respuesta correcta**, **estructura de los datos** y **recompensa o penalización**.
- Adelantar que esta tabla es la parte central y que se retomará en el cierre y en la dinámica.
- **No olvidar:** decir que la elección depende de **qué datos tenemos** y de **qué problema queremos resolver**; y que el preentrenamiento **corrige pesos**, no "refuerza".

---

<div class="topline"><span class="kicker">07 / Tipos de aprendizaje</span><span class="mark">De cerca</span></div>
<div class="content single"><h2 class="slide-title">Los tres tipos, de cerca</h2>
  <div class="cards">
    <article class="card"><h3>Supervisado</h3><p>Datos <strong>etiquetados</strong>. Clasificación y regresión. Ej.: clasificar un trámite como "urgente" o "no urgente".</p></article>
    <article class="card"><h3>No supervisado</h3><p>Datos <strong>sin etiquetas</strong>. Agrupa y halla patrones. Ej.: segmentar ciudadanos según su uso de servicios.</p></article>
    <article class="card"><h3>Por refuerzo</h3><p><strong>Ensayo, error y recompensa.</strong> Ej.: optimizar semáforos probando combinaciones.</p></article>
  </div>
</div>
<div class="footer"><span>Tipos de aprendizaje</span><span>16</span></div>

Note:
- Profundizar el **supervisado**: clasificación y regresión; ejemplo, clasificar un trámite como "urgente" o "no urgente".
- Profundizar el **no supervisado**: agrupar y hallar patrones; ejemplo, segmentar ciudadanos según su uso de servicios.
- Profundizar el **refuerzo**: ensayo, error y recompensa; ejemplo, optimizar semáforos probando combinaciones.
- Dar las tres preguntas de control: **¿hay etiquetas? ¿se busca agrupar? ¿hay una acción y una recompensa?**.
- **No olvidar:** anunciar que esas tres preguntas son exactamente las que se usarán en la **Ronda 2** de la dinámica.

---

<div class="topline"><span class="kicker">08 / Aplicación</span><span class="mark">Gestión pública</span></div>
<div class="content single"><h2 class="slide-title">Casos en la gestión pública</h2>
  <div class="cards">
    <article class="card"><h3>Supervisado</h3><p>Clasificar <strong>reclamos</strong> por tema; predecir la <strong>demanda</strong> de un servicio.</p></article>
    <article class="card"><h3>No supervisado</h3><p>Segmentar <strong>beneficiarios</strong> de programas sociales; detectar <strong>anomalías</strong> en gastos.</p></article>
    <article class="card"><h3>Por refuerzo</h3><p>Optimizar <strong>rutas</strong> de recolección de residuos; asignar recursos dinámicamente.</p></article>
  </div>
  <p class="body-copy">No siempre hay etiquetas: a veces solo queremos descubrir grupos; a veces decidir en secuencia. Por eso hay más de un tipo de aprendizaje.</p>
</div>
<div class="footer"><span>Aplicación</span><span>17</span></div>

Note:
- Aterrizar con ejemplos **bolivianos**: municipios, alcaldías, gobernaciones y centros de salud.
- Supervisado: clasificar **reclamos** por tema y predecir la **demanda** de un servicio para planificar turnos.
- No supervisado: **segmentar beneficiarios** de programas sociales y **detectar anomalías** en gastos.
- Por refuerzo: **optimizar rutas** de recolección de residuos y asignar recursos dinámicamente.
- **No olvidar:** remarcar que estas técnicas **ya se usan en el Estado**, no son ciencia ficción.

---

<div class="topline"><span class="kicker">09 / Dinámica</span><span class="mark">30 minutos</span></div>
<div class="content single"><h2 class="slide-title">¿Regla, dato o aprendizaje?</h2>
  <div class="cards">
    <article class="card"><h3>1. Ronda 1</h3><p>En equipos de 3–4, clasifiquen <strong>4 casos</strong> como determinista, indeterminista o combinada.</p></article>
    <article class="card"><h3>2. Ronda 2</h3><p>Clasifiquen otros <strong>4 casos</strong> como supervisado, no supervisado o por refuerzo, e indiquen la señal.</p></article>
    <article class="card"><h3>3. Puesta en común</h3><p>Cada equipo comparte el caso más fácil, el más discutido y por qué (3 equipos).</p></article>
  </div>
  <p class="body-copy">Entregable: la <strong>ficha de la dinámica</strong> (<span class="mono">plantilla-ficha-dinamica.md</span>). Ojo: la opción <strong>"combinada"</strong> suele ser válida.</p>
</div>
<div class="footer"><span>Dinámica</span><span>18</span></div>

Note:
- Repartir las tarjetas y conformar **3 equipos** de 3–4 personas; 30 minutos en total.
- Explicar la **Ronda 1** (¿regla o dato? determinista, indeterminista o combinada) y la **Ronda 2** (supervisado, no supervisado o refuerzo), con **4 casos por ronda**.
- Indicar la **puesta en común**: el caso más fácil, el más discutido y por qué, 2–3 min por equipo.
- Recordar que la opción **"combinada"** suele ser válida (la verificación de formularios mezcla reglas y aprendizaje).
- **No olvidar:** valorar la **justificación**, no solo la respuesta; se evalúa participación, coherencia y argumentación (ver la rúbrica, Sesión 8).

---

<div class="topline"><span class="kicker">10 / En resumen</span><span class="mark">Cierre</span></div>
<div class="content single"><h2 class="slide-title">No hay un enfoque mejor: hay el que se ajusta</h2>
  <div class="cards">
    <article class="card"><h3>Reglas o datos</h3><p>Determinista si las reglas son claras; indeterminista si hay patrones que cuesta codificar.</p></article>
    <article class="card"><h3>La red aprende</h3><p>Ajusta <strong>pesos</strong> para reducir el <strong>error</strong>; se mide con un conjunto que nunca vio.</p></article>
    <article class="card"><h3>Tres formas</h3><p>Supervisado, no supervisado y por refuerzo: depende de los datos y del problema.</p></article>
  </div>
  <p class="quote">Próxima sesión: de la red neuronal al <em>LLM</em> — los modelos de lenguaje y el prompting.</p>
</div>
<div class="footer"><span>Fin de la sesión</span><span>19</span></div>

Note:
- Repetir el criterio central: no se trata de cuál modelo es mejor, sino de cuál **se ajusta al problema**.
- Recordar que una red neuronal aprende **ajustando pesos** y que se evalúa con datos que **nunca vio** (prueba), vigilando el sobreajuste.
- Mencionar los usos ya presentes en la gestión pública: trámites, anomalías, segmentación y optimización de recursos.
- Anticipar la próxima sesión: del modelo biológico al **LLM**, los modelos de lenguaje y el prompting.
- **No olvidar:** dejar claro que la IA no es magia: es matemática ajustada con datos.

---

<!-- .slide: class="dark" -->
<div class="topline"><span class="kicker">Fin</span><span class="mark">Ingeniería de Datos · IDT 601</span></div>
<div class="content single">
  <h2 class="slide-title">Gracias</h2>
  <p class="lead">Bloque 6 · Sesión 8 · Historia, redes y aprendizaje</p>
  <p class="quote">Reglas + datos + aprendizaje.</p>
</div>
<div class="footer"><span>EGPP · Escuela de Gestión Pública Plurinacional</span><span>20</span></div>

Note:
- Agradecer la participación y el trabajo en la dinámica.
- Recordar que la próxima sesión abre los **modelos de lenguaje (LLM)** y el prompting.
- Indicar dónde quedan los materiales y a quién dirigirse por dudas.
- **No olvidar:** cerrar con la idea fuerza: **reglas + datos + aprendizaje** es la manera de entender la IA de hoy.
