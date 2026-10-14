# Notas del orador — Sesión 8
**Deck:** `deck-sesion-08.html` · 20 diapositivas · 180 min
**Tema:** Inteligencia artificial: historia, redes neuronales y aprendizaje

> Guion punteado por diapositiva. Cada viñeta es algo para decir en voz alta;
> **No olvidar** marca lo imprescindible.

---

## Slide 1 — Inteligencia artificial: historia, redes neuronales y aprendizaje
- Dar la bienvenida, presentarse y ubicar el **Bloque 6 — Historia y Desarrollo de la Inteligencia Artificial**.
- Encuadrar la sesión como un recorrido: **de las reglas fijas al aprendizaje con datos**.
- Aclarar que el público no es especialista: "no hace falta programar; vamos a entender las ideas y cómo se usan".
- Anunciar las palabras clave del día: **regla, dato, modelo, predicción, probabilidad, neurona, peso, entrenamiento, etiqueta, sobreajuste, métrica**.
- **No olvidar:** avisar que habrá una **pausa de 10 minutos** tras el bloque de las dos perspectivas y que el cierre incluye una dinámica en equipos.

## Slide 2 — Hoja de ruta
- Presentar los **nueve tramos** contando esta apertura: historia, dos perspectivas, pausa, redes neuronales, tipos de aprendizaje, ejemplos, dinámica y cierre.
- Marcar los tiempos: 20 min de historia, 25 de perspectivas, 35 de redes, 25 de tipos, 10 de ejemplos, 30 de dinámica y 15 de cierre.
- Explicar que la teoría y la práctica se alternan para que nadie se canse de escuchar.
- **No olvidar:** remarcar la **pausa** y el bloque de la dinámica, porque son los dos respiros de las tres horas.

## Slide 3 — Las preguntas
- Plantear las tres preguntas que ordenan toda la sesión: **¿qué es la IA y de dónde viene?**, **¿sigue reglas o aprende de los datos?**, **¿cómo aprende una red neuronal?**.
- Usar el enganche: "¿cómo aprendiste a distinguir un trámite **urgente** de uno normal? ¿con ejemplos etiquetados, agrupando o a los golpes?".
- Señalar que cada respuesta anticipa uno de los **tres tipos de aprendizaje** que veremos.
- **No olvidar:** decir que quien logre responder estas tres preguntas entiende cómo piensa —y cómo falla— la IA actual.

## Slide 4 — Dos caminos
- Presentar los dos caminos como el hilo conductor de toda la sesión: **determinista e indeterminista**.
- Explicar el primer camino: **decirle qué hacer**; el sistema cumple reglas fijas escritas por un humano.
- Explicar el segundo: **dejar que descubra**; el sistema aprende patrones de los datos y no le escribimos las reglas.
- Preguntar al grupo en qué camino ubicarían el trabajo que hacen a diario.
- **No olvidar:** advertir que la IA real casi siempre **mezcla** los dos caminos y no hay uno superior al otro.

## Slide 5 — Historia en cinco momentos
- Recorrer los cinco momentos sin tecnicismos, como un relato: **1950s la pregunta**, **1960–70s las reglas**, **1980–90s el aprendizaje**, **2000s datos y cómputo**, **hoy IA generativa**.
- Contar el punto de partida: **Turing** y su pregunta por una máquina que se comporte como humano.
- Explicar el giro de los 80–90: codificar todas las reglas del mundo es imposible, mejor dar **ejemplos**.
- **Esquema en pantalla (línea de tiempo):** cinco hitos sobre la línea; conectar el presente con la vida cotidiana (traducción, asistentes de chat, reconocimiento de imágenes).
- **No olvidar:** el mensaje puente: en toda esta historia conviven las **dos filosofías** que veremos ahora en detalle.

## Slide 6 — Dos perspectivas
- Leer la tabla comparativa con el grupo, fila por fila, y detenerse en **explicabilidad** y **cantidad de datos**.
- Aclarar que el determinista es **predecible y auditable**; el indeterminista es **probabilístico** y a veces "caja negra".
- Decir con claridad: **no es cuál es mejor, sino cuál se ajusta al problema**.
- Preguntar: "¿qué trámites de su institución son 100% verificables y cuáles requieren criterio?".
- **No olvidar:** remarcar que un sistema indeterminista **puede equivocarse** y a veces no sabemos por qué; por eso exige control humano.

## Slide 7 — Perspectiva determinista
- Explicar la regla `si (condición) entonces (acción)`: misma entrada, **siempre** la misma salida.
- Destacar las ventajas: **predecible, auditable y fácil de explicar**.
- Usar los ejemplos: la verificación de documentos de un trámite y un **semáforo programado** que cumple un plan, no "piensa".
- Señalar el límite: ante un caso **no previsto**, el sistema no sabe qué hacer.
- **No olvidar:** su fuerza y su debilidad son la misma: solo hace lo que **alguien escribió** antes.

## Slide 8 — Perspectiva indeterminista
- Explicar que el sistema **aprende patrones de ejemplos** y que las reglas se construyen de los datos, no se escriben.
- Señalar que la salida es **probabilística**: da una respuesta con un nivel de confianza, no con certeza.
- Ilustrar con el clasificador de **reclamos por tema**, que aprendió de miles de reclamos ya derivados.
- Hablar del límite: **menos explicable a veces**, la llamada "caja negra".
- **No olvidar:** aclarar que "caja negra" no significa magia, sino que nos cuesta **seguir el razonamiento** de la máquina.

## Slide 9 — ¿Cuándo conviene cada uno?
- Recorrer las tres tarjetas: determinista para **requisitos claros**, indeterminista cuando **hay patrones**, combinada con **reglas + datos**.
- Aterrizar con lo local: un trámite municipal de documentos, la predicción de demanda de un servicio según estación y clima.
- Explicar la combinada con el **filtro de spam**: reglas del remitente más aprendizaje del contenido.
- Dar la regla práctica: "¿puedo escribir la regla en una frase? → determinista; ¿necesito ver muchos ejemplos? → indeterminista".
- **No olvidar:** hacer la transición: "cuando el sistema realmente aprende de los datos, aparece la herramienta estrella: **la red neuronal**".

## Slide 10 — La neurona artificial
- Explicar la neurona artificial con la analogía del **funcionario de ventanilla**: recibe papeles (entradas), da más peso a unos y decide una respuesta (salida).
- Definir **entradas**, **ponderación** y **salida** con palabras simples.
- Dibujar en la pizarra una neurona con varias entradas y una salida.
- Anticipar que esas "importancias" se llaman **pesos** y serán la clave del aprendizaje.
- **No olvidar:** quedarse en la analogía cotidiana, sin fórmulas, porque el público no es especialista.

## Slide 11 — Las capas de la red
- Presentar las tres capas: **entrada** (recibe los datos), **ocultas** (combinan y procesan) y **salida** (entrega el resultado).
- Usar la analogía de la **cadena de decisiones**: cada oficina recibe lo que resolvió la anterior y lo refina.
- **Esquema en pantalla (red):** mostrar 3 entradas → capa oculta → salida, y que cada flecha tiene un peso (`w`, `v`).
- Aclarar que las capas ocultas son las que permiten combinar información compleja.
- **No olvidar:** decir que todas las conexiones entre capas tienen **pesos** que la red aprenderá a ajustar.

## Slide 12 — Pesos y entrenamiento
- Definir el **peso** como cuánto importa cada entrada, y sentenciar: **aprender = ajustar los pesos**.
- Recorrer el ciclo: ejemplos → salida → **error** → ajuste de pesos → repetir. Nombrar la **función de pérdida** como la medida del error.
- Explicar la **época**: una pasada completa sobre **todos** los ejemplos de entrenamiento.
- Usar la analogía de **afinar un instrumento** o de **tirar al aro**: repetir y corregir según el error.
- **No olvidar:** recalcar que el **error** es el motor del aprendizaje; sin comparar con la respuesta esperada la red no aprende.

## Slide 13 — Funciona en la demo, falla en producción
- Explicar por qué medir con los **mismos datos** del entrenamiento engaña: el modelo los **memoriza**.
- Presentar los tres grupos: **entrenamiento** (con él aprende), **validación** (ajustes durante el desarrollo) y **prueba** (nunca lo vio).
- Definir **sobreajuste**: acierta en lo conocido y falla en lo nuevo; es la causa típica del "en la demo andaba y en producción no".
- Aclarar que el conjunto de prueba **no se usa para aprender**: es el espejo de la realidad.
- **No olvidar:** sin conjunto de prueba no podemos saber si el modelo servirá fuera de la demo.

## Slide 14 — Cómo medimos: exactitud y precisión
- Definir **exactitud**: proporción de aciertos sobre el **total** de casos evaluados.
- Definir **precisión**: de los casos que el modelo marcó como **positivos**, cuántos lo eran de verdad.
- Aclarar que **no son lo mismo**: una exactitud alta con precisión baja (o al revés) obliga a preguntar *para qué* se usará el modelo.
- Dar un ejemplo de gestión: no es lo mismo filtrar unos pocos casos dudosos que decidir sobre un trámite.
- **No olvidar:** elegir la métrica es una decisión de gestión, porque depende del costo del error.

## Slide 15 — Tres tipos de aprendizaje
- Presentar la tabla central: **supervisado** (datos etiquetados), **no supervisado** (sin etiquetas) y **por refuerzo** (interacción).
- Explicar la señal de cada uno: **respuesta correcta**, **estructura de los datos**, **recompensa o penalización**.
- Precisar el vocabulario: el preentrenamiento **corrige los pesos** comparando con la respuesta correcta; el **refuerzo** es la recompensa del aprendizaje por refuerzo.
- Adelantar que esta tabla se retomará en el cierre y que es la clave de la dinámica.
- **No olvidar:** decir que la elección del tipo depende de **qué datos tenemos** y de **qué problema queremos resolver**.

## Slide 16 — Los tres tipos, de cerca
- Profundizar el **supervisado**: etiquetas, clasificación y regresión; ejemplo, clasificar un trámite como "urgente" o "no urgente".
- Profundizar el **no supervisado**: agrupar y hallar patrones; ejemplo, segmentar ciudadanos según su uso de servicios.
- Profundizar el **refuerzo**: ensayo, error y recompensa; ejemplo, optimizar semáforos probando combinaciones.
- Dar las tres preguntas de control: **¿hay etiquetas? ¿se busca agrupar? ¿hay una acción y una recompensa?**.
- **No olvidar:** anunciar que esas tres preguntas son exactamente lo que se usará en la **Ronda 2** de la dinámica.

## Slide 17 — Casos en la gestión pública
- Mostrar que las técnicas **ya se usan en el Estado**, no son ciencia ficción.
- Supervisado: **clasificar reclamos** por tema y **predecir la demanda** de un servicio para planificar turnos.
- No supervisado: **segmentar beneficiarios** de programas sociales y **detectar anomalías** en gastos.
- Por refuerzo: **optimizar rutas** de recolección de residuos y asignar recursos dinámicamente.
- **No olvidar:** aterrizar con ejemplos bolivianos concretos de alcaldías, gobernaciones y centros de salud.

## Slide 18 — Dinámica
- Explicar la consigna: **3 equipos** de 3–4 personas, repartir las tarjetas; 30 minutos en total.
- Describir la **Ronda 1** (¿regla o dato? determinista, indeterminista o combinada) y la **Ronda 2** (supervisado, no supervisado o refuerzo), con **4 casos por ronda**.
- Indicar la **puesta en común**: cada equipo comparte el caso más fácil, el más discutido y por qué (2–3 min por equipo).
- Recordar que la opción **"combinada"** suele ser válida, como la verificación de formularios que mezcla reglas y aprendizaje.
- **No olvidar:** valorar la **justificación** del equipo, no solo la respuesta; el entregable es la **ficha de la dinámica** y los criterios están en la rúbrica (Sesión 8).

## Slide 19 — Cierre
- Repetir el criterio central: **no es cuál es mejor, sino cuál se ajusta al problema**.
- Recordar que la red aprende **ajustando pesos** para reducir el **error**, y que se evalúa con un conjunto que **nunca vio** (prueba), vigilando el sobreajuste.
- Repasar los tres tipos: **supervisado, no supervisado y por refuerzo**, según los datos y el problema.
- Anticipar la próxima sesión: **los LLM y el prompting**, los modelos que generan texto.
- **No olvidar:** abrir el espacio de preguntas y dejar claro que las técnicas ya se aplican a trámites, anomalías, segmentación y optimización de recursos.

## Slide 20 — Gracias
- Agradecer la participación y el trabajo en la dinámica.
- Recordar que la próxima sesión abre los **modelos de lenguaje (LLM)** y el prompting.
- Indicar dónde quedan los materiales y a quién dirigirse por dudas.
- **No olvidar:** cerrar con la idea fuerza de la sesión: **reglas + datos + aprendizaje = manera de entender la IA de hoy**.
