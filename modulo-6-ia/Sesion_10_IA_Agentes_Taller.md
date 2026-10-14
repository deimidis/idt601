# Sesión 10 — Agentes de IA y taller integrador

**Módulo:** Ingeniería de Datos (IDT 601)
**Bloque:** 6 — Historia y Desarrollo de la Inteligencia Artificial
**Duración:** 3 horas (180 min)
**Público:** Profesionales no especializados en ingeniería de datos
**Modalidad:** 100 % virtual (Zoom + salas)

---

## Objetivos de la sesión

- Entender qué es un agente de IA y cómo combina un LLM con herramientas.
- Reconocer los cuatro componentes de un agente: modelo, herramientas, memoria y planificación.
- Identificar usos comunes (asistentes, RAG, automatización) y sus riesgos en la gestión pública.
- **Diseñar y documentar** el flujo de un agente —con su punto de control humano— e integrarlo en una
  mini-solución resuelta con chat y criterio, sin exigir una plataforma de agentes real.
- Cerrar el módulo sintetizando su recorrido y vinculándolo con el **trabajo final integrador**.

## Ideas clave (qué debe quedar al final)

1. Un **agente** es un LLM que deja de solo responder y pasa a **actuar**: planifica pasos y usa
   **herramientas** para cumplir una tarea.
2. Un agente combina cuatro componentes: **modelo**, **herramientas**, **memoria** y **planificación**.
3. Los usos más comunes son **asistentes**, **recuperación de información (RAG)** y **automatización**.
4. Los agentes **amplifican los riesgos** del LLM porque actúan; exigen **supervisión humana**:
   *el agente sugiere, el humano decide*.
5. Construir una mini-solución sigue un método: **definir la tarea**, **armar prompts o flujos**,
   **evaluar** y **mejorar**. El flujo del agente **se diseña y se documenta** con la plantilla,
   aunque no se ejecute en vivo.
6. El módulo es una **cadena**: datos → ingesta → arquitectura → integración → licencias → IA; cada
   eslabón habilita al siguiente y culmina en el **trabajo final integrador**, que suma **dos
   componentes obligatorios**: (a) la **declaración de licencia del dataset** usado (Bloque 5) y
   (b) un **prompt o flujo de agente documentado con su punto de control humano** (Bloque 6).

## Cronograma sugerido (180 min)

| Bloque | Duración | Qué ocurre |
|---|---|---|
| Apertura y encuadre | 10 min | Bienvenida, cierre del módulo y preguntas disparadoras. |
| Del chat al agente: qué cambia | 15 min | De responder a actuar. |
| Componentes de un agente | 20 min | Modelo, herramientas, memoria y planificación. |
| Ejemplos: asistentes, RAG, automatización | 15 min | Casos aplicados a la gestión pública. |
| Pausa | 10 min | Receso. |
| Riesgos y supervisión humana | 10 min | Errores, control, responsabilidad y confidencialidad. |
| Aplicación integrada: el método y la consigna | 15 min | Definir, armar, evaluar y mejorar; formación de equipos. |
| Taller: definir y armar | 35 min | Tarea y prompts/flujo de la mini-solución. |
| Taller: evaluar, mejorar y preparar la defensa | 25 min | Prueba, mejora y preparación de la defensa. |
| Presentación y defensa (2 min por equipo) | 15 min | Cada equipo presenta su mini-solución. |
| Cierre del módulo y preguntas | 10 min | Síntesis integradora y trabajo final. |

> **Ajuste de tiempos:** el bloque "evaluar, mejorar y preparar la defensa" se amplía de 15 a **25 min**
> para que la prueba, la corrección y el ensayo de la defensa no queden apurados. La defensa se fija en
> **2 min por equipo** y su bloque baja de 25 a **15 min** (unos 6 equipos × 2 min más encuadre y
> transiciones). El cronograma así **suma 180 min exactos**.

---

## Apertura y encuadre (10 min)

- Dar la bienvenida y ubicar la sesión como la **última del módulo** y del Bloque 6.
- Conectar con las sesiones anteriores: *"Aprendimos a conversar con un LLM y a construir prompts. Hoy
  lo vemos dar un paso más: dejar de solo responder y empezar a actuar con herramientas. Después
  integramos todo en una mini-solución."*
- Presentar las preguntas que ordenan la sesión: **¿qué es un agente?**, **¿cómo se diseña su flujo de
  trabajo?** y **¿cómo integro lo aprendido en una solución útil para mi institución?**
- Palabras clave: **agente, modelo, herramienta, memoria, planificación, RAG, supervisión,
  confidencialidad, mini-solución**.
- Encuadrar el taller: trabajo en equipos, una entrega concreta y una defensa breve de **2 min por
  equipo**.

> Momento de enganche: comparar dos pedidos al mismo LLM: (a) *"¿qué trámites se pueden hacer en
> línea?"* — responde; (b) *"buscá en este documento y en la web la lista de trámites en línea y armá
> una tabla comparando requisitos"* — el agente consulta fuentes y produce un resultado. Preguntar:
> *"¿Qué cambió? Ya no solo responde: usa herramientas."*

---

## Del chat al agente: qué cambia (15 min)

### El chat responde

- El chat genera **texto** a partir del prompt: no actúa sobre el mundo.
- Sus respuestas se basan en lo que "recuerda" de su entrenamiento y en la conversación.

### El agente actúa

- Un agente **no se limita a responder**: decide **pasos** y ejecuta **acciones**.
- Puede **buscar información**, **leer documentos**, **usar una calculadora**, **consultar una base de
  datos** o **llamar a otro sistema**.
- Piensa en una tarea y la **descompone en pasos** hasta cumplirla.

**Ideas para la pizarra:**

- Chat: **entrada → respuesta**.
- Agente: **tarea → plan → pasos (con herramientas) → resultado → revisión**.

### La analogía del asistente

- El chat es como **preguntarle a un colega**.
- El agente es como **encargarle una tarea**: "buscá esto, compará, resumí y traeme el resultado".

---

## Componentes de un agente (20 min)

Explicar cada componente con ejemplos cercanos a la gestión pública. El esquema de apoyo es
`assets/esquema-componentes-agente.svg`.

### 1. Modelo (el "cerebro")

- El **LLM** que razona y decide los pasos.
- Sigue siendo el motor de lenguaje; el agente le suma capacidades de acción.

### 2. Herramientas (las "manos")

- Lo que el agente puede **usar para actuar**: buscar en la web, leer un PDF, ejecutar código, consultar
  una base de datos, enviar un correo.
- Cada herramienta tiene una **descripción** para que el modelo sepa cuándo usarla.

### 3. Memoria (el "contexto que persiste")

- Lo que el agente **recuerda** dentro de la tarea (y a veces entre tareas).
- Puede ser la conversación o un registro de los pasos ya hechos.

### 4. Planificación (el "método")

- La capacidad de **descomponer** una tarea en pasos y **ordenarlos**.
- Puede seguir un flujo definido por un humano o decidir pasos por su cuenta.

**Síntesis en tabla:**

| Componente | Qué es | Analogía |
|---|---|---|
| Modelo | El LLM que razona | El cerebro |
| Herramientas | Lo que puede usar para actuar | Las manos |
| Memoria | Lo que recuerda de la tarea | La agenda |
| Planificación | Cómo ordena los pasos | El método de trabajo |

---

## Ejemplos: asistentes, RAG, automatización (15 min)

### Asistentes

- Agentes que **conversan y resuelven** dentro de un dominio, usando los documentos de la institución.
- **Ejemplo:** un asistente que responde consultas sobre requisitos de trámites apoyándose en la
  normativa oficial de un gobierno municipal.

### Recuperación de información (RAG)

- **RAG = Retrieval-Augmented Generation:** el agente **busca** en los documentos propios y luego
  **genera** la respuesta **citando** lo encontrado.
- Reduce las alucinaciones: responde **a partir de fuentes**, no solo de memoria.
- **Ejemplo:** un agente que consulta el reglamento interno de la alcaldía y responde con la referencia
  exacta.

### Automatización de tareas

- Agentes que **ejecutan pasos repetitivos**: clasificar correos, llenar planillas, generar reportes,
  extraer datos de formularios.
- **Ejemplo:** un agente que lee un formulario de reclamo, extrae los datos y completa una planilla de
  seguimiento.

**Mensaje puente:** *"Los agentes son útiles, pero actúan y por eso fallan distinto: un error no es
solo una frase, puede ser una acción. Veamos los riesgos."*

---

## Pausa (10 min)

---

## Riesgos y supervisión humana (10 min)

### Por qué son más riesgosos

- Un agente **amplifica los límites del LLM** (alucinación, sesgo) porque sus errores se traducen en
  **acciones**.
- Puede **usar mal una herramienta**, interpretar mal una instrucción o **encadenar errores**.

### Riesgos típicos

- **Error de datos:** busca mal, cita una fuente incorrecta o extrae un dato erróneo.
- **Acción indebida:** envía, publica o modifica algo que no debía.
- **Falta de transparencia:** no queda claro por qué tomó tal decisión.

### Supervisión humana

- Mantener al **humano en el circuito** (human-in-the-loop): revisar y aprobar las acciones críticas.
- **Principio de menor privilegio:** limitar lo que el agente puede hacer (leer, pero no enviar;
  sugerir, pero no publicar).
- **Auditoría y trazabilidad:** registrar qué hizo y con qué fuentes.
- En el sector público: **la responsabilidad es del funcionario**, no del agente.

### Confidencialidad

- Antes de pegar cualquier cosa en un chat público: ¿son **datos de ciudadanos**, **documentos
  reservados** o **información no pública**? Si lo son, **no se pegan**.
- Se trabaja con **ejemplos ficticios**, datos ya públicos o documentos abiertos.

**Idea para la pizarra:** escribir en acento **"el agente sugiere, el humano decide"** como regla de
oro.

---

## Aplicación integrada: el método y la consigna (15 min)

Conviene mirar la mini-solución como una aplicación de lo visto sobre agentes, dentro de una tarea
acotada. Cualquier solución con LLM/agente sigue el mismo ciclo:

1. **Definir la tarea** — ¿qué problema institucional resolvemos?, ¿para quién?, ¿qué resultado
   esperamos? Mejor un paso útil y concreto que un proyecto enorme.
2. **Armar prompts o flujos** — para **chat**, prompts con claridad, contexto, ejemplos y rol; para
   **agente**, definir modelo, herramientas, memoria, planificación y **punto de supervisión humana**.
   El flujo **se diseña y se documenta** con `plantilla-diseno-flujo-agente.md`, aunque no se ejecute en
   vivo.
3. **Evaluar** — probar con **casos reales** y revisar con criterio experto: ¿responde a lo pedido?,
   ¿es exacta?, ¿hay alucinaciones o sesgos?, ¿el tono es el correcto?
4. **Mejorar** — ajustar prompts, flujos o fuentes a partir de lo observado, e iterar hasta una versión
   presentable.

**Idea para la pizarra:** dibujar el ciclo **Definir → Armar → Evaluar → Mejorar** (vuelve a Definir o
Armar).

### Consigna y formación de equipos

Desarrollar una **mini-solución** con un LLM (chat o agente) para un **caso institucional**,
documentando el método y el resultado.

**Casos sugeridos de gestión pública boliviana** (detallados, con los dos reescritos, en
`insumos/casos-minisolucion-s10.md`):

1. **Asistente de trámites:** un chat/agente que responde consultas frecuentes sobre requisitos, usando
   la normativa institucional.
2. **Clasificador de reclamos** *(reescrito):* un **chat** que, con un buen prompt, propone la categoría
   de cada reclamo a partir de ejemplos; la persona **revisa y deriva**, y **no se suben reclamos
   reales**.
3. **Resumidor de informes:** un chat que convierte un informe técnico en un resumen para una autoridad.
4. **Verificador de expedientes** *(reescrito):* un **chat** que, con una lista de verificación, marca
   qué documentos obligatorios figuran en un caso **ficticio**; la persona **confirma** antes de dar por
   válido el expediente.
5. **Avisos a la ciudadanía:** un chat que redacta avisos claros sobre servicios y trámites.

**Criterios de entrega:** tarea definida, prompts o flujo (con sus componentes), resultado de una
prueba, evaluación crítica y mejora aplicada.

---

## Taller: definir y armar (35 min)

- Los equipos trabajan en la mini-solución.
- El docente **circula** entre equipos: ayuda a acotar la tarea, revisa los prompts y orienta el diseño
  del flujo.
- Al terminar el bloque, cada equipo debe tener **tarea definida** y **prompts/flujo** listos para
  probar.

> El taller completo —caso institucional, reparto minuto a minuto, entregables, Modo A/B, preparación
> previa, problemas frecuentes y Plan B— está en `taller_sesion10_minisolucion_ia.md`.

---

## Taller: evaluar, mejorar y preparar la defensa (25 min)

- Probar la solución con un caso **ficticio o público** y **evaluar** la respuesta con las tres
  preguntas: ¿responde a lo pedido?, ¿es exacta y verificable?, ¿hay alucinaciones o sesgos?
- Aplicar al menos **una mejora** (prompt, flujo o fuente).
- **Anotar qué se tuvo que verificar o corregir** y qué dato no se subiría a un chat público.
- Preparar una **defensa breve (2 min por equipo)** con la plantilla de entrega
  `plantilla-entrega-minisolucion.md`.

---

## Presentación y defensa (15 min)

**Por equipo (2 min cada uno):**

- Qué problema resolvieron y con qué herramienta (chat o agente **diseñado**).
- Mostrar el **prompt o flujo** y el **resultado** de la prueba.
- Señalar **qué tuvieron que verificar o corregir** y qué mejora aplicaron.

**Guía de corrección:** valorar la **coherencia** entre tarea, método y resultado; la **calidad del
prompt/flujo**; la **definición del punto de control humano**; y la **actitud crítica** (saber qué
verificar). El objetivo no es la perfección técnica, sino la **integración consciente** de lo
aprendido.

---

## Cierre del módulo y preguntas (10 min)

- **Síntesis integradora del módulo:** recorrer la cadena mostrando que cada eslabón habilita al
  siguiente:
  1. **Datos y calidad** — el activo de partida (Bloque 1).
  2. **Ingesta** — traer los datos de las fuentes, por lotes o en tiempo real (Bloque 2).
  3. **Arquitectura** — organizar el almacenamiento y el procesamiento (Bloque 3).
  4. **Integración** — transformar y combinar datos para que sean útiles (Bloque 4).
  5. **Licencias y datos abiertos** — usar y compartir datos de forma legal y transparente (Bloque 5).
  6. **IA, LLMs y agentes** — la capa que convierte los datos en respuestas y acciones (Bloque 6).
- **Trabajo final integrador (entrega fuera de clase):** documentar el caso, las fuentes, la
  arquitectura, el flujo y los resultados; incluir los artefactos del pipeline (ingesta, transformación
  y orquestación); presentar y defender ante el grupo. **Suma dos componentes obligatorios que cierran
  el arco del módulo:**
  - **(a) Declaración de licencia del dataset usado** (Bloque 5): qué licencia tiene —o qué licencia le
    pondrían— y qué no se publicaría por protección de datos personales.
  - **(b) Un prompt o flujo de agente documentado** (Bloque 6): con claridad y contexto, su resultado
    de prueba y su **punto de control humano**.
  Se evalúa con la rúbrica del módulo (`rubrica-modulo.md`).
- Reforzar la idea fuerza: *"La IA no reemplaza al profesional público; lo potencia, siempre que los
  datos sean buenos y haya criterio y supervisión humana."*
- **No hay próxima sesión:** con esta sesión cierra el módulo. Agradecer y dejar espacio para preguntas.

---

## Recursos

- Presentación `presentacion_sesion10.html` y deck `deck-sesion-10.html`.
- Insumos del taller: `insumos/casos-minisolucion-s10.md` (los cinco casos).
- Plantillas: `plantilla-diseno-flujo-agente.md` (flujo y punto de control humano) y
  `plantilla-entrega-minisolucion.md` (entrega y defensa).
- Guía de solución del docente: `guia-solucion-docente-sesion10.md`.
- Lección `lessons/0006-agentes-de-ia.html` y referencia `reference/componentes-de-un-agente.html`.
- Entorno con acceso a un chat LLM (y, si es posible, a un agente) **solo con datos ficticios o
  públicos**; Plan B sin cuenta.

## Evaluación de la sesión

| Criterio | Evidencia |
|---|---|
| Explica qué es un agente y qué cambia frente al chat | Participación en el bloque "del chat al agente" |
| Identifica los cuatro componentes | Plantilla de diseño del flujo completada |
| Diseña un flujo coherente e incorpora supervisión humana | Flujo presentado en la puesta en común |
| Define una tarea institucional acotada | Tarea documentada en la entrega |
| Arma prompts o flujos coherentes | Prompt/flujo presentado |
| Evalúa críticamente el resultado y aplica una mejora | Observaciones y mejora documentadas en la defensa |
| Cuida la confidencialidad | No usa datos de ciudadanos ni documentos reservados en el chat |
| Integra los conceptos del módulo | Aportes en el cierre y vínculo con el trabajo final |

**Entrega:** mini-solución documentada (tarea, prompt/flujo, resultado de una prueba, evaluación crítica
y mejora aplicada). El **trabajo final integrador** se entrega fuera de clase al cierre de la cursada e
incluye la declaración de licencia del dataset y el prompt/flujo con punto de control humano.
