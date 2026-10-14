# Inteligencia Artificial — Glosario (Bloque 6, IDT 601)

Lenguaje canónico del workspace. Todas las lecciones y ejercicios usan estos términos.

## Términos

**Inteligencia artificial (IA)**:
Campo que construye sistemas capaces de realizar tareas que asociamos con la inteligencia humana.
_Avoid_: robot, algoritmo mágico

**Enfoque determinista**:
Sistema que sigue reglas fijas escritas por un humano: misma entrada, misma salida.
_Avoid_: IA clásica, programado

**Enfoque indeterminista**:
Sistema que aprende patrones a partir de ejemplos; su salida es probabilística.
_Avoid_: IA verdadera, inteligencia real

**Regla**:
Instrucción explícita del tipo "si (condición) entonces (acción)", escrita por una persona.
_Avoid_: norma, reglamento

**Modelo**:
Resultado del entrenamiento: la estructura de pesos que ya aprendió a hacer una tarea.
_Avoid_: programa, software

**Entrenamiento**:
Proceso de mostrar ejemplos al modelo y ajustar sus pesos para reducir el error.
_Avoid_: capacitación, enseñanza

**Red neuronal**:
Modelo de neuronas organizadas en capas y conectadas por pesos que se ajustan al aprender.
_Avoid_: cerebro artificial

**Neurona artificial**:
Unidad que recibe entradas, las pondera con pesos y produce una salida.
_Avoid_: nodo, célula

**Capa**:
Conjunto de neuronas de un mismo nivel: entrada, ocultas y salida.
_Avoid_: nivel, etapa

**Peso**:
Número que indica cuánto importa una conexión; aprender es ajustarlos.
_Avoid_: coeficiente, valor

**Parámetro**:
Cada uno de los números ajustables de un modelo (los pesos son los principales).
_Avoid_: variable

**Función de pérdida**:
Medida del error entre la salida del modelo y la respuesta esperada; guía el ajuste de los pesos.
_Avoid_: costo, error total

**Época**:
Una pasada completa sobre todos los ejemplos de entrenamiento.
_Avoid_: ciclo, ronda

**Sobreajuste**:
Cuando el modelo memoriza los ejemplos de entrenamiento y falla con casos nuevos.
_Avoid_: exceso de entrenamiento

**Conjunto de prueba (y validación)**:
Datos guardados aparte, que el modelo no usa para aprender, para medir cómo funciona con casos nuevos.
_Avoid_: examen, control

**Métrica**:
Número que resume el desempeño del modelo (por ejemplo, exactitud o precisión).
_Avoid_: nota, puntaje

**Exactitud**:
Proporción de aciertos sobre el total de casos evaluados.
_Avoid_: precisión

**Precisión**:
De los casos que el modelo marcó como positivos, cuántos lo eran de verdad.
_Avoid_: exactitud

**Aprendizaje supervisado**:
Se entrena con datos etiquetados (cada ejemplo trae su respuesta correcta).
_Avoid_: aprendizaje dirigido

**Etiqueta**:
La respuesta correcta que acompaña a un ejemplo de entrenamiento.
_Avoid_: categoría, clase

**Clasificación**:
Tarea supervisada de asignar una categoría (por ejemplo, "urgente" o "normal").
_Avoid_: categorización

**Regresión**:
Tarea supervisada de predecir un número (por ejemplo, la demanda del próximo mes).
_Avoid_: predicción numérica

**Aprendizaje no supervisado**:
Se entrena con datos sin etiquetas y busca estructura oculta: grupos o patrones.
_Avoid_: aprendizaje autónomo

**Agrupación (clustering)**:
Técnica no supervisada que reúne casos parecidos sin categorías previas.
_Avoid_: segmentación (usar solo si se explicita)

**Aprendizaje por refuerzo**:
Aprende por ensayo, error y recompensa al actuar en un entorno.
_Avoid_: aprendizaje con premios

**Recompensa**:
Señal de acierto que el agente recibe al actuar; guía su comportamiento.
_Avoid_: premio, castigo

**LLM (modelo de lenguaje de gran escala)**:
Red neuronal entrenada sobre enormes volúmenes de texto que genera contenido prediciendo la siguiente palabra.
_Avoid_: chatbot, IA

**Modelo generativo**:
Modelo que produce contenido nuevo (texto, imagen, código, audio) en lugar de solo clasificar.
_Avoid_: IA creativa

**Multimodal**:
Modelo que trabaja con más de un tipo de contenido (por ejemplo, texto e imagen).
_Avoid_: mixto

**Token**:
Fragmento de texto (palabra, parte de palabra o signo) que el modelo usa como unidad.
_Avoid_: palabra

**Ventana de contexto**:
Cantidad máxima de texto que el modelo puede tener en cuenta en una conversación.
_Avoid_: memoria

**Temperatura**:
Parámetro que regula qué tan variadas o predecibles son las respuestas del modelo.
_Avoid_: creatividad

**Embedding (vector)**:
Representación numérica del significado de un texto, que permite comparar y buscar por parecido.
_Avoid_: código

**Prompt**:
Instrucción o pedido que le damos al modelo; condiciona la calidad de la respuesta.
_Avoid_: comando, consulta

**Few-shot (ejemplos)**:
Técnica de prompting que muestra uno o dos ejemplos del resultado esperado.
_Avoid_: demostración

**Alucinación**:
Contenido inventado por el LLM con apariencia de verdad (datos, normas o citas falsas).
_Avoid_: error, mentira

**Fecha de corte**:
Momento hasta el cual el modelo conoce información; desconoce lo posterior.
_Avoid_: actualidad

**Verificación**:
Comprobar contra fuentes confiables lo que produjo el modelo antes de usarlo.
_Avoid_: control, revisión

**Agente de IA**:
Sistema que combina un LLM con herramientas para planificar y ejecutar tareas.
_Avoid_: bot, robot

**Herramienta (tool)**:
Capacidad que el agente puede usar para actuar: buscar, leer, calcular, consultar o enviar.
_Avoid_: función, plugin

**RAG (recuperación aumentada)**:
Técnica en la que el agente busca en documentos propios y genera la respuesta citando lo encontrado.
_Avoid_: búsqueda interna

**Planificación**:
Capacidad del agente de descomponer una tarea en pasos y ordenarlos.
_Avoid_: método

**Supervisión humana (human-in-the-loop)**:
Mantener a una persona revisando y aprobando las acciones críticas del agente.
_Avoid_: control humano

**Confidencialidad**:
Regla de no subir datos de ciudadanos, documentos reservados ni información no pública a un chat externo.
_Avoid_: privacidad (reservar para datos personales)
