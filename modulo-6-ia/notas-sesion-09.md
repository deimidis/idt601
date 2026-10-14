# Notas del orador — Sesión 9
**Deck:** `deck-sesion-09.html` · 21 diapositivas · 180 min
**Tema:** Modelos de lenguaje (LLM) y prompting

> Guion punteado por diapositiva. Cada viñeta es algo para decir en voz alta;
> **No olvidar** marca lo imprescindible.

---

## Slide 1 — Modelos de lenguaje (LLM) y prompting
- Dar la bienvenida, presentarse y ubicar la sesión en el **Bloque 6 — Historia y Desarrollo de la Inteligencia Artificial**.
- Encuadrar el puente con la Sesión 8: "Vimos la red neuronal y cómo aprende; hoy la vemos a escala gigante, en los chats que usamos a diario".
- Aclarar que el público no es especialista: **no hace falta saber programar** para entender ni para usar un LLM.
- Anunciar las dos preguntas del día: ¿qué es un LLM y cómo genera contenido? y ¿cómo le pedimos para obtener una buena respuesta?
- **No olvidar:** pedir que tengan a mano un chat de IA (o el documento compartido del Plan B) y avisar la **pausa de 10 minutos** y la **práctica de 30 min**.

## Slide 2 — Hoja de ruta
- Recorrer los **once tramos** de la tabla leyendo el hilo y los tiempos, sin entrar todavía en contenido.
- Marcar el ritmo: teoría hasta la mitad, **pausa de 10 minutos** y luego foco en prompting, práctica y cierre.
- Señalar que la **práctica (30 min)** es el corazón del día y que la **puesta en común** se hace al cierre.
- **No olvidar:** avisar la hora exacta de la pausa y dónde retoman, para que nadie se disperse.

## Slide 3 — Dos preguntas
- Escribir las dos preguntas en la pizarra y dejarlas visibles toda la sesión como columna vertebral: qué es un LLM y cómo le pedimos.
- Explicar que la primera mitad responde la pregunta 1 y la segunda, la pregunta 2.
- Aclarar que entender el modelo y saber pedirle bien son **dos habilidades distintas**, y las dos se aprenden.
- **No olvidar:** pedir que anoten sus respuestas ahora, para compararlas al final.

## Slide 4 — El poder del prompt
- Abrir un chat real y mostrar en vivo las dos respuestas: el pedido **vago** ("háblame de impuestos") y el **preciso** ("explicá en 5 líneas y para un funcionario municipal qué es el impuesto predial").
- Preguntar al grupo "¿qué diferencia notan?, ¿qué cambió?" y dejarlos responder antes de explicar.
- Subrayar que el **modelo es el mismo**: lo único que cambió fue la forma de pedir.
- Conectar el ejemplo del impuesto predial con su trabajo cotidiano en la gestión pública.
- **No olvidar:** destacar que este enganche es el corazón de la sesión; todo lo demás explica por qué el prompt manda.

## Slide 5 — Qué es un LLM
- Definir LLM como **red neuronal a gran escala** entrenada sobre enormes volúmenes de texto.
- Explicar "gran escala" en lenguaje llano: miles de millones de **parámetros (pesos)** y textos de libros, sitios, documentos públicos y código.
- Usar la analogía del **lector incansable**: leyó una biblioteca entera y aprendió qué palabras suelen ir juntas y en qué orden.
- Subrayar la tarea central: **predecir la siguiente palabra**; no piensa ni busca, completa patrones.
- **No olvidar:** dejar claro que nadie escribió las reglas del idioma dentro del modelo: las descubrió solo.

## Slide 6 — Cómo se entrena
- Dibujar la red neuronal de la sesión anterior en la pizarra y "agrandarla" millones de veces.
- Recorrer los pasos: **mostrar** frases, **predecir** la siguiente palabra, **comparar con la palabra que realmente seguía** y **corregir los pesos**.
- **Corrección técnica (no equivocarse):** en el preentrenamiento **no hay refuerzo por acertar**. Se **compara** con la palabra real y se **corrigen los pesos** para reducir el error (descenso de gradiente). El refuerzo con recompensas es el **aprendizaje por refuerzo** de la Sesión 8, que es otra cosa.
- Hacer la demostración: pedir al chat que complete "La recaudación tributaria del municipio aumentó porque…".
- **No olvidar:** insistir en que el modelo no guarda respuestas, sino que aprende **cómo suele continuar** una frase.

## Slide 7 — Generación por probabilidad
- Explicar que ante un pedido el modelo calcula **qué palabra es más probable que siga**, según todo lo que leyó.
- Aclarar que **no busca en una base de datos**: genera palabra por palabra, y cada una pasa a ser contexto de la siguiente.
- Mostrar el ejemplo: "El informe de gestión del año 2025…" con **señala 42%**, **muestra 31%**, **indica 18%**.
- Usar esto para explicar por qué la misma pregunta da respuestas parecidas pero no idénticas.
- **No olvidar:** remarcar que elige la palabra **probable**, no necesariamente la **verdadera**; ahí nacen su utilidad y su riesgo.

## Slide 8 — Conceptos operativos
- Presentar los cuatro conceptos como la explicación de por qué el modelo **a veces olvida, repite o inventa**.
- **Token:** el modelo no "lee" letras ni palabras completas, sino fragmentos; por eso se equivoca al contar letras o al escribir palabras raras.
- **Ventana de contexto:** dar el ejemplo de una conversación larga donde el modelo "olvida" lo dicho al principio.
- **Temperatura:** explicar que no es creatividad mágica, sino cuánto se arriesga a elegir opciones menos probables (baja = predecible, alta = variada).
- **Embedding:** definirlo como "significado en números" y anunciar que es la base de la recuperación de información que se verá en la Sesión 10.
- **No olvidar:** decir que estos conceptos **explican el comportamiento real**, no son teoría de laboratorio.

## Slide 9 — Modelos generativos
- Presentar los dos tipos con un ejemplo local de cada uno: **texto** (respuesta a un reclamo) y **código** (fórmula o script para ordenar un archivo).
- Mencionar que también existen modelos de **imagen, audio y video**, y que algunos son **multimodales** (combinan tipos de contenido en la misma conversación).
- Aclarar que en esta sesión el foco está en **texto**, que es lo que se usa en la práctica.
- **No olvidar:** cerrar con la idea puente "palabra a palabra o línea a línea" y pasar a los límites.

## Slide 10 — Alcances y límites
- Explicar la **alucinación**: inventa con seguridad citas, datos y leyes que no existen.
- Dar el ejemplo del "artículo 45 de la Ley N° 1234": texto coherente pero falso.
- Explicar el **sesgo** (reproduce prejuicios del texto de entrenamiento) y la **fecha de corte** (solo sabe hasta que terminó su entrenamiento).
- Traducir cada límite a un **riesgo concreto** en gestión pública: cifras incorrectas, trato desigual y normativa desactualizada.
- **No olvidar:** dejar grabada la regla práctica: todo lo que salga de un LLM debe **verificarse** contra la fuente oficial.

## Slide 11 — Confidencialidad
- Instalar la **regla de confidencialidad** con la pregunta guía: "¿son datos de ciudadanos, documentos reservados o información no pública?".
- Enlazar con el **Bloque 5**: una cosa es publicar un dato abierto con su licencia y otra es subir datos personales o información reservada a un servicio externo.
- Dar las alternativas: trabajar con **ejemplos ficticios**, datos ya **públicos** o casos **anonimizados**.
- **No olvidar:** repetir que la **responsabilidad es del funcionario**, no de la herramienta.

## Slide 12 — El chat
- Mostrar la interfaz real: el cuadro de texto, el historial y la respuesta que se apoya en lo anterior.
- Explicar que es una **plataforma genérica**: cualquiera de las conocidas sirve (**ChatGPT, Gemini o Copilot**, por ejemplo); no hay una obligatoria.
- **Resolver el acceso:** mencionar el **Plan B sin cuenta** (documento compartido + demostración guiada del docente) para quien no pueda crear cuenta.
- Dar buenas prácticas: **una pregunta por vez** y pedir aclaración o reformulación si la respuesta no sirve.
- **No olvidar:** reforzar que la salida es una **propuesta a revisar**, nunca la verdad.

## Slide 13 — Qué es un prompt
- Definir el **prompt** como el texto que le damos al modelo: la instrucción o pedido.
- Enfatizar que la calidad de la respuesta depende, en gran parte, de cómo está redactado el prompt.
- Presentar las cuatro técnicas: **claridad, contexto, ejemplos y rol**.
- Señalar que se pueden combinar varias en un mismo prompt, sin que sea obligatorio usar todas.
- **No olvidar:** enmarcar que estas cuatro técnicas son la herramienta central que se llevan de la sesión.

## Slide 14 — Claridad y contexto
- Explicar la **claridad** como "qué, formato, extensión y tono" y el **contexto** como "para quién y para qué".
- Leer en voz alta el ejemplo **débil** y el **fuerte** para que se escuche la diferencia.
- Dar el ejemplo de contexto: "Soy funcionario de un gobierno municipal y debo responder una consulta ciudadana. Redactá la respuesta usando lenguaje claro".
- **No olvidar:** anticipar que estas dos técnicas son las mínimas que se piden en la práctica.

## Slide 15 — Ejemplos y rol
- Explicar los **ejemplos (few-shot)** como mostrar el resultado esperado para guiar formato y tono.
- Explicar el **rol** como pedirle que asuma un papel para ajustar la voz y el enfoque.
- Mostrar un ejemplo combinado de las cuatro técnicas en un mismo prompt institucional.
- Preguntar quién ya usa alguna de estas técnicas sin saber su nombre.
- **No olvidar:** repetir que las cuatro técnicas se pueden combinar y que no hay una única forma correcta de pedir.

## Slide 16 — Resumen de técnicas
- Repasar la tabla técnica por técnica con un ejemplo breve dicho en voz alta.
- Insistir en que esta tabla es la **síntesis práctica** de toda la parte teórica.
- Pedir que la copien o la fotografíen, porque se usa en la práctica y en el cierre.
- Conectar cada técnica con un pedido real que hacen a diario en la oficina.
- **No olvidar:** anunciar que la práctica de 30 minutos aplicará al menos claridad y contexto.

## Slide 17 — Iterar y verificar
- Explicar que la primera respuesta es un **borrador** y que trabajar con un LLM es **diálogo**.
- Recorrer el ciclo: **pedir, revisar, verificar y re-pedir**.
- **Esquema en pantalla (ciclo):** los cuatro pasos del ciclo y la nota de que se repite hasta obtener una versión presentable; destacar "verificar" como el paso obligatorio.
- Dar ejemplos de re-pedido: "resumí eso en tres viñetas", "escribilo en lenguaje más sencillo, para un ciudadano".
- **No olvidar:** usar el **criterio experto**: el funcionario conoce su área y detecta lo incorrecto que el modelo no ve.

## Slide 18 — Práctica
- Dar la consigna: elegir una tarea institucional real y armar un prompt con al menos **claridad + contexto**.
- Leer las cinco tareas sugeridas (reclamo, aviso, resumen, requisito y lista de verificación); aclarar que puede ser una tarea propia.
- Explicar los tres pasos: redactar el prompt, evaluar la respuesta e **iterar** al menos una vez.
- **Resolver el acceso:** plataforma genérica de chat (cualquiera sirve) y **Plan B sin cuenta** con documento compartido + demo guiada del docente.
- **No olvidar:** cronometrar los **30 minutos completos**; la puesta en común va al cierre.

## Slide 19 — Puesta en común
- Pedir a cada persona exponer en 1–2 minutos: **el prompt mejorado y qué cambió** respecto del primero.
- Pedir que cada uno nombre **un dato que verificaría** antes de usar la respuesta.
- Contrastar los prompts y criterios: ¿qué hizo la diferencia?
- **No olvidar:** valorar que el prompt incluya claridad y contexto y que se identifique un punto a verificar.

## Slide 20 — Cierre
- Releer los tres mensajes de síntesis: **modelo** (genera palabra por palabra con probabilidades), **prompt** (claridad, contexto, ejemplos y rol) y **verificar** (datos y normas contra la fuente oficial).
- Volver a las dos preguntas del inicio y verificar que el grupo ya puede responderlas.
- Repetir la **regla de confidencialidad** y anticipar la Sesión 10: los **agentes de IA** y el taller integrador.
- **No olvidar:** cerrar con la entrega: el prompt mejorado de una tarea real con una observación de verificación.

## Slide 21 — Gracias
- Agradecer la asistencia y el trabajo de la práctica.
- Recordar la entrega pendiente: **prompt mejorado más la observación de verificación**.
- Aclarar que no hace falta memorizar la teoría, sino quedarse con el hábito de **pedir bien y verificar**.
- **No olvidar:** dejar a mano el material y confirmar la fecha y el tema de la Sesión 10.
