# Notas del orador — Sesión 10
**Deck:** `deck-sesion-10.html` · 20 diapositivas · 180 min
**Tema:** Agentes de IA y taller integrador

> Guion punteado por diapositiva. Cada viñeta es algo para decir en voz alta;
> **No olvidar** marca lo imprescindible.

---

## Slide 1 — Agentes de IA y taller integrador
- Dar la bienvenida y ubicar esta sesión como la **última del módulo** y del Bloque 6.
- Hacer el puente: "Aprendimos a conversar con un LLM y a armar prompts; hoy lo vemos **actuar con herramientas** y cerramos integrando todo en una mini-solución".
- Anunciar el tono de la jornada: más práctica que teórica, con un taller que ocupa la mayor parte del tiempo.
- **No olvidar:** avisar que hay una **pausa de 10 minutos** a mitad de sesión y que hoy se entrega y defiende una mini-solución.

## Slide 2 — Hoja de ruta
- Recorrer los tramos del cuadro de un vistazo: apertura (10), del chat al agente (15), componentes (20), ejemplos y RAG (15), pausa (10), riesgos y supervisión (10), método y consigna (15), taller definir y armar (35), **evaluar, mejorar y preparar la defensa (25)**, defensa (15) y cierre (10).
- Subrayar que **75 minutos** son taller (35 + 25 + 15 de defensa): la sesión se juega en el trabajo en equipos.
- Señalar la pausa tras el bloque de ejemplos y RAG.
- **No olvidar:** el bloque "evaluar, mejorar y preparar la defensa" dura **25 min** y la defensa es de **2 min por equipo**; el cronograma suma 180 min.

## Slide 3 — Tres preguntas
- Escribir las tres preguntas en la pizarra y dejarlas visibles toda la sesión como columna vertebral: qué es un agente, cómo se diseña su flujo, cómo integrarlo en una solución útil.
- Enganche: comparar "¿qué trámites se pueden hacer en línea?" con "buscá y armá una tabla comparando requisitos".
- Preguntar al grupo: "¿qué cambió entre las dos respuestas?".
- **No olvidar:** dejar claro que el agente no "sabe más": actúa más y por eso requiere supervisión humana.

## Slide 4 — Del chat al agente
- Contrastar las dos columnas: el **chat responde** con texto; el **agente actúa** decidiendo pasos y usando herramientas.
- Usar la analogía del colega: preguntarle algo es el chat; **encargarle una tarea completa** es el agente.
- Escribir en la pizarra los dos flujos: Chat = entrada → respuesta; Agente = tarea → plan → pasos → resultado → **revisión**.
- **No olvidar:** aclarar que un error del chat es una frase; un error del agente puede ser una **acción** con consecuencias.

## Slide 5 — Herramientas
- Recorrer el flujo de izquierda a derecha: **buscar**, **leer y consultar**, **ejecutar**.
- Dar ejemplos concretos: buscar en la normativa institucional, leer una planilla de trámites, calcular o enviar un correo.
- Explicar que cada herramienta trae su **descripción** para que el modelo sepa cuándo usarla.
- **No olvidar:** el agente solo puede actuar con las herramientas que se le habilitan; nada más.

## Slide 6 — Cuatro componentes
- Presentar los cuatro componentes con su analogía: modelo (el cerebro), herramientas (las manos), memoria (la agenda) y planificación (el método).
- Explicar que un agente no es solo el modelo: es la combinación de las cuatro piezas.
- **No olvidar:** remarcar que la **planificación** puede seguir un flujo definido por una persona o decidir los pasos por su cuenta, y que eso cambia el nivel de control.

## Slide 7 — Las cuatro piezas, en un vistazo
- **Esquema en pantalla:** recorrer las cuatro piezas sobre una fila y su analogía; abajo, la regla de oro "el agente sugiere, el humano decide".
- Señalar que las **herramientas** son lo que separa a un agente de un chat: actuar sobre el mundo, no solo responder.
- **No olvidar:** subrayar la regla de oro: el agente sugiere, la decisión final es humana.

## Slide 8 — Componentes de cerca
- Recorrer modelo, herramientas y memoria con un ejemplo local de cada uno: razonar sobre una consulta, leer la normativa o una planilla, recordar los pasos ya hechos.
- Insistir en las consecuencias: **sin herramientas** un LLM solo conversa; **sin planificación** no encadena pasos; **sin memoria** pierde el hilo.
- **No olvidar:** las cuatro piezas trabajan juntas; quitar una rompe el resultado.

## Slide 9 — Ejemplos
- Presentar los tres usos habituales: **asistentes**, **RAG** y **automatización**.
- Dar un ejemplo boliviano de cada uno: requisitos de trámites, derivación de reclamos y resúmenes de informes para una autoridad.
- Preguntar al grupo: "¿cuál de los tres usaría primero su institución y por qué?".
- **No olvidar:** distinguir que **RAG cita fuentes** y que la automatización **ejecuta pasos repetitivos**; no son lo mismo.

## Slide 10 — RAG
- Explicar los dos pasos: primero **buscar** en los documentos propios; luego **generar** la respuesta citando lo encontrado.
- Señalar el beneficio central: responde **con fuentes**, no solo de memoria, y así **reduce las alucinaciones**.
- Ejemplo: un agente que consulta el reglamento interno de la alcaldía y responde con la referencia exacta.
- **No olvidar:** sin documentos internos ordenados y confiables, RAG no aporta valor; la calidad de las fuentes es la condición.

## Slide 11 — Riesgos
- Explicar que el agente **amplifica los límites del LLM** porque sus errores se traducen en acciones.
- Recorrer los tres riesgos: **error de datos**, **acción indebida** y **falta de transparencia**.
- Añadir que también puede usar mal una herramienta, interpretar mal una instrucción o encadenar errores.
- **No olvidar:** un error de un agente no es solo una frase mal escrita; puede ser un envío, una publicación o un cambio indebido.

## Slide 12 — Supervisión humana
- Presentar los tres controles: **humano en el circuito**, **menor privilegio** (leer pero no enviar, sugerir pero no publicar) y **trazabilidad**.
- Dejar instalada la regla de oro: **el agente sugiere, el humano decide**.
- Enfatizar que en el sector público la responsabilidad es del **funcionario**, no del agente.
- **No olvidar:** sin registro de qué hizo y con qué fuentes no hay auditoría posible.

## Slide 13 — Método
- Explicar el ciclo de cuatro pasos: **Definir → Armar → Evaluar → Mejorar**, y que vuelve a empezar.
- Detallar cada paso brevemente: problema y destinatario; prompts o flujo con control humano; prueba con casos reales; ajuste e iteración.
- Repetir la regla: mejor un paso útil y concreto que un proyecto enorme.
- **No olvidar:** este es el método que usarán tanto en el taller de hoy como en el trabajo final integrador.

## Slide 14 — Consigna del taller
- Formar equipos de **3 a 4** personas y repartir las dos plantillas (diseño del flujo y entrega).
- Dar la consigna y los tiempos: definir y armar **35 min**; evaluar, mejorar y preparar la defensa **25 min**; defensa **2 min por equipo**.
- Recordar que hay un chat LLM disponible para apoyar el trabajo, siempre con datos ficticios o públicos.
- **No olvidar:** antes de empezar, cada equipo debe anotar el problema y su destinatario.

## Slide 15 — Los cinco casos
- Leer los cinco casos y pedir que cada equipo elija **uno acotado**.
- Explicar que los casos **2 (clasificador de reclamos)** y **4 (verificador de expedientes)** se resuelven con **chat + criterio + supervisión humana**, sin plataforma de agentes real.
- Aclarar que el **flujo del agente se diseña y se documenta** con la plantilla de diseño, aunque no se ejecute en vivo.
- **No olvidar:** se trabaja con un caso **ficticio o público**; nunca con reclamos o expedientes reales.

## Slide 16 — Control humano y confidencialidad
- Explicar dónde se ubica el **punto de control humano** en cada caso: una persona revisa el dato, confirma la categoría y decide la acción.
- Dejar instalada la regla de **confidencialidad**: no subir datos de ciudadanos ni documentos reservados a un chat público.
- Recordar que la responsabilidad en el sector público es del funcionario, no de la herramienta.
- **No olvidar:** pedir a cada equipo que escriba **dónde** revisa una persona su resultado.

## Slide 17 — Entrega y defensa
- Mostrar la plantilla de entrega: **tarea**, **prompt o flujo**, **resultado**, **evaluación crítica** y **mejora aplicada**.
- Explicar que la defensa es de **2 minutos** por equipo y que se apoya en esa plantilla.
- Aclarar que no se busca la perfección técnica, sino la **integración consciente** de lo aprendido.
- **No olvidar:** cada equipo debe mostrar **qué tuvo que verificar o corregir** y qué dato no subiría a un chat público.

## Slide 18 — El módulo en una cadena
- Recorrer los seis eslabones: datos y calidad, ingesta, arquitectura, integración, licencias y datos abiertos, IA y agentes.
- Señalar que cada eslabón **habilita al siguiente** y que el módulo culmina en la capa de IA.
- Pedir que cada equipo conecte su mini-solución con alguno de esos eslabones.
- **No olvidar:** sin datos de calidad, los eslabones siguientes no sostienen nada; el dato es el activo de partida.

## Slide 19 — Cierre del módulo
- Reforzar la idea fuerza: la IA **no reemplaza** al profesional público, lo **potencia** cuando hay criterio.
- Enunciar las condiciones: **datos de calidad**, **método de trabajo** y **supervisión humana**.
- Presentar el **trabajo final integrador** e insistir en sus **dos componentes obligatorios**: (a) la **declaración de licencia del dataset** usado (Bloque 5) y (b) un **prompt o flujo de agente documentado con su punto de control humano** (Bloque 6).
- **No olvidar:** el trabajo final se entrega **fuera de clase** y se evalúa con la rúbrica del módulo.

## Slide 20 — Gracias
- Agradecer la participación del grupo a lo largo del módulo.
- Recordar la entrega del trabajo final integrador, con la declaración de licencia del dataset y el prompt/flujo con punto de control humano.
- Abrir el espacio para preguntas y cerrar la cursada.
- **No olvidar:** confirmar el canal y la fecha límite de entrega del trabajo final.
