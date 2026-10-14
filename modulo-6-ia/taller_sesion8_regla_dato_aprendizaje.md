# Taller — Sesión 8: ¿regla, dato o aprendizaje?

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 6 — Inteligencia Artificial
**Duración:** 30 min de taller (3 de consigna + 10 de Ronda 1 + 10 de Ronda 2 + 7 de puesta en común y cierre), dentro de la sesión de 3 horas
**Modalidad:** 100 % en línea (Zoom + salas) · **Modo A** (equipos) o **Modo B** (demostración del docente)
**Herramienta:** ninguna que instalar — lectura + documento compartido (Google Docs/Word en línea) o `plantilla-ficha-dinamica.md`.
**Insumos:** `insumos/tarjetas-dinamica-s8.md` (12 tarjetas, 2 rondas) · `plantilla-ficha-dinamica.md`
**Entregable:** la **ficha de la dinámica**, cerrada en la sesión.
**Evaluación:** `rubrica-modulo.md` — Sesión 8 (Historia, redes neuronales y aprendizaje).

---

## Objetivo

Que cada equipo **clasifique situaciones reales** de la gestión pública y **justifique** su elección:

1. **Ronda 1 — ¿regla o dato?** Decidir si el caso es **determinista**, **indeterminista** o **combinada**.
2. **Ronda 2 — ¿cómo aprende?** Asignar cada caso a **supervisado**, **no supervisado** o **por refuerzo**, e identificar la **señal de aprendizaje**.
3. **Puesta en común:** compartir el caso más fácil, el más discutido y por qué.

No se escribe código: se clasifica, se justifica y se documenta en una ficha.

## Caso institucional

> *En un municipio boliviano, la **Unidad de Atención al Ciudadano** convive a diario con dos mundos.
> Por un lado, hay trámites que se resuelven con **reglas claras** (¿trajo todos los documentos?,
> ¿el formulario está completo?). Por otro, hay **patrones que nadie escribió en un manual**: qué días
> llegan más reclamos, qué trámites se parecen a un fraude, cómo conviene ordenar la atención para
> reducir la espera. La unidad necesita decidir, caso por caso, cuándo conviene una **regla fija** y
> cuándo un sistema que **aprenda de los datos** —y, cuando aprende, **de qué manera**.*
>
> Las 12 tarjetas del taller son exactamente esas situaciones. El equipo las clasifica y justifica,
> como lo haría al diseñar la próxima mejora de la unidad.

**Tarjetas de trabajo:** `insumos/tarjetas-dinamica-s8.md` — 6 casos en la Ronda 1 y 6 en la Ronda 2; en clase se trabajan **4 por ronda** y las otras 2 quedan como reserva.

## Insumo y preparación previa (el día anterior)

1. Subir a Moodle (o tener listo para pegar en el chat) el archivo `insumos/tarjetas-dinamica-s8.md`.
2. Subir la `plantilla-ficha-dinamica.md` (una copia por equipo, o un documento compartido).
3. Tener preparada una **ficha de ejemplo** (para el Modo B) con las respuestas de una ronda.
4. Tener listo un **documento compartido o pizarra** para pegar las fichas en la puesta en común.
5. Revisar `guia-solucion-docente-sesion8.md`: contiene la clave de las dos rondas y los criterios con niveles.

## Reparto del tiempo (30 min, en línea)

| Momento | Tiempo | Quién |
|---|---|---|
| Consigna, conformación de **3 equipos** (3–4 personas) y reparto de tarjetas | 3 min | Docente |
| **Ronda 1 — ¿regla o dato?** (4 casos) | 10 min | Equipos |
| **Ronda 2 — ¿cómo aprende?** (4 casos) | 10 min | Equipos |
| Puesta en común (3 equipos, 2 min cada uno) y cierre | 7 min | Todos |

> **Ajuste de tiempos.** Con las 4 tarjetas por ronda, cada ronda entra en 10 min. Si el grupo es rápido y se suman las tarjetas de **reserva**, cada ronda puede extenderse hasta **15 min** sin salir de las 3 horas.

---

## Pasos del trabajo

**Consigna:** "Clasifiquen cada caso y **justifiquen en una frase**. No se trata de memorizar definiciones: se trata de **decidir** y **fundamentar**."

**Ronda 1 (10 min) — ¿regla o dato?**

1. Lean los 4 casos **en uso** de la Ronda 1.
2. Para cada uno decidan: **determinista** (reglas fijas), **indeterminista** (aprende de datos) o **combinada**.
3. Justifiquen: ¿puedo escribir la regla en una frase? ¿necesito ver muchos ejemplos?

**Ronda 2 (10 min) — ¿cómo aprende?**

1. Lean los 4 casos **en uso** de la Ronda 2.
2. Para cada uno decidan: **supervisado**, **no supervisado** o **por refuerzo**.
3. Identifiquen la **señal de aprendizaje**: ¿hay **etiquetas**? ¿se busca **agrupar**? ¿hay una **acción** con **recompensa**?

## Plantilla de entrega

Completar `plantilla-ficha-dinamica.md` (o su copia en el documento compartido). Debe tener:

1. Ronda 1: enfoque elegido y justificación por caso.
2. Ronda 2: tipo de aprendizaje, **señal** y justificación por caso.
3. El caso más fácil y el más discutido, con el por qué.
4. Una conexión con un caso propio de su institución.

## Modo A — Trabajo de participantes (salas)

**Consigna (pegar en el chat):** "Clasifiquen los 4 casos de cada ronda y completen la ficha. Entregan la ficha al cerrar la sesión. Guarden el enlace con permiso de edición."

- Roles del equipo: **coordinador** (cuida el tiempo de cada ronda) y **relator** (comparte pantalla en la puesta en común).
- Rol del docente: **rotar por las salas cada 4–5 min**, destrabar sobre todo dos puntos:
  - La diferencia entre **determinista** y **combinada** (una verificación de formularios puede sumar reglas y aprendizaje).
  - La diferencia entre **no supervisado** y **por refuerzo** (agrupar por estructura **no** es lo mismo que actuar y recibir recompensa).

## Modo B — Demostración del docente (guion para compartir pantalla, 20 min)

Versión totalmente guiada. Los participantes siguen con la vista y anotan.

1. **Encuadre (2 min).** "Vamos a decidir, caso por caso, cuándo conviene una regla y cuándo un sistema que aprende de los datos."
2. **Ronda 1 (6 min).** Leer en voz alta los 4 casos y pensar en voz alta la clasificación y la justificación.
3. **Ronda 2 (6 min).** Repetir con los 4 casos de la segunda ronda, nombrando cada vez la **señal de aprendizaje**.
4. **Momentos de duda (4 min).** Mostrar el caso de la verificación de formularios (determinista o combinada) y el de los trámites fuera de patrón (no supervisado o por refuerzo).
5. **Cierre (2 min).** Repetir el criterio: **reglas, datos o aprendizaje** según el problema; y recordar que medir solo con lo que ya vio **engaña** (sobreajuste).

> **Consejo de pantalla:** tener la tabla comparativa (determinista/indeterminista) y la tabla de los tres tipos de aprendizaje a la vista mientras se clasifica.

## Puesta en común (7 min)

El **relator** de cada equipo comparte pantalla (2 min por equipo, 3 equipos). Cuenta:

- **El caso más fácil** y por qué.
- **El caso más discutido** y qué los hizo dudar.

El docente contrasta las respuestas y refuerza las ideas fuerza: *no hay un enfoque mejor, sino el que se ajusta al problema; y medir un modelo solo con los datos con que aprendió engaña.*

---

## Evaluación y entrega

Criterios de la Sesión 8 en `rubrica-modulo.md`:

| Criterio | Evidencia |
|---|---|
| Clasifica el enfoque (determinista / indeterminista / combinada) | Ronda 1 de la ficha |
| Justifica la elección | Justificación por caso, en la ficha y en la puesta en común |
| Explica cómo aprende una red | Aportes en el bloque de redes y en la ficha |
| Distingue los tres tipos de aprendizaje | Ronda 2 de la ficha |
| Conecta con la gestión pública | Preguntas 4 y 5 de la ficha |

**Entrega por equipo:** la **ficha de la dinámica** completada (o el enlace del documento). Se cierra **dentro de la sesión**.

## Problemas frecuentes (y qué hacer)

| Síntoma | Causa | Solución |
|---|---|---|
| Clasifican todo como indeterminista "porque son datos" | Confunden "usar datos" con "aprender de datos" | Preguntar: ¿la salida se decide con una regla escrita o se descubre de ejemplos? |
| Ignoran la opción "combinada" | Creen que es una dicotomía | Mostrar que la verificación de formularios puede sumar reglas y aprendizaje. |
| Confunden no supervisado con por refuerzo | No distinguen agrupar de actuar | Preguntar: ¿buscamos grupos o hay una acción con recompensa? |
| Confunden supervisado con no supervisado | No miran las etiquetas | Preguntar: ¿cada ejemplo trae su respuesta correcta? Si sí, es supervisado. |
| Justifican con el enunciado repetido | Creen que alcanza con elegir | Pedir la frase "porque…" y recordar que se evalúa la justificación. |

## Plan B (si falla la conexión o el acceso)

- **Sin salas:** cada equipo trabaja en un documento compartido coordinado por el chat.
- **Sin poder abrir las tarjetas:** el docente comparte pantalla con las tarjetas y los equipos completan la ficha.
- **Sin audio:** la consigna y la puesta en común se hacen por chat y pantalla compartida.
- **Poco tiempo:** trabajar solo las 4 tarjetas **en uso** de cada ronda y usar las de reserva como tarea.

---

## Nota para el docente

- El taller **reemplaza** la dinámica original de 25 min y la ajusta a **4 casos por ronda** con puesta en común para **3 equipos**, dentro de las 3 horas.
- La **solución modelo** (respuestas de las dos rondas, errores frecuentes y rúbrica) está en `guia-solucion-docente-sesion8.md`.
- Los criterios y sus niveles están en `rubrica-modulo.md` (Sesión 8).
