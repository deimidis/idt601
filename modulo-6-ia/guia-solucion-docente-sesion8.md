# Guía de solución del docente — Taller Sesión 8

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 6 — Inteligencia Artificial
**Taller:** `taller_sesion8_regla_dato_aprendizaje.md`
**Tarjetas:** `insumos/tarjetas-dinamica-s8.md` · **Entregable:** `plantilla-ficha-dinamica.md`
**Uso:** clave de las dos rondas, criterios de corrección y rúbrica con niveles.

---

## 1. Clave de la Ronda 1 — ¿regla o dato?

> Criterio: **determinista** = reglas escritas, misma entrada → misma salida; **indeterminista** = aprende patrones de ejemplos; **combinada** = mezcla reglas y aprendizaje.

| Tarjeta | Caso | Respuesta esperada | Matiz |
|---|---|---|---|
| R1-1 | Verificación de un formulario | Determinista | Puede ser **combinada** si además aprende de casos dudosos o de texto libre. |
| R1-2 | Buscador que ordena por clics | Indeterminista | Aprende de la conducta de los usuarios, no de una regla escrita. |
| R1-3 | Asistente que clasifica correos | Indeterminista / Combinada | Combinada si suma reglas del remitente (dominios, palabras) al contenido aprendido. |
| R1-4 | Semáforo con horarios fijos | Determinista | Cumple un plan; no aprende del tránsito. |
| R1-5 | Predicción de uso de un servicio | Indeterminista | Hay patrones (día, clima, estación), no una regla simple. |
| R1-6 | Control de accesos con credenciales | Determinista | Regla fija: si las credenciales son válidas, deja pasar. |

**Lo que hay que premiar:** reconocer que **"combinada" es una respuesta válida y frecuente**, y justificar con el problema y los datos disponibles, no solo con la etiqueta.

---

## 2. Clave de la Ronda 2 — ¿cómo aprende?

> Criterio: **supervisado** = hay **etiquetas** (respuesta correcta); **no supervisado** = sin etiquetas, se busca **estructura/grupos**; **por refuerzo** = hay una **acción** con **recompensa o penalización**.

| Tarjeta | Caso | Respuesta esperada | Señal de aprendizaje |
|---|---|---|---|
| R2-1 | Fotos de baches ya calificadas | Supervisado | Respuesta correcta: cada foto trae su gravedad asignada. |
| R2-2 | Perfiles de contribuyentes | No supervisado | Estructura de los datos: se agrupa por parecido, sin categorías previas. |
| R2-3 | Ordenar expedientes con recompensa | Por refuerzo | Recompensa: prueba órdenes y aprende cuáles reducen la espera. |
| R2-4 | Predicción de pacientes | Supervisado (regresión) | Respuesta correcta: se conocen las cifras históricas de atención. |
| R2-5 | Trámites fuera de patrón | No supervisado | Estructura de los datos: se detectan casos que se alejan del patrón, sin ejemplos de fraude. |
| R2-6 | Barrios que usan un servicio | No supervisado | Estructura de los datos: se descubren grupos sin categorías previas. |

**Matiz importante:** R2-5 suele confundirse con **supervisado**; la clave es que **no hay ejemplos etiquetados de fraude**, por eso es no supervisado (detección de anomalías). Si el docente acepta una respuesta supervisada, debe pedir que se justifique con la existencia de etiquetas.

---

## 3. Las tres señales, en una frase

| Tipo | Pregunta de control | Señal |
|---|---|---|
| Supervisado | ¿Cada ejemplo trae su **respuesta correcta**? | La etiqueta. |
| No supervisado | ¿Buscamos **grupos o patrones** sin categorías previas? | La estructura de los datos. |
| Por refuerzo | ¿Hay una **acción** con **recompensa o penalización**? | La recompensa. |

> **Precisión de vocabulario.** El preentrenamiento de una red **no "refuerza"**: compara la salida con la respuesta correcta y **corrige los pesos**. El **refuerzo** es la recompensa del aprendizaje por refuerzo (R2-3).

---

## 4. Ficha de la dinámica — solución orientativa

- **Caso más fácil (habitual):** R1-4 (semáforo) y R1-6 (accesos), porque la regla se escribe en una frase.
- **Caso más discutido (habitual):** R1-1 / R1-3 (determinista o combinada) y R2-5 (no supervisado o supervisado).
- **Conexión con su institución:** se espera un ejemplo propio por tipo (supervisado: clasificar un trámite ya etiquetado; no supervisado: agrupar usuarios; refuerzo: optimizar un reparto o una ruta).

---

## 5. Errores frecuentes y cómo orientarlos

| Error | Cómo se detecta | Cómo orientar |
|---|---|---|
| "Usa datos, entonces aprende" | Clasifican todo como indeterminista | Preguntar si la salida viene de una regla escrita o se descubre de ejemplos. |
| Ignorar "combinada" | Fuerzan todo a determinista o indeterminista | Mostrar que la verificación de formularios puede sumar reglas y aprendizaje. |
| No supervisado vs. refuerzo | Eligen uno por otro | Preguntar: ¿buscamos grupos o hay una acción con recompensa? |
| Supervisado vs. no supervisado | No miran las etiquetas | Preguntar: ¿cada ejemplo trae su respuesta correcta? |
| Justifican repitiendo el enunciado | No hay un "porque" | Pedir la frase "porque…"; se evalúa la justificación, no solo la etiqueta. |
| Confunden sobreajuste con "entrenar mucho" | Dicen "se pasó de entrenamiento" | El sobreajuste es **memorizar** el entrenamiento y **fallar** con casos nuevos; se detecta con el conjunto de prueba. |

## 6. Rúbrica con niveles

Criterios de la **Sesión 8** según `rubrica-modulo.md`, con descriptores observables:

| Criterio | Insuficiente (1–59) | Suficiente (70–84) | Excelente (95–100) |
|---|---|---|---|
| **Clasifica el enfoque** | Confunde los enfoques; clasifica al azar. | Clasifica correctamente la mayoría de los casos. | Clasifica con acierto, incluidos los combinados, y reconoce los fronterizos. |
| **Justifica la elección** | No justifica o repite el enunciado. | Justifica con la presencia o ausencia de reglas fijas. | Justifica con el problema, los datos disponibles y el costo de cada enfoque. |
| **Explica cómo aprende una red** | Menciona "aprende" sin describir el ciclo. | Describe neuronas, capas y ajuste de pesos. | Explica el ciclo error → ajuste de pesos y por qué se separa un conjunto de prueba. |
| **Distingue los tres tipos** | Confunde supervisado, no supervisado y refuerzo. | Distingue supervisado (etiquetas) y no supervisado (sin etiquetas). | Distingue los tres y reconoce la señal de cada uno (etiqueta, estructura, recompensa). |
| **Conecta con la gestión pública** | No da ejemplos o da ejemplos genéricos. | Da un ejemplo pertinente por tipo. | Da ejemplos de su propio contexto y explica por qué ese tipo es el adecuado. |

**Nivel intermedio (60–69, "Básico"):** cumple parcialmente; identifica ideas sueltas pero no las conecta ni justifica.
**Nivel Alto (85–94):** cumple con solidez, justifica con criterio y aporta ejemplos propios de la gestión pública.

> Escala del módulo (Plan de Clases): 1–59 logro inicial · 60–69 muy parcial · 70–84 suficiente · 85–94 alto porcentaje · 95–100 logro total esperado.
