# Sesión 4 — Arquitectura de datos: conceptos y componentes

**Módulo:** Ingeniería de Datos (IDT 601)
**Bloque:** 3 — Arquitectura de Datos
**Duración:** 3 horas (180 min) — teóricas y prácticas
**Público:** Profesionales no especializados en ingeniería de datos

---

## Objetivos de la sesión

- Comprender qué es una arquitectura de datos, para qué sirve y por qué importa el diseño.
- Distinguir la arquitectura de datos de las herramientas concretas que la implementan.
- Reconocer los componentes principales de una arquitectura y la función de cada uno: almacenamiento, procesamiento, catálogo y gobernanza.
- Describir el flujo de los datos entre componentes, de la fuente al uso.
- Leer e identificar los componentes en un esquema sencillo de arquitectura.

## Ideas clave (qué debe quedar al final)

1. La **arquitectura de datos es el plano** que define cómo los datos se almacenan, circulan y usan en una organización.
2. No es una herramienta ni un software: es una **decisión de diseño** que antecede a la tecnología.
3. El diseño importa porque **decidir sin arquitectura** produce silos, duplicación, desconfianza y poca capacidad de crecer.
4. Toda arquitectura se compone de **piezas con funciones distintas**: el **almacenamiento** responde a dónde guardar; el **procesamiento**, a cómo mover y transformar; el **catálogo**, a qué datos existen y qué significan; la **gobernanza**, a quién y con qué reglas.
5. Los componentes no son islas: forman un **flujo** desde la fuente hasta el uso, con el catálogo y la gobernanza como **capas transversales**.
6. Saber nombrar cada componente permite **leer cualquier diagrama** de arquitectura y conectarlo con el diseño institucional.

## Cronograma sugerido (180 min)

| Bloque | Duración | Qué ocurre |
|---|---|---|
| Apertura y encuadre | 10 min | Bienvenida, ubicación del Bloque 3 y pregunta central. |
| ¿Qué es una arquitectura de datos? | 25 min | Definición, analogía del plano y límites del concepto. |
| Por qué importa el diseño | 20 min | Consecuencias de diseñar (o no) la arquitectura. |
| Pausa | 10 min | Receso. |
| Los cuatro componentes | 30 min | Almacenamiento, procesamiento, catálogo y gobernanza. |
| El flujo entre componentes y lectura de diagramas | 25 min | Cómo se conectan las piezas y cómo leer un esquema. |
| Práctica: identificar componentes | 50 min | Actividad grupal con un esquema sin etiquetas. |
| Cierre y preguntas | 10 min | Síntesis, dudas y puente a la Sesión 5. |

---

## Apertura y encuadre (10 min)

- Presentar el **Bloque 3 — Arquitectura de Datos** y ubicarlo tras los bloques de Datos, Calidad y Almacenamiento.
- Conectar con lo ya visto: *"Ya sabemos de dónde salen los datos, cómo medir su calidad y dónde guardarlos. Ahora: ¿cómo los organizamos para que toda la institución pueda usarlos?"*
- Presentar la pregunta central de la sesión: **¿qué es una arquitectura de datos y cuáles son sus componentes?**
- Palabras clave que se usarán durante toda la sesión: **arquitectura, plano, diseño, componente, flujo, silo, catálogo, gobernanza**.

> Momento de enganche: preguntar al grupo *"¿alguna vez pidieron un dato a otra área y tardaron semanas en conseguirlo, o recibieron el mismo dato con valores distintos?"* Anotar 4 o 5 respuestas en la pizarra. Esos ejemplos se retoman al hablar de por qué importa el diseño.

---

## ¿Qué es una arquitectura de datos? (25 min)

Explicar el concepto partiendo de una analogía cercana:

- **La casa y el plano.** Antes de construir una casa se dibuja un plano: dónde van las habitaciones, las cañerías y las conexiones eléctricas. El plano no es la casa, pero define cómo funcionará.
- La **arquitectura de datos es ese plano**, pero para los datos de una organización: define **qué datos existen, dónde se guardan, cómo se mueven, quién los usa y con qué reglas**.
- No es un software: es el **conjunto de decisiones de diseño** que luego se implementan con herramientas (bases de datos, procesos, catálogos).

**Tres preguntas que responde la arquitectura:**

1. **¿Dónde** vive cada dato? (almacenamiento)
2. **¿Cómo** se mueve y transforma? (procesamiento)
3. **¿Quién** puede usarlo y con qué reglas? (acceso y gobernanza)

**Idea para la pizarra:**

- Arquitectura de datos = **plano** de la información institucional.
- Herramienta ≠ arquitectura: el plano no es el ladrillo.

---

## Por qué importa el diseño (20 min)

Argumentar que el diseño no es un lujo técnico, sino una decisión con consecuencias prácticas:

- **Evitar silos de información.** Sin un plano compartido, cada área guarda "su" dato en "su" sistema y nadie ve el conjunto. Resultado: el dato del ciudadano existe cinco veces, con cinco valores distintos.
- **Evitar duplicación y re-trabajo.** Cada área vuelve a capturar lo que otra ya tiene. Costo de tiempo, almacenamiento y errores.
- **Garantizar calidad y confianza.** Si no se define cuál es el dato "oficial", cada reporte cuenta una historia distinta y se pierde credibilidad.
- **Poder crecer.** Una arquitectura pensada permite sumar nuevas fuentes o servicios sin reconstruir todo desde cero.

**Mensaje puente:** *"El costo de no diseñar se paga después, en forma de datos que no coinciden, decisiones lentas y proyectos que no escalan. Diseñar es barato; reparar una arquitectura improvisada es caro."*

---

## Pausa (10 min)

---

## Los cuatro componentes (30 min)

Presentar cada componente con su función y un ejemplo cercano a la gestión pública.

### 1. Almacenamiento

- **Dónde** se guardan los datos: bases de datos, data warehouse, data lake, archivos.
- Responde: *¿dónde vive el dato y en qué forma?*
- **Ejemplo:** la base de datos de trámites (estructurado) y un repositorio de documentos escaneados (no estructurado).

### 2. Procesamiento

- **Cómo** se mueven y transforman los datos: limpieza, unión, cálculo de indicadores.
- Puede ser por **lotes** (batch, cada noche) o en **tiempo real** (streaming).
- **Ejemplo:** cada noche se consolidan los pagos del día para actualizar el reporte de recaudación.

### 3. Catálogo de datos

- **Documentación** de qué datos existen, qué significan y de dónde provienen.
- Incluye **metadatos** (diccionario de datos, dueño, formato, definición).
- **Ejemplo:** un diccionario que define que "DNI" es el número de identificación oficial, con formato y área responsable.

### 4. Gobernanza

- Las **reglas** de la información: calidad, seguridad, privacidad, responsabilidad y acceso.
- Responde: *¿quién puede ver o modificar el dato? ¿cómo se protege?*
- **Ejemplo:** solo el área de personal puede modificar el sueldo registrado; el acceso a datos personales exige autorización.

**Idea para la pizarra:**

- Almacenamiento = **dónde** · Procesamiento = **cómo** · Catálogo = **qué es** · Gobernanza = **quién y con qué reglas**.

---

## El flujo entre componentes y lectura de diagramas (25 min)

Explicar que los componentes no actúan solos; se conectan en un **flujo**:

**Fuente → Almacenamiento → Procesamiento → Almacenamiento de análisis → Uso**

- Los datos **entran** desde las fuentes (sistemas, formularios, sensores).
- Se **guardan** en el almacenamiento.
- Se **transforman** (procesamiento) para unirlos y limpiarlos.
- Quedan **disponibles** para reportes y análisis.
- Todo el trayecto está **documentado** (catálogo) y **regulado** (gobernanza).

**Mensaje:** el catálogo y la gobernanza atraviesan todo el flujo; no son una etapa, son **capas transversales**.

Luego, leer en conjunto un diagrama sencillo de arquitectura. Mostrar o dibujar un esquema con:

1. **Fuentes:** sistema de trámites, formulario web, lecturas de medidores.
2. **Almacenamiento:** base de datos operacional + data warehouse.
3. **Procesamiento:** proceso nocturno de limpieza y unión.
4. **Catálogo:** diccionario de datos que describe cada tabla.
5. **Gobernanza:** políticas de acceso y calidad.

**Preguntas guía para leerlo en voz alta:**

- ¿Dónde nacen los datos? (fuentes)
- ¿Dónde se guardan? (almacenamiento)
- ¿Qué los transforma? (procesamiento)
- ¿Dónde está la definición de cada dato? (catálogo)
- ¿Quién controla el acceso? (gobernanza)

> Esta lectura es el "puente" hacia la práctica: se usa el mismo procedimiento, pero ahora en equipos y con otro esquema.

---

## Práctica: identificar componentes (50 min)

**Objetivo:** identificar y nombrar los componentes de una arquitectura en un esquema dado.

**Materiales:** un esquema impreso por equipo, con cajas y flechas **sin etiquetas** (o con etiquetas genéricas: "Caja A", "Flecha 1", etc.).

**Pasos:**

1. Conformar equipos de 3–4 personas.
2. Entregar a cada equipo el esquema y una hoja de trabajo con las cuatro categorías: almacenamiento, procesamiento, catálogo, gobernanza.
3. Cada equipo debe **etiquetar cada elemento** del esquema con su componente y justificarlo.
4. Además, responder: *¿cuál es el flujo de datos, de la fuente al uso?*
5. Puesta en común (incluida en los 50 min): cada equipo expone un componente y su justificación.

**Rol del docente:** circular entre equipos para destrabar dudas y orientar la lectura del esquema.

**Guía de corrección:** valorar que los equipos distingan almacenamiento (donde se guarda) de procesamiento (lo que transforma) y que reconozcan el catálogo y la gobernanza como capas transversales, no como cajas del flujo.

**Criterios de evaluación:** identificación correcta de componentes y coherencia en la justificación.

---

## Cierre y preguntas (10 min)

- Síntesis con el grupo: releer en voz alta la frase de la pizarra (**dónde / cómo / qué es / quién**).
- Reforzar la idea central: *"La arquitectura de datos es el plano que hace que los datos sirvan a toda la institución; conocer sus componentes permite leer y diseñar cualquier arquitectura."*
- Anticipar la próxima sesión: *"La próxima vez veremos patrones de arquitectura: data warehouse, data lake, data lakehouse y lambda. Y habrá práctica."*
- Espacio de preguntas y dudas.

---

## Recursos

- Presentación (láminas de definición, analogía del plano, componentes, flujo y práctica).
- Pizarra o pizarra digital para el esquema de las tres preguntas y la frase dónde / cómo / qué es / quién.
- Diagrama de arquitectura para la lectura guiada (proyectado o en pizarra).
- Esquemas sin etiquetas impresos para la práctica.
- Hojas de trabajo por equipo.

## Evaluación de la sesión

| Criterio | Evidencia |
|---|---|
| Explica qué es una arquitectura de datos | Respuestas en el enganche y en el bloque "¿Qué es una arquitectura?" |
| Distingue arquitectura de herramienta | Aportes en el bloque "¿Qué es una arquitectura?" |
| Argumenta por qué importa el diseño | Intervenciones en "Por qué importa el diseño" |
| Nombra y explica los cuatro componentes | Participación en "Los cuatro componentes" |
| Describe el flujo entre componentes | Aportes en "El flujo entre componentes" |
| Lee un diagrama de arquitectura | Respuestas en la lectura guiada |
| Identifica componentes en un esquema dado | Hoja de trabajo y puesta en común de la práctica |
| Usa la terminología adecuada | Precisión de términos al justificar |

**Entrega:** hoja de trabajo con el esquema etiquetado (componente y justificación) y la descripción del flujo de datos, de la fuente al uso.
