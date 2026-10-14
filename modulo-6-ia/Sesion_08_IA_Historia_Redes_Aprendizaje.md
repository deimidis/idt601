# Sesión 8 — Inteligencia artificial: historia, redes neuronales y aprendizaje

**Módulo:** Ingeniería de Datos (IDT 601)
**Bloque:** 6 — Historia y Desarrollo de la Inteligencia Artificial
**Duración:** 3 horas (180 min) — teóricas y prácticas
**Público:** Profesionales no especializados en ingeniería de datos
**Modalidad:** 100 % virtual

---

## Objetivos de la sesión

- Comprender qué es la inteligencia artificial y cómo evolucionó desde las reglas fijas hasta el aprendizaje con datos.
- Distinguir la perspectiva **determinista** (reglas fijas) de la **indeterminista** (aprendizaje desde datos) y reconocer cuándo conviene cada una.
- Entender qué es una red neuronal: neurona, capas, pesos y el ciclo de entrenamiento (error, ajuste de pesos, épocas).
- Explicar por qué un modelo que "funciona en la demo" puede **fallar en producción**, y qué papel cumplen la separación entrenamiento/validación/prueba, el **sobreajuste** y las **métricas** (exactitud y precisión).
- Diferenciar los tres grandes tipos de aprendizaje: **supervisado**, **no supervisado** y **por refuerzo**.
- Relacionar estos conceptos con problemas reales de la gestión pública boliviana.

## Ideas clave (qué debe quedar al final)

1. La IA no es un solo método: hay un espectro entre **reglas explícitas** (determinista) y **aprendizaje desde datos** (indeterminista).
2. **Determinista** = el sistema sigue reglas escritas por un humano; misma entrada, misma salida; comportamiento predecible y explicable.
3. **Indeterminista** = el sistema aprende patrones de ejemplos; la salida es probabilística y a veces poco explicable ("caja negra").
4. Elegir el enfoque depende del problema: reglas claras y estables → determinista; muchos datos y patrones difíciles de codificar → indeterminista.
5. Una **red neuronal** es una estructura inspirada en el cerebro: neuronas organizadas en **capas** que ajustan **pesos** durante el **entrenamiento**.
6. Aprender, en una red, es **ajustar pesos** para reducir el error: se compara la salida con la respuesta esperada (función de **pérdida**) y se corrige; cada pasada completa sobre los ejemplos es una **época**.
7. Un modelo que se evalúa con los mismos datos con que aprendió siempre parece bueno. Por eso se separan **entrenamiento, validación y prueba**, y se vigila el **sobreajuste** con **métricas** como la **exactitud** y la **precisión**.
8. Hay **tres grandes tipos de aprendizaje**: **supervisado** (datos etiquetados), **no supervisado** (agrupar y hallar patrones sin etiquetas) y **por refuerzo** (ensayo, error y recompensa).
9. Elegir el tipo depende de los **datos disponibles** y del **problema**; en gestión pública ya se aplican a trámites, anomalías, segmentación y optimización de recursos.

## Cronograma sugerido (180 min)

| Bloque | Duración | Qué ocurre |
|---|---|---|
| Apertura y encuadre | 10 min | Bienvenida, preguntas de la sesión y palabras clave. |
| Historia de la IA | 20 min | Relato guiado en cinco momentos, sin tecnicismos. |
| Dos perspectivas | 25 min | Determinista vs. indeterminista: comparación y criterios. |
| Pausa | 10 min | Receso. |
| Qué es una red neuronal | 35 min | Neurona, capas, pesos, entrenamiento, sobreajuste y métricas. |
| Tipos de aprendizaje | 25 min | Supervisado, no supervisado y por refuerzo. |
| Ejemplos en la gestión pública | 10 min | Casos aplicados a datos del Estado. |
| Dinámica: ¿regla, dato o aprendizaje? | 30 min | Dos rondas de 4 casos y puesta en común (3 equipos). |
| Cierre y preguntas | 15 min | Síntesis, dudas y puente a los LLM. |

> **Ajuste de tiempos:** el bloque de redes sube de 30 a 35 min para incorporar **sobreajuste, separación entrenamiento/validación/prueba, función de pérdida, épocas y métricas**, y explicar por qué un modelo "funciona en la demo y falla en producción". Los 5 min extra se recuperan recortando tipos de aprendizaje (30→25) y ejemplos de gestión pública (15→10). La dinámica sube de 25 a 30 min para dejar 4 casos por ronda y una puesta en común cómoda para 3 equipos, sin salir de las 3 horas.

---

## Apertura y encuadre (10 min)

- Presentar el Bloque 6 — Historia y Desarrollo de la Inteligencia Artificial y ubicar la sesión como un recorrido: **de las reglas fijas al aprendizaje con datos**.
- Advertir que el público no es especialista: *"no hace falta programar; vamos a entender las ideas y cómo se usan"*.
- Prender la curiosidad con la pregunta central: *"¿Cómo decide una máquina? ¿Sigue reglas o aprende por su cuenta?"*
- Palabras clave de la sesión: **regla, dato, modelo, predicción, probabilidad, neurona, peso, entrenamiento, etiqueta, sobreajuste, métrica**.
- Presentar las tres preguntas que ordenan el día: **¿qué es la IA y de dónde viene?**, **¿reglas fijas o aprendizaje con datos?** y **¿cómo aprende una red neuronal?**

> Momento de enganche: preguntar al grupo *"¿cómo aprendiste a distinguir un trámite 'urgente' de uno 'normal'? ¿Te enseñaron con ejemplos etiquetados, lo dedujiste agrupando, o lo aprendiste a los golpes?"* Cada respuesta anticipa uno de los tres tipos de aprendizaje que se verán más adelante.

---

## Historia de la IA (20 min)

Recorrer de forma cronológica y sin tecnicismos:

1. **La idea de máquinas que piensan** (años 1950). Turing y el test que lleva su nombre: la pregunta es *"¿puede una máquina comportarse como un humano?"*.
2. **La lógica simbólica — la era de las reglas** (1960s–1970s). Sistemas expertos que codifican el conocimiento de especialistas como reglas *"si... entonces..."*. Ejemplo: un sistema que diagnostica averías siguiendo el manual de un experto.
3. **El giro al aprendizaje** (1980s–1990s). Codificar todas las reglas del mundo real es imposible: mejor dar ejemplos a la máquina para que ella descubra los patrones.
4. **La explosión de datos y cómputo** (2000s–2010s). Internet genera enormes cantidades de datos y las máquinas tienen potencia para procesarlos → aprendizaje automático a escala.
5. **Hoy: la IA generativa** (2010s–actualidad). Modelos que no solo clasifican, sino que generan texto, imágenes y código.

**Idea para la pizarra:**

| Momento | Aportación |
|---|---|
| 1950s — La pregunta | Turing: ¿puede una máquina comportarse como un humano? |
| 1960–70s — Las reglas | Sistemas expertos: conocimiento codificado en reglas. |
| 1980–90s — El aprendizaje | Imposible escribir todas las reglas → dar ejemplos. |
| 2000s — Datos y cómputo | Internet produce datos masivos y hay potencia de cálculo. |
| Hoy — IA generativa | No solo clasifica: genera texto, imágenes y código. |

**Esquema en pantalla:** `assets/esquema-linea-tiempo-ia.svg` (los cinco momentos sobre una línea de tiempo).

**Mensaje puente:** *"A lo largo de esta historia conviven dos filosofías: decirle a la máquina qué hacer (determinista) o dejar que descubra los patrones (indeterminista). Veamos bien la diferencia."*

---

## Dos perspectivas (25 min)

### La perspectiva determinista

- El sistema funciona **con reglas fijas** escritas por un humano.
- Ante la misma entrada, **siempre da la misma salida**: comportamiento predecible.
- Es **explicable**: podemos seguir el razonamiento paso a paso.
- **Ejemplo en gestión pública:** un sistema de verificación que aprueba un trámite solo si están todos los documentos obligatorios. Un semáforo programado también: cambia de color según una regla, no "piensa", cumple un plan.

**Ideas para la pizarra:**
- Regla: `si (condición) entonces (acción)`.
- Ventajas: predecible, fácil de auditar y explicar.
- Límites: si aparece un caso no previsto, el sistema no sabe qué hacer.

### La perspectiva indeterminista

- El sistema **aprende patrones a partir de ejemplos (datos)**.
- No hay reglas escritas a mano; se construyen a partir de los datos.
- La salida es **probabilística**: da una respuesta con un nivel de confianza, no con certeza total.
- Es **menos explicable** a veces: la "caja negra".
- **Ejemplo en gestión pública:** un sistema que clasifica reclamos por tema. No le dijimos la regla; aprendió de miles de reclamos ya derivados al área correcta.

**Ideas para la pizarra:**
- En vez de reglas, se usan **ejemplos** para entrenar un **modelo**.
- Ventajas: captura patrones que un humano no sabría escribir.
- Límites: puede equivocarse y a veces no sabemos por qué.

### Tabla comparativa

| Aspecto | Determinista | Indeterminista |
|---|---|---|
| Reglas | Escritas a mano | Aprendidas de los datos |
| Comportamiento | Predecible | Probabilístico |
| Explicabilidad | Alta | Puede ser baja |
| Datos necesarios | Pocos | Muchos |
| Ideal para | Reglas claras y estables | Patrones complejos y cambiantes |
| Ejemplos | Verificación de documentos, semáforo | Recomendación, reconocimiento, predicción |

### Cuándo conviene cada enfoque

- **Trámite administrativo** con requisitos claros y fijos → **determinista** (verificación de documentos).
- **Predicción de demanda** de un servicio según estación y clima → **indeterminista** (hay patrones, no reglas simples).
- **Combinada:** un filtro de correo no deseado mezcla reglas del remitente con aprendizaje del contenido.

**Mensaje puente:** *"No se trata de cuál es mejor, sino de cuál se ajusta al problema. Cuando el sistema realmente aprende de los datos, aparece la herramienta estrella: la red neuronal."*

---

## Pausa (10 min)

---

## Qué es una red neuronal (35 min)

Explicar sin tecnicismos, con analogías cercanas.

### La neurona artificial

- Inspirada en la neurona biológica: recibe **entradas**, las **pondera** y produce una **salida**.
- Analogía: una neurona es como un **funcionario de ventanilla** que recibe varios papeles (entradas), da más importancia a unos que a otros (pesos) y decide una respuesta (salida).

### Capas

- Las neuronas se organizan en **capas**:
  - **Capa de entrada** — recibe los datos.
  - **Capas ocultas** — procesan y combinan la información.
  - **Capa de salida** — entrega el resultado (una etiqueta, un número, una decisión).
- Analogía: una **cadena de decisiones**, donde cada oficina recibe lo que resolvió la anterior y lo refina.

### Pesos

- Cada conexión entre neuronas tiene un **peso**: un número que indica cuánto importa esa entrada.
- Aprender = **ajustar esos pesos**.

### Entrenamiento: el ciclo

El proceso de aprendizaje sigue un ciclo:

1. Se presentan **ejemplos** (datos).
2. La red produce una **salida**.
3. Se compara con la respuesta esperada y se calcula el **error** con una **función de pérdida**.
4. Se **ajustan los pesos** para reducir ese error.
5. Se repite muchas veces: cada pasada completa sobre **todos** los ejemplos es una **época**.

- Analogía: aprender a **afinar un instrumento** o a **tirar al aro** — repetir y corregir en función del error.

**Idea para la pizarra:** `assets/esquema-red-neuronal.svg` (3 entradas → capa oculta → salida, con pesos `w` y `v` en cada conexión).

### Por qué "funciona en la demo y falla en producción"

- Si medimos el desempeño con los **mismos datos** con que el modelo aprendió, siempre parecerá bueno.
- Por eso los datos se separan en tres grupos:

| Grupo | Para qué sirve |
|---|---|
| **Entrenamiento** | Los ejemplos con los que el modelo aprende y ajusta sus pesos. |
| **Validación** | Un grupo aparte para tomar decisiones durante el desarrollo, sin usarlo para aprender. |
| **Prueba** | Un grupo que el modelo **nunca vio**, que estima cómo funcionará con casos nuevos. |

- Cuando el modelo **memoriza** los ejemplos de entrenamiento en vez de captar el patrón, tenemos **sobreajuste**: acierta en lo conocido y falla en lo nuevo. Es la causa típica del "en la demo andaba y en producción no".

### Cómo medimos: métricas

Dos métricas básicas, que no son lo mismo:

- **Exactitud:** proporción de aciertos sobre el total de casos evaluados.
- **Precisión:** de los casos que el modelo marcó como positivos, cuántos lo eran de verdad.

Una **exactitud** alta con **precisión** baja (o al revés) obliga a preguntar *para qué* se usará el modelo: no es lo mismo filtrar unos pocos casos dudosos que decidir sobre un trámite. La elección de la métrica depende del costo del error en cada caso.

---

## Tipos de aprendizaje (25 min)

### Aprendizaje supervisado

- Se entrena con **datos etiquetados**: cada ejemplo viene con su respuesta correcta (**etiqueta**).
- La red aprende a **predecir la etiqueta** de casos nuevos.
- Dos subtipos comunes: **clasificación** (asignar una categoría) y **regresión** (predecir un número).
- **Ejemplo:** clasificar un trámite como "urgente" o "no urgente" a partir de miles de trámites ya etiquetados.

### Aprendizaje no supervisado

- Se entrena con **datos sin etiquetas**; no hay respuesta correcta.
- La red busca **estructura oculta**: agrupar casos parecidos o hallar patrones.
- Técnica típica: **agrupación (clustering)**.
- **Ejemplo:** agrupar a los ciudadanos de un municipio en segmentos según sus patrones de uso de servicios, sin haber definido los grupos de antemano.

### Aprendizaje por refuerzo

- No se entrena con respuestas correctas, sino con **recompensas y penalizaciones**.
- Un **agente** actúa en un entorno, recibe **recompensa** o **penalización**, y ajusta su comportamiento para maximizar la recompensa.
- Es **ensayo, error y recompensa**.
- **Ejemplo:** optimizar la programación de semáforos para reducir el tránsito: el sistema prueba combinaciones y aprende cuáles funcionan mejor.

> **Precisión de vocabulario.** El preentrenamiento de una red **no "refuerza"**: compara la salida con la respuesta correcta y **corrige los pesos** para reducir el error. El **refuerzo** es otra cosa: la señal de **recompensa** del aprendizaje por refuerzo, la de este último bloque.

### Tabla comparativa

| Tipo | ¿Qué datos necesita? | ¿Qué aprende? | Señal de aprendizaje | Ejemplo típico |
|---|---|---|---|---|
| Supervisado | Etiquetados | Predecir etiqueta o valor | Respuesta correcta | Clasificar trámites, predecir demanda |
| No supervisado | Sin etiquetas | Agrupar y hallar patrones | Estructura de los datos | Segmentar ciudadanos, detectar anomalías |
| Por refuerzo | Interacción con el entorno | Decidir acciones | Recompensa / penalización | Optimizar semáforos, asignar recursos |

---

## Ejemplos en la gestión pública (10 min)

Conectar cada tipo con casos reales o plausibles del Estado boliviano:

- **Supervisado:**
  - Clasificación automática de **reclamos** por tema (agua, alumbrado, vías) para derivarlos al área correcta.
  - Predicción de **demanda** de un servicio para planificar turnos y personal.
- **No supervisado:**
  - **Segmentación** de beneficiarios de programas sociales según características comunes.
  - **Detección de anomalías** en gastos o en trámites (casos que se salen del patrón).
- **Por refuerzo:**
  - **Optimización de rutas** de recolección de residuos o de patrullaje.
  - **Asignación dinámica de recursos** (camiones, brigadas) según la situación observada.

**Mensaje puente:** *"No siempre hay etiquetas. A veces solo tenemos datos y queremos descubrir grupos; a veces necesitamos decidir en secuencia. Por eso hay más de un tipo de aprendizaje."*

---

## Dinámica: ¿regla, dato o aprendizaje? (30 min)

> Insumos y tarjetas listos para copiar: `insumos/tarjetas-dinamica-s8.md`. Entregable: `plantilla-ficha-dinamica.md`. Clave de corrección: `guia-solucion-docente-sesion8.md`.

**Objetivo:** aplicar lo aprendido clasificando situaciones reales del trabajo y justificando el enfoque, y cerrar con la **ficha de la dinámica**.

**Pasos:** conformar **3 equipos** de 3–4 personas y repartir las tarjetas. La dinámica tiene **dos rondas de 4 casos cada una** y una puesta en común.

**Ronda 1 — ¿regla o dato? (10 min).** Cada equipo decide si cada situación es claramente **determinista**, claramente **indeterminista** o **combinada**, y justifica en una frase.

- Un sistema que verifica que un formulario traiga todos los campos obligatorios.
- Un buscador que ordena resultados según lo que la gente suele abrir.
- Un asistente que clasifica correos según su contenido.
- Un semáforo que regula el tránsito con horarios fijos.

**Ronda 2 — ¿cómo aprende? (10 min).** Cada equipo asigna cada caso a **supervisado**, **no supervisado** o **por refuerzo**, e identifica la señal de aprendizaje.

- Clasificar fotos de baches según su gravedad, con fotos ya calificadas.
- Agrupar a los contribuyentes en perfiles según cuánto y cuándo pagan.
- Un sistema que ordena expedientes para reducir la espera, probando y recibiendo recompensa.
- Predecir cuántos pacientes atenderá un centro de salud el próximo mes.

**Puesta en común (8 min, 3 equipos).** Cada equipo comparte el caso **más fácil**, el **más discutido** y por qué (2–3 min por equipo).

**Cierre de la dinámica (2 min).** El docente contrasta las respuestas y refuerza las tres preguntas de control: *¿hay etiquetas? ¿se busca agrupar? ¿hay una acción y una recompensa?*

**Guía de corrección:** en la Ronda 1, valorar especialmente la opción **"combinada"** (la verificación de formularios puede sumar reglas de longitud y formato a un chequeo aprendido). En la Ronda 2, la clave es distinguir si hay **etiquetas** (supervisado), **sin etiquetas y se busca agrupar** (no supervisado) o **una acción con recompensa** (refuerzo). No hay una única respuesta correcta absoluta; el objetivo es razonar.

**Evaluación de la dinámica:** participación, clasificación coherente y justificación. Los criterios con niveles están en `rubrica-modulo.md` (Sesión 8).

---

## Cierre y preguntas (15 min)

- Síntesis con el grupo: releer en voz alta la tabla comparativa determinista/indeterminista y la de los tres tipos de aprendizaje.
- Reforzar las ideas centrales: *"No hay un enfoque mejor, sino el que se ajusta al problema"* y *"una red neuronal aprende ajustando pesos; la forma de aprender depende de los datos y del problema"*.
- Recordar el mensaje de la demo: *"un modelo que solo se mide con lo que ya vio engaña; por eso se separa el conjunto de prueba y se vigilan el sobreajuste y las métricas"*.
- Anticipar la próxima sesión: *"La red neuronal es la base de la IA actual. La próxima vez vemos su versión a gran escala: los modelos de lenguaje (LLM) y el prompting, los chats que generan texto que usamos a diario."*
- Espacio de preguntas y dudas.

---

## Recursos

- Presentación `presentacion_sesion8.html` y deck `deck-sesion-08.html`.
- Esquemas SVG: `assets/esquema-linea-tiempo-ia.svg` (historia) y `assets/esquema-red-neuronal.svg` (cómo aprende una red).
- Pizarra o pizarra digital para el esquema determinista/indeterminista y el dibujo de la red (entradas → capas → salida).
- Tarjetas de la dinámica: `insumos/tarjetas-dinamica-s8.md`.
- Lecciones del bloque: `lessons/0001` a `lessons/0004` y hojas de referencia en `reference/`.

## Evaluación de la sesión

Los criterios y sus niveles están en `rubrica-modulo.md` (Sesión 8 — Historia, redes neuronales y aprendizaje).

| Criterio | Evidencia |
|---|---|
| Clasifica el enfoque (determinista / indeterminista / combinada) | Ficha de la dinámica, Ronda 1 |
| Justifica la elección del enfoque | Argumentación en la ficha y en la puesta en común |
| Explica cómo aprende una red neuronal | Ficha de la dinámica y participación en el bloque de redes |
| Reconoce el sobreajuste y la utilidad del conjunto de prueba | Aportes en el bloque de redes y en el cierre |
| Diferencia los tres tipos de aprendizaje | Ficha de la dinámica, Ronda 2 |
| Relaciona cada tipo con la gestión pública | Ejemplos aportados en la discusión |

**Entrega sugerida:** **ficha de la dinámica** con los casos clasificados en las dos rondas, la señal de aprendizaje de cada uno y una breve justificación.
