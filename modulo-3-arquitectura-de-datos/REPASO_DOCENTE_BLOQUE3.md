# Repaso docente — Bloque 3: Arquitectura de Datos

**Módulo:** Ingeniería de Datos (IDT 601) · EGPP 2026
**Sesiones:** 4 y 5 (180 min cada una) · **Público:** profesionales no especialistas en ingeniería de datos
**Uso:** documento de preparación. Reúne lo que el bloque ya contiene, lo que conviene arreglar antes de
dictar, los temas que faltan y cómo incorporarlos, más una FAQ de errores frecuentes del alumnado.
**Base:** auditoría completa de los 34 archivos del módulo (2026-10-06) y relevamiento de fuentes externas.
Evidencia y citas completas: `.research/bloque3-arquitectura-repaso/REPORT.md`.

> Este documento **no reemplaza** los planes de sesión ni las notas del orador: los complementa con el
> criterio que falta. Si solo tienes 15 minutos antes de clase, lee las secciones **1**, **3** y **4**.

---

## 1. Cómo usar este documento

| Si necesitas… | Ve a |
|---|---|
| Saber qué material tienes y cuál versión usar | §2 |
| Repasar los conceptos en 10 minutos | §3 |
| Qué errores del alumnado anticipar y cómo corregirlos | §4 |
| Respuestas cortas a preguntas incómodas | §5 |
| Arreglar el material antes de dictar | §6 |
| Incorporar los temas que faltan sin rehacer el bloque | §7 |
| Cerrar el ciclo de evaluación | §8 |
| Checklist de preparación y cronograma reconciliado | §9 y §10 |

---

## 2. Mapa del material: qué hay y qué versión es autoritativa

### 2.1 Inventario

| Artefacto | Rol | Estado |
|---|---|---|
| `03_Arquitectura_de_Datos.md` | Lectura base de la unidad | Completo. Es el documento más consistente (números, criterios, flujo de 5 etapas) |
| `Sesion_04_*.md`, `Sesion_05_*.md` | Planes de sesión (cronograma 180 min, dinámicas, evaluación) | Completos y cuadran en 180 min |
| `presentacion_sesion4.(md/html)`, `presentacion_sesion5.(md/html)` | Presentación reveal, **19 y 20 láminas** | **Autoritativa.** Trae los 8 diagramas SVG y la lámina de solución del esquema |
| `deck-sesion-04.html`, `deck-sesion-05.html` | Deck del participante, autocontenido, **16 láminas** | Alternativa sin internet. **Sin ninguna imagen** y con el flujo en 4 etapas (no 5) |
| `notas-sesion-04.md`, `notas-sesion-05.md` | Guion del orador por lámina | Cubren el deck de 16, **no** la presentación reveal |
| `lessons/0001–0003` | Lecciones interactivas con quiz: 16 preguntas autocorregidas | **No asignadas en ningún plan**. Instrumento listo sin usar |
| `reference/` (3 hojas) | Hojas de referencia rápida | Igual: solo mencionadas en el README |
| `taller_sesion4_componentes.md` | Práctica: etiquetar un esquema sin etiquetas | Con clave de corrección |
| `taller_sesion5_diseno_arquitectura.md` | Taller: diseñar la arquitectura de un caso | Con caso, plantilla y bloqueos típicos |
| `assets/` (8 SVG) | Esquemas, incluidos el sin-etiquetas y el resuelto | Todos referenciados; ninguno huérfano |
| `GLOSSARY.md` (17 términos), `RESOURCES.md`, `MISSION.md` | Marco del bloque | Glosario **incompleto**: le faltan 4 términos que el material usa |
| `README.md` | Descripción del paquete | Desactualizado en dos puntos (§6, ítems 12 y 15) |

### 2.2 Decisión previa obligatoria: ¿qué deck usas?

Los dos decks **no son el mismo material**:

- **`presentacion_sesionN.html`** (reveal): 19 láminas la sesión 4, 20 la sesión 5. Incluye los 8 diagramas,
  la lámina de solución del esquema resuelto y las notas `Note:` dentro de la fuente `.md`.
- **`deck-sesion-0N.html`** (autocontenido, sin internet): 16 láminas, **cero imágenes**, flujo de 4 etapas.

Recomendación: usa la **presentación reveal** si hay internet (es la versión completa) y el deck
autocontenido solo como plan B, avisando al grupo que faltan los diagramas. Si vas a usar el deck,
proyecta aparte los SVG de `assets/` — el esquema del flujo y el de los cuatro componentes son
imprescindibles.

---

## 3. Repaso express de los conceptos (10 minutos)

### 3.1 El marco que ordena todo: cuatro preguntas, no tres

El material dice en casi todas partes que la arquitectura responde **tres** preguntas (dónde/cómo/quién),
pero eso **deja fuera el catálogo**, uno de los cuatro componentes obligatorios. El propio bloque usa un
segundo marco de **cuatro** preguntas aquí y allá, y un tercero de **cinco** para leer diagramas.

**Usa el marco de cuatro preguntas y propágalo:**

> **Almacenamiento = ¿dónde?** · **Procesamiento = ¿cómo?** · **Catálogo = ¿qué es?** · **Gobernanza = ¿quién y con qué reglas?**

El marco de cinco preguntas sirve para un propósito más acotado: leer un diagrama ajeno. Ahí sí conviene
desagregar fuentes y uso (¿dónde nacen los datos? ¿dónde se guardan? ¿qué los transforma? ¿dónde está su
definición? ¿quién controla el acceso?), porque en un diagrama las fuentes y los puntos de uso son cajas
visibles que hay que saber nombrar.

**Antes de clase:** decide cuál es tu marco canónico y dilo explícitamente al grupo. Si conviven los tres
sin aclararlo, el alumnado no sabe si son tres, cuatro o cinco cosas.

### 3.2 La idea ancla

**Arquitectura de datos = el plano de la información institucional.** No es una herramienta: es un conjunto
de decisiones de diseño que antecede a la tecnología. El plano no es el ladrillo.

**Por qué importa diseñar** (los cuatro argumentos, no tres): silos · duplicación y retrabajo ·
desconfianza · **no poder crecer**. El cuarto es el que más convence a un gestor público, porque es el
que explica por qué sumar un servicio obliga a rehacer todo.

Frase de pizarra: *"Diseñar es barato; reparar una arquitectura improvisada es caro."*

### 3.3 Los cuatro componentes

| Componente | Pregunta | Qué incluye | Ejemplo para clase |
|---|---|---|---|
| **Almacenamiento** | ¿Dónde vive el dato y en qué forma? | Bases de datos, warehouse, lake, archivos; estructurado y no estructurado | Base de trámites + repositorio de escaneos |
| **Procesamiento** | ¿Cómo se mueve y transforma? | Limpieza, unión, cálculo; por lotes o en tiempo real | Consolidación nocturna de los pagos del día |
| **Catálogo** | ¿Qué datos existen y qué significan? | Metadatos; su forma conocida es el diccionario de datos (definición, formato, dueño, origen) | Diccionario que define "DNI" |
| **Gobernanza** | ¿Quién puede usarlo y con qué reglas? | Calidad, seguridad, privacidad, responsabilidad, acceso | Solo Personal modifica el sueldo |

**El error que hay que desactivar de entrada:** catálogo y gobernanza **no son una etapa más del flujo**,
son **capas transversales** que atraviesan todo el trayecto. Si aparecen como una caja más de la fila, el
diseño está mal dibujado.

### 3.4 El flujo

```
Fuente → Almacenamiento → Procesamiento → Almacenamiento de análisis → Uso
```

Cinco etapas, no cuatro: la distinción entre el almacenamiento **operacional** (donde se registra el día a
día) y el de **análisis** (donde se consolida para consultar) es justamente lo que justifica que exista una
arquitectura y no solo una base de datos. El deck offline y las notas la omiten — si usas ese material,
añádela a mano.

Catálogo y gobernanza atraviesan las cinco etapas.

### 3.5 Los cuatro patrones

| Patrón | Qué guarda | Foco | Tiempo real | Riesgo o costo |
|---|---|---|---|---|
| **Data warehouse** | Datos ya procesados, limpios y estructurados | Reportes confiables | No | Poco flexible ante datos nuevos o no estructurados |
| **Data lake** | Datos crudos y diversos, cualquier formato | Guardar todo | No | Sin gobierno se vuelve un **pantano de datos** |
| **Data lakehouse** | Crudo + esquema y gobierno sobre formatos abiertos | Analizar ambos mundos | Parcial | Exige más herramientas y madurez de gobierno |
| **Lambda** | Dos caminos: capa **batch** + capa de **velocidad** | Reportes confiables **y** alertas inmediatas | Sí | **Mantener la misma lógica en dos sistemas** |

**Criterios de elección (siempre los cuatro):** uso/caso · volumen · estructura del dato · necesidad de
tiempo real. En dos lugares del material aparece la versión de tres (sin estructura) y en la lección 02 el
primero se llama "uso": unifica a cuatro y nómbralos igual.

**Regla de oro:** no hay un patrón mejor; hay un patrón adecuado para cada caso. Elegir por prestigio
(lake o lambda "porque suenan modernos") agrega complejidad y costo sin beneficio.

**Tres matices que el material no dice y conviene tener a mano** (ver §7 y §11):

- El lakehouse **no reemplazó** al warehouse ni al lake: la arquitectura de dos capas lake+warehouse era
  "dominante en la industria" y se usaba en "prácticamente todas las empresas Fortune 500". Son opciones
  vivas, no etapas superadas.
- **Lambda es el eslabón más débil.** Su crítica canónica la escribió Jay Kreps, el propio creador de Kafka:
  mantener el mismo resultado en dos sistemas distribuidos "es exactamente tan doloroso como parece… no creo
  que este problema tenga arreglo", y lambda "no es un paradigma nuevo ni el futuro del big data: es un
  estado temporal". Regla práctica que da Kreps: usa batch **o** streaming según la latencia que necesites,
  no ambos a la vez salvo que sea imprescindible.
- **Snowflake no es un patrón hermano** de warehouse/lake/lakehouse/lambda: es un **estilo de esquema
  dimensional** (estrella vs copo de nieve) que vive *dentro* del warehouse. Y colisiona con el nombre de
  un producto comercial, así que conviene decirlo con cuidado.

### 3.6 El proceso de diseño y la plantilla

**Cinco pasos, en orden:** 1) entender el caso y las preguntas que debe responder → 2) mapear las fuentes y
su tipo → 3) definir los cuatro componentes → 4) elegir y **justificar** el patrón (con al menos una
alternativa descartada) → 5) documentar (diagrama + reglas).

**Plantilla de seis secciones:** caso y objetivo · fuentes de datos (y tipo) · componentes · patrón elegido
(y alternativa descartada) · diagrama de flujo · reglas de gobernanza.

**Matiz importante para no sobrevender el método:** no existe un estándar internacional que mandate un
proceso de cinco pasos. La norma ISO/IEC/IEEE 42010:2022 regula *descripciones* de arquitectura (quién va a
leer el diagrama, con qué puntos de vista) y **excluye explícitamente los procesos y métodos**. Presenta los
cinco pasos como **una heurística de trabajo útil**, no como "el estándar". Lo que sí es estándar es la idea
de que el entregable es una **descripción** orientada a lectores concretos: dirección, jurídica, auditoría,
proveedor. Eso da un consejo práctico: antes de dibujar, decide quién va a leer el plano.

---

## 4. Errores frecuentes del alumnado: FAQ de refutación

**Por qué esta sección importa:** los errores conceptuales de los estudiantes no son aleatorios. Se
concentran en listas cortas y medibles — en un estudio sobre diseño de datos, un error lo sostenían
**196 de 200 estudiantes (98%)** y varios otros entre el 55% y el 75%. Lo que a un experto le parece obvio
es exactamente lo que hay que enseñar de forma explícita. El remedio probado es la **refutación**: enunciar
la idea errónea tal como la piensa el estudiante y contrastarla con la correcta. Eso es lo que hace cada
fila de abajo.

| Error del estudiante | Por qué es tentador | Refutación (guion para decir en voz alta) |
|---|---|---|
| "Guardamos y limpiamos los datos" (una sola caja) | En el lenguaje cotidiano guardar y ordenar son una misma tarea | Guardar responde **dónde**; transformar responde **cómo**. Una caja que hace las dos cosas es un diagrama incompleto: sepáralas en dos. |
| "El catálogo es una etapa más del flujo" | Es una caja más, entonces parece un paso | El catálogo no está *entre* dos etapas: **atraviesa** todas. Si lo dibujas en la fila, la arquitectura deja de explicar cómo se entienden los datos en todo el recorrido. |
| "El más nuevo es el mejor" / elegir lakehouse o lambda por prestigio | En tecnología lo nuevo suele venderse como superior | El patrón se elige por **caso, volumen, estructura y tiempo real**. Y el lakehouse no reemplazó a los otros: el warehouse + lake sigue siendo lo que corre en la mayoría de las grandes organizaciones. Elegir por moda agrega costo sin beneficio. |
| "Lakehouse = lake + warehouse" | El nombre invita a esa suma | Es un **diseño distinto**: una capa transaccional de metadatos sobre formatos abiertos (Delta, Iceberg). Y el trabajo de curaduría/ETL **sigue existiendo** — hay menos pasos, no cero. |
| "Esquema al leer significa que no hay esquema" | "Al leer" suena a desorden | El esquema **existe**, solo se aplica al consultar en vez de al guardar. Es un traslado del momento del orden, no su eliminación. |
| "Un data lake es guardar todo sin gobierno" | La flexibilidad se confunde con ausencia de reglas | Sin catálogo ni gobernanza el lake se degrada en **pantano de datos** (data swamp): se acumula todo y no se encuentra ni se confía en nada. La flexibilidad se paga con disciplina de gobierno. |
| "Lambda es *la* forma de tener tiempo real" | Es el único patrón del bloque que menciona tiempo real | Lambda es **una** forma, y la más cara de operar: obliga a mantener la misma lógica en dos sistemas. Muchas veces alcanza con streaming (arquitectura kappa) o incluso con lotes cada 15 minutos. |
| "Snowflake es un patrón de arquitectura" | Aparece en las comparaciones del mercado | Snowflake (copo de nieve) es un **estilo de esquema dimensional**, no una arquitectura de plataforma. Y ojo: también es el nombre de una empresa — aclara la ambigüedad antes de que confunda. |
| "La gobernanza es un comité que se junta" | "Gobernanza" suena a burocracia | Es **responsables con autoridad escrita**: quién es dueño del dato, quién lo cuida, quién responde por su calidad, quién autoriza el acceso. Sin nombres y reglas es una reunión, no gobernanza. |
| "La calidad de datos se arregla al final" | Se percibe como limpieza posterior | La calidad se define al diseñar: quién la mide, contra qué dimensiones (exactitud, completitud, consistencia, vigencia, unicidad, validez) y en qué capa del flujo se corrige. |
| "Elegir la herramienta *es* diseñar la arquitectura" | Es lo más visible y lo que se puede comprar | La arquitectura es el **plano**; la herramienta es el ladrillo. Dos instituciones con el mismo software pueden tener arquitecturas opuestas. |
| "Esto reemplaza a nuestros sistemas de trámites" | Se confunde el almacén de análisis con el sistema operativo | No: **agrega** una capa. Los sistemas operativos siguen registrando el día a día; la arquitectura define cómo esa información se consolida, se documenta y se gobierna para poder consultarla. |

**Cómo usarlo en clase:** no lo leas como lista. Lanza el error como pregunta ("si en un diagrama aparece una
caja que dice *guardamos y limpiamos*, ¿está bien?"), deja que el grupo se equivoque y recién ahí contrasta.
La refutación funciona porque el estudiante primero ve su propia idea escrita.

---

## 5. Preguntas previsibles del grupo (respuestas cortas)

Estas son las que las propias lecciones invitan a hacer, más las que aparecen siempre:

- **"¿Y si la arquitectura ya existe y está mal? ¿Por dónde empiezo?"** Por el paso 1: qué preguntas debe
  responder la institución con datos. La arquitectura actual se evalúa contra eso, no contra un ideal.
- **"¿Un Excel donde consolido datos es almacenamiento o procesamiento?"** Almacenamiento mientras guarda;
  procesamiento cuando une, limpia o calcula. En la práctica es un caso híbrido: por eso el criterio es la
  **pregunta** que responde, no la herramienta.
- **"¿Por qué la gobernanza es transversal y no una etapa?"** Porque no ocurre en un punto del recorrido:
  define reglas de acceso y calidad que aplican a todas las etapas, de la fuente al uso.
- **"¿Puedo empezar con un warehouse y migrar a lakehouse después?"** Sí, y es lo más común: se puede
  empezar acotado. Lo que no se puede es omitir catálogo y gobernanza en ninguna etapa del camino.
- **"¿Cuándo lambda no vale la pena?"** Cuando no necesitas latencia de segundos. Si los reportes pueden
  esperar minutos u horas, un pipeline de lotes o streaming simple resuelve con mucho menos costo.
- **"¿El data lake es lo mismo que 'la nube'?"** No. La nube es dónde corre; el lake es cómo se organiza el
  dato. Puedes tener un lake en tu propio servidor.
- **"¿Un data lake es solo una carpeta compartida?"** No: sin catálogo, esquema de lectura y gobierno es
  exactamente eso, y así termina en pantano de datos.
- **"¿Necesitamos un científico de datos para esto?"** No para diseñar la arquitectura. Sí se necesitan
  dueños del dato y personas que mantengan catálogo y reglas — que suelen ser perfiles de gestión, no de
  programación.
- **"¿Cuánto cuesta?"** Depende de tres decisiones de arquitectura: dónde vive el dato, cada cuánto se
  procesa y cuánto se retiene. Un modo de falla típico en el sector público es un piloto barato de
  construir y caro de operar: el costo de operación se decide en el diseño, no después.
- **"¿Esto no es lo mismo que el Bloque 4 (integración)?"** No. Aquí se decide **qué** y **dónde**; en el
  Bloque 4, **cómo se automatiza** (ETL/ELT, orquestación).

---

## 6. Arreglar antes de dictar: inconsistencias detectadas

Estas contradicciones están en el material publicado. Ninguna impide dictar, pero conviene que las
conozcas para no contradecirte a mitad de clase. Ordenadas por impacto.

### 6.1 Alta prioridad (afectan lo que el estudiante ve o entrega)

| # | Qué pasa | Dónde | Qué hacer |
|---|---|---|---|
| 1 | "Las **tres** preguntas" omiten el catálogo; conviven marcos de 3, 4 y 5 preguntas | `03_Arquitectura_de_Datos.md:41-45`, `Sesion_04_…md:61-65`, `notas-sesion-04.md:34` vs `reference/componentes-de-arquitectura.html:16`, `lessons/0001…html:20`, `reference/leer-un-diagrama.html:18-27` | Adoptar el marco de **cuatro preguntas** y aclarar en voz alta que el de cinco es solo para leer diagramas |
| 2 | Flujo de **4** etapas en el deck y las notas vs **5** en el documento base, el plan, el taller y el SVG | `notas-sesion-04.md:88`, `deck-sesion-04.html:262-268` vs `03_…md:90`, `taller_sesion4…md:32`, `assets/esquema-flujo.svg` | Enseñar las **5** etapas; si usas el deck, agrega "Almacenamiento de análisis" a mano |
| 3 | Taller 5 con **50** min de trabajo (guía) vs **60** min (notas y deck), y la "consigna de 10 min" de la guía duplica la apertura del plan | `taller_sesion5…md:4,25-29` vs `notas-sesion-05.md:104`, `presentacion_sesion5.md:270` | Fijar **60 min de trabajo + 15 de puesta en común** (la apertura ya está en el plan) y anunciarlo |
| 4 | La plantilla del taller exige "contrastar con una alternativa descartada", pero la plantilla del plan, del deck y del documento base solo dice "cuál y por qué" | `taller_sesion5…md:46` vs `Sesion_05…md:148`, `deck-sesion-05.html:282` | Dictar la exigencia desde el inicio o repartir la versión de la guía del taller |
| 5 | ✅ **Resuelto (2026-10-06).** El taller 4 decía que las flechas **no** son componente, pero el deck offline y las notas pedían etiquetar "caja **y flecha**" | Se quitaron los rótulos "Flecha 1…6" del esquema y `notas-sesion-04.md:103` + `deck-sesion-04.html:296` ahora piden etiquetar **solo cajas** | — |
| 6 | La hoja de trabajo se anuncia con "cuatro categorías" pero la clave usa **seis** etiquetas (Fuente y Uso) | `Sesion_04…md:168` vs `taller_sesion4…md:55-65` | Decir que hay cuatro **componentes** y además dos roles de posición (fuente y uso), que no son componentes |
| 7 | Criterios de elección del patrón: **3 o 4** según el archivo, y el primero se llama "caso", "uso" y "para qué se usan los datos" | `Sesion_05…md:22`, `deck-sesion-05.html:308` vs `03_…md:129-130`, `lessons/0002…html:13` | Unificar a **caso/uso · volumen · estructura · tiempo real** |
| 8 | ✅ **Resuelto (2026-10-06).** El tamaño de equipo cambiaba entre sesiones (3–4 en S4, 4–5 en S5) y la guía del taller 5 no lo fijaba | Unificado a **4** en planes, talleres, notas y decks | — |

### 6.2 Prioridad media (coherencia y trazabilidad)

| # | Qué pasa | Dónde | Qué hacer |
|---|---|---|---|
| 9 | El bloque se ubica "tras los bloques de Datos, **Calidad y Almacenamiento**", estructura que ya no existe | `Sesion_04…md:44`, `notas-sesion-04.md:11` | Decir "después de Datos (Módulo 1) e Ingesta (Módulo 2)" |
| 10 | "Por qué importa el diseño" tiene **4** consecuencias en el documento y el deck, y se cuenta como "tres" en las notas | `notas-sesion-04.md:39` vs `03_…md:54-57` | Contar las **cuatro**, incluida "no poder crecer" |
| 11 | La carga horaria del bloque se contradice en su propia línea: "8 teóricas + 4 prácticas" (12 h) vs "2 sesiones de 3 h" (6 h) | `03_Arquitectura_de_Datos.md:4` | Aclarar que son **6 h** reloj (180 min × 2) |
| 12 | `README.md` del módulo describe reveal.js local y una ruta de publicación autorreferente; los HTML cargan reveal.js por CDN | `README.md:30-32,35` vs `presentacion_sesion4.html` | Actualizar el README (o solo no confiar en él para publicar) |
| 13 | "Kimball & Ross" es fuente declarada y citada en lecciones y referencia, pero falta en las referencias del documento base | `RESOURCES.md:14`, `lessons/0002…html:94` vs `03_…md:191-198` | Añadirlo a las referencias recomendadas |
| 14 | Las notas del orador cubren 16 láminas (deck offline); la presentación reveal tiene 19/20, con láminas **sin guion** (p. ej. "Así se lee el mismo esquema, resuelto") | `notas-sesion-04/05.md:2` vs `presentacion_sesion4/5.html` | Usar los bloques `Note:` de `presentacion_sesionN.md`, que sí cubren la versión reveal |
| 15 | Las tablas de "hoja de ruta" de los decks suman **160** de 180 min (omiten apertura y pausa) | `deck-sesion-04/05.html` | Usar el cronograma de §10 |

### 6.3 Glosario incompleto

`GLOSSARY.md` afirma que "todas las lecciones y ejercicios usan estos términos", pero le faltan cuatro que
el material usa y nunca define. Añádelos a mano o preséntalos explícitamente:

- **Esquema fijo / esquema al leer** — el rasgo técnico que separa warehouse, lake y lakehouse. Hoy se enseña
  como etiqueta, sin explicar la palabra "esquema".
- **Streaming** — se usa como equivalente de "tiempo real", sin entrada propia.
- **Pantano de datos (data swamp)** — aparece cuatro veces y es la clave del riesgo del lake.
- **Semiestructurado** — está en el taller 5, la lección 03 y el SVG resuelto, sin definición.

---

## 7. Temas que faltan y cómo incorporarlos sin rehacer el bloque

Ocho vacíos reales, ordenados por valor pedagógico. Cada uno con un mini-guion de 5–15 min y la fuente que
lo respalda. Todos se pueden agregar sin tocar la estructura de dos sesiones (ver §10).

### 7.1 OLTP vs OLAP — 15 min en la Sesión 4 (el más valioso)

**Por qué falta y por qué importa:** es el eje que explica *por qué* hace falta un almacenamiento analítico
separado. Sin él, los cuatro componentes parecen una lista arbitraria; con él, se **derivan**. Para un
gestor público es inmediato: el registro civil, la nómina o el sistema de trámites son **OLTP**
(transaccional: registrar y garantizar cada operación); el tablero de indicadores es **OLAP** (analítico:
consultar muchos datos agregados sin frenar los sistemas operativos).

**Guion:** "¿Por qué no consultamos los indicadores directo sobre la base de trámites? Porque esa base está
optimizada para registrar operaciones una por una, no para sumar cinco años de datos. Si le pedimos
análisis pesados, se frena la atención al ciudadano. De ahí nacen dos mundos: el transaccional y el
analítico. La arquitectura de datos es, en gran parte, el puente entre los dos." → Conectar con: por eso el
flujo tiene un **almacenamiento operacional** y otro de **análisis**.

**Fuente:** Microsoft Learn en español, páginas hermanas de OLTP y OLAP del Azure Architecture Center
(actualizadas 2026-08) [16][17].

### 7.2 Capas de refinamiento bronce/plata/oro — 15 min en la Sesión 4

**Por qué importa:** los cuatro patrones dicen **dónde** viven los datos; las capas dicen **cómo sube la
calidad**. Sin ellas, "calidad de datos" no tiene lugar donde ocurrir.

**Guion:** bronce = dato crudo tal como llegó · plata = limpio y validado · oro = enriquecido, listo para
reportar (es la capa donde se hace el modelado dimensional). Mapa de roles utilísimo para el grupo:
bronce → ingeniería/auditoría; plata → analistas y científicos de datos; oro → analistas de negocio y
dirección. Y un gancho de costo: la frecuencia con que se procesa cada capa es una decisión de costo, no una
obviedad.

**Fuente:** Microsoft Learn en español, "La arquitectura de medallón" y su versión Fabric (bronce/plata/oro
en castellano, actualizadas 2026) [13][14]. Decir que es **recomendación de proveedor**, no estándar
neutral: la propia documentación aclara que es "mejor práctica recomendada pero no un requisito" [8].

### 7.3 Roles de gobernanza (dueño / cuidador / custodio) — 10 min en la Sesión 4

**Por qué importa:** es el mayor agujero de gobernanza del bloque. Hoy "gobernanza" se define por sus
materias (calidad, seguridad, acceso) pero no por sus **responsables**, y sin responsables queda como un
comité que se reúne.

**Guion:** tres roles mínimos y una frase cada uno: **dueño del dato** (el área que responde por el
significado y la calidad), **cuidador/steward** (quien lo mantiene y documenta en el día a día),
**custodio** (quien opera el almacenamiento y la seguridad técnica). Aterrizar con el ejemplo ya usado:
"solo Personal modifica el sueldo" — Personal es el **dueño**; Sistemas es el **custodio**. Autoridad
escrita, no acuerdos verbales.

**Fuente:** Wikipedia "Data steward" + playbook de gobernanza de datos del gobierno federal de EE. UU. +
DAMA-DMBOK (que lista "Data Governance and Stewardship" como área) [30][29][24]. Nota: el trío se respalda
en DAMA/Wikipedia; el playbook federal se centra en *charters* y en un responsable de alto nivel, no en la
definición del trío.

### 7.4 Contratos de datos — 10 min en la Sesión 5

**Por qué importa:** el instrumento que operacionaliza la gobernanza con el dueño de un sistema de origen:
esquema, reglas de calidad, niveles de servicio y roles en un documento. Para una agencia pública que
depende de un sistema ajeno (un registro, una nómina de otro ministerio), convierte una dependencia
informal en un acuerdo explícito y verificable.

**Guion:** "La gobernanza dice *qué* reglas hay. El contrato de datos dice *con quién* las acuerdas y *cómo
se verifican*." Mostrar que existe un estándar abierto y neutral (ODCS, Linux Foundation, YAML, licencia
Apache 2.0) — no es un invento de un proveedor.

**Fuente:** Bitol / Open Data Contract Standard (Linux Foundation) [10]. **Aviso: no hay fuente fiable en
español** — usar la fuente en inglés y glosarla [F5].

### 7.5 Dimensiones de calidad de datos — 8 min en la Sesión 4

**Guion:** "Calidad" sin dimensiones no se puede auditar. Dar 4–6 dimensiones nombradas y aplicarlas al caso
de trámites: **exactitud** (el DNI coincide con el documento), **completitud** (no falta el teléfono),
**consistencia** (el padrón dice lo mismo en dos reparticiones), **vigencia** (el domicilio es el actual),
**unicidad** (una persona, un registro), **validez** (el formato cumple la regla). Cierre: con estas
palabras ya se pueden escribir criterios de aceptación en un pliego.

**Fuente:** ISO/IEC 25012 (15 características, inherentes vs dependientes del sistema) vía portal ISO 25000
[27]; para el encuadre regional, la guía de la CEPAL (2022) para estadísticas oficiales [22]. *Pendiente:
confirmar si ISO/IEC 25012 (2008) sigue siendo la referencia vigente o si conviene citar ISO 8000.*

### 7.6 Modelado dimensional — 15 min en la Sesión 5 (opcional, si el grupo lo pide)

**Guion:** hechos (lo que se mide: cantidad, monto) vs dimensiones (el contexto: tiempo, zona, trámite,
persona); estrella (pocas dimensiones desnormalizadas) vs copo de nieve (dimensiones normalizadas);
granularidad (el nivel de detalle de un hecho). Aclarar en la misma frase que **copo de nieve no es una
arquitectura**: es un estilo de esquema que vive dentro del warehouse.

**Fuente:** Kimball Group, lista oficial de técnicas de modelado dimensional [12]; Microsoft Learn en
español tiene una serie de modelado dimensional (2026) utilizable como respaldo [15].

### 7.7 Linaje / trazabilidad — 5 min (encaja en catálogo)

**Guion:** para estadística oficial, "¿de dónde salió este número?" debe ser respondible. El linaje es la
capacidad de rastrear origen, transformaciones y uso. Y es **metadato**: lo posee el componente catálogo que
el bloque ya enseña — no es una pieza nueva.

**Fuente:** Wikipedia "Data lineage" [31]; DAMA (Metadata Management como área) [24].

### 7.8 Marcos de referencia — 5 min (orientación, no contenido)

**Guion:** dos frases. (1) La arquitectura de datos es **una** de ~14 funciones de gestión de datos, no toda
la disciplina (DAMA-DMBOK). (2) Vive dentro de una arquitectura empresarial con una capa de negocio por
encima y una tecnológica por debajo (TOGAF) — por eso **no se delega entera a TI**.

**Fuente:** DAMA International (DMBOK 2.ª ed. revisada 2024; los diagramas de contexto son CC BY-ND 4.0, es
decir reutilizables con atribución en docencia no comercial) [24]; The Open Group (TOGAF) [26];
ISO/IEC/IEEE 42010:2022 para el punto de que los procesos quedan fuera de la norma [25].

### 7.9 Seguridad/privacidad y costo — 5 min (transversal)

**Guion:** los cuatro patrones se eligen por capacidad; en el sector público hay dos pesos que casi nunca se
mencionan y que deciden el éxito: **seguridad/privacidad** (clasificación del dato, control de acceso,
limitación de finalidad, retención) y **costo de operación**, porque el modo de falla típico es un piloto
barato de construir y caro de sostener.

**Fuente:** AWS Well-Architected Framework en español (seis pilares, con seguridad y optimización de costos
explícitos) y su Data Analytics Lens [18]; Google Cloud Well-Architected Framework en español [19]. Caveat:
son marcos de proveedor; preséntalos como una operacionalización de principios generales.

---

## 8. Cerrar el ciclo de evaluación

### 8.1 Lo que ya existe y no se está usando

El bloque **ya tiene** un instrumento autocorregible: las tres lecciones interactivas con **16 preguntas**
de quiz (`lessons/0001–0003`, con corrección al instante y explicación del "por qué"). Hoy solo aparecen
mencionadas en el README: ningún plan, taller, nota o tabla de evaluación las asigna.

**Úsalas así:** asigna la lección correspondiente como trabajo previo o de cierre de cada tramo
(0001 → componentes; 0002 → patrones; 0003 → diseño). Recoge el resultado como evidencia de los objetivos
que hoy solo se evalúan por "participación": *reconocer los patrones*, *explicar las diferencias* y
*distinguir arquitectura de herramienta*. Y las hojas de `reference/` sirven como material de apoyo
imprimible en el taller.

### 8.2 Rúbrica sugerida para el taller de la Sesión 5

El bloque no tiene puntaje ni niveles en ninguna parte. Esta rúbrica usa la escala del Plan de Clases
(inicial 1–59 · muy parcial 60–69 · suficiente 70–84 · alto 85–94 · total 95–100); se dan los tres anclajes
y los intermedios se interpolan.

| Criterio | Logro inicial (1–59) | Logro suficiente (70–84) | Logro total (95–100) |
|---|---|---|---|
| **Caso y fuentes** | El objetivo es genérico; las fuentes no se listan con su tipo | Objetivo formulado con una pregunta respondible; fuentes listadas con tipo | Objetivo y pregunta precisos; fuentes completas, con tipo y origen |
| **Componentes** | Faltan componentes o almacenamiento y procesamiento se confunden | Los cuatro componentes aparecen correctamente definidos | Los cuatro componentes, con catálogo y gobernanza como capas transversales y ejemplos propios |
| **Patrón elegido** | Se nombra un patrón sin justificar | Patrón adecuado al caso con justificación | Patrón justificado con los cuatro criterios **y una alternativa descartada con motivo** |
| **Diagrama y gobernanza** | El diagrama omite catálogo o gobernanza | Flujo completo de fuente a uso con las capas transversales | Diagrama legible por un tercero + reglas de gobernanza con dueños y condiciones de acceso |
| **Coherencia interna** | Las secciones se contradicen entre sí | Caso, fuentes, componentes y patrón son coherentes | Todo el diseño se sostiene y el grupo defiende cada decisión |

### 8.3 Quiz diagnóstico de errores (10 min, al inicio de la Sesión 4 y de nuevo al cierre)

Sirve para **detectar** los errores de §4, no para calificar. Los errores se concentran y son medibles: si
el grupo falla los ítems 1–3 en bloque, dedica tiempo extra a ellos.

| # | Pregunta | Respuesta | Error que detecta |
|---|---|---|---|
| 1 | Una caja dice "guardamos y limpiamos los pagos". ¿Cuántos componentes hay ahí? | Dos: almacenamiento y procesamiento | Fusión almacenamiento/procesamiento |
| 2 | ¿Dónde colocas el catálogo en el flujo? | En ningún punto: atraviesa todo (capa transversal) | Catálogo como etapa |
| 3 | ¿Y la gobernanza? | Igual: capa transversal | Gobernanza como etapa |
| 4 | La institución acumula todo crudo y nadie encuentra nada. ¿Qué patrón es y qué falló? | Data lake; faltó catálogo y gobierno → pantano de datos | Lake sin gobierno |
| 5 | Necesitan reportes mensuales confiables y **solo** eso. ¿Cuál es el patrón más simple? | Data warehouse | Elegir por prestigio |
| 6 | ¿El lakehouse reemplazó al data warehouse? | No: coexisten; la arquitectura warehouse+lake sigue siendo la más instalada | Escalera de prestigio |
| 7 | ¿Cuál es el costo principal de lambda? | Mantener la misma lógica en dos sistemas (batch y velocidad) | Lambda como opción "gratis" |
| 8 | "Copo de nieve" ¿es un patrón de arquitectura? | No: es un estilo de esquema dimensional, dentro del warehouse | Confusión patrón/estilo |

### 8.4 Dos cautelas didácticas (evidencia, no opinión)

- **Los ejemplos resueltos pueden introducir nuevos errores** si están mal diseñados, y su andamiaje se
  vuelve redundante con estudiantes ya familiarizados ("expert reversal"). Al mostrar el esquema resuelto,
  contrasta explícitamente en vez de solo exhibirlo.
- **Un mapa conceptual solo ayuda si el grupo lo trabaja**, no si lo recibe hecho. Si vas a usar el de los
  cuatro componentes, pide construirlo y luego compara con el tuyo.

---

## 9. Checklist de preparación (antes de cada sesión)

**Una semana antes**
- [ ] Elegir el deck: presentación reveal (completa, con diagramas) o deck autocontenido (plan B sin internet).
- [ ] Decidir el marco canónico de preguntas (recomendado: **cuatro**) y comprometerse a usarlo siempre.
- [ ] Resolver las inconsistencias de alta prioridad de §6.1 que afecten tus materiales impresos.
- [ ] Imprimir: esquema sin etiquetas (uno por equipo), hojas de trabajo, plantilla de diseño del taller 5.
- [ ] Verificar que tienes a mano el esquema resuelto (para la puesta en común).

**El día antes**
- [ ] Confirmar los tiempos con el cronograma de §10 y calcular cuántos equipos salen según la matrícula.
- [ ] Preparar la pizarra: la frase "dónde / cómo / qué es / quién" y "arquitectura = el plano".
- [ ] Decidir cuántos temas de §7 incorporas (sugerido: 2 en la Sesión 4 y 1 en la Sesión 5).
- [ ] Tener el quiz diagnóstico de §8.3 listo para lanzar como apertura.

**Durante**
- [ ] Sesión 4: lanzar el quiz diagnóstico y **anotar** los ítems fallados; retomarlos al hablar de cada componente.
- [ ] Sesión 4: no pasar de largo la lectura guiada del esquema sin etiquetas — es el puente a la práctica.
- [ ] Sesión 5: exigir la **alternativa descartada** desde la consigna, no en la corrección.
- [ ] Circular por los equipos buscando los tres bloqueos típicos (almacenamiento≠procesamiento, patrón sin
      justificar, catálogo o gobernanza ausentes).

**Después**
- [ ] Recoger las entregas; las de la Sesión 5 son la evidencia del bloque.
- [ ] Registrar en la pizarra las distintas elecciones de patrón para contrastarlas (ya está previsto en el plan).

---

## 10. Cronograma reconciliado (180 min por sesión)

Los planes de sesión cuadran en 180 min, pero los decks suman 160. Estas dos tablas son la versión
**canónica y consistente**, y además incorporan los temas de §7 sin exceder el tiempo.

**Sesión 4 — conceptos y componentes**

| Bloque | Min | Nota |
|---|---|---|
| Apertura + quiz diagnóstico | 10 | El diagnóstico reemplaza la introducción genérica y detecta errores de §4 |
| Qué es + por qué importa (fusionados) | 25 | Los "síntomas" se resuelven como lluvia de ideas de 3 min, no como bloque |
| **OLTP vs OLAP** (nuevo) | 15 | §7.1 — motiva el almacenamiento de análisis |
| Pausa | 10 | |
| Los cuatro componentes | 35 | Con el marco de **cuatro** preguntas |
| **Capas bronce/plata/oro + calidad** (nuevo) | 15 | §7.2 y §7.5 |
| Flujo y lectura de diagramas | 20 | Flujo de **cinco** etapas |
| Práctica: identificar componentes | 40 | Se recorta de 50 a 40 |
| Cierre | 10 | |
| **Total** | **180** | |

**Sesión 5 — patrones y diseño**

| Bloque | Min | Nota |
|---|---|---|
| Apertura y encuadre | 10 | Repaso breve de la sesión 4 |
| Patrones | 40 | Incluye el matiz sobre lambda/kappa (§3.5) y que medallion es capa, no patrón |
| Comparativa + criterios | 15 | Con los **cuatro** criterios unificados |
| Pausa | 10 | |
| Diseño paso a paso + plantilla | 20 | Incluye "alternativa descartada" en la plantilla |
| Taller | 60 | Trabajo en equipos |
| Puesta en común | 15 | 3–4 min por equipo |
| Cierre | 10 | |
| **Total** | **180** | |

**Qué se sacrifica:** en la Sesión 4 se recorta la práctica de 50 a 40 min y se fusionan "qué es" y "por qué
importa"; en la Sesión 5, el bloque de patrones absorbe el matiz crítico en lugar de agregar tramos. Si
prefieres no tocar nada, los temas de §7 funcionan igual como **lectura asincrónica** con las fuentes de §11.

---

## 11. Fuentes de confianza (para preparar y para recomendar)

**En español, actualizadas y directamente aplicables:**

- **Microsoft Learn (es)** — arquitectura de medallón (bronce/plata/oro) [13][14], modelado dimensional
  [15], OLTP y OLAP como páginas hermanas [16][17]. Es la fuente en español más completa para los vacíos.
- **AWS Well-Architected Framework (es)** [18] y **Google Cloud Well-Architected Framework (es)** [19] —
  para el encuadre de pilares: seguridad, costo, fiabilidad.
- **CEPAL (acceso abierto)** — el mejor encaje regional: gobernanza de datos en el sector público de cuatro
  ciudades latinoamericanas (2023) [20]; guía de marco de gobernanza de gobierno digital para ALC (2025)
  [21]; aseguramiento de calidad en estadísticas oficiales (2022) [22].
- **Gobierno de España (PAe)** — guía NTI "Relación de modelos de datos", el artefacto de modelos de datos
  para administraciones públicas [23].
- **Wikipedia (es)** — "Malla de datos" [40], útil como glosario de apoyo gratuito.

**En inglés (respaldo donde no hay fuente en español):**

- **Kreps, "Questioning the Lambda Architecture"** — la crítica canónica a lambda y el origen de kappa [1].
- **Paper del lakehouse (CIDR 2021)** — fuente primaria de lakehouse, esquema al leer y la base instalada
  warehouse+lake [2].
- **Bitol / Open Data Contract Standard** — estándar neutral de contratos de datos [10].
- **Kimball Group** — modelado dimensional [12]; **DAMA International** [24]; **The Open Group / TOGAF** [26];
  **ISO/IEC/IEEE 42010:2022** [25].
- **Confluent (arquitectura)** — respaldo para streaming y kappa [42].

**Vacíos duros: sin fuente fiable en español.** Contratos de datos y kappa/streaming no tienen fuente
oficial verificable en castellano; Databricks y Confluent no publican documentación en español; DAMA-DMBOK
existe en español pero es de pago. Y `es.stackoverflow.com` **no sirve** para este bloque: el tag
`data-warehouse` no existe y `databricks` tiene 12 preguntas [41]. Conviene actualizar `RESOURCES.md` en
consecuencia, porque hoy recomienda esa comunidad como fuente de consulta.

---

## 12. Tres decisiones editoriales que quedan en tus manos

No se resuelven con evidencia: son decisiones de diseño del bloque. Tomarlas antes de la próxima cohorte
elimina de una sola vez la mayoría de las inconsistencias de §6.

1. **El marco canónico de preguntas.** ¿Tres, cuatro o cinco? Recomendación: **cuatro** como eje del bloque
   (almacenamiento/procesamiento/catálogo/gobernanza) y **cinco** como procedimiento acotado para leer
   diagramas. Propagar a `03_…md`, planes de sesión, notas, decks, lección 01 y hojas de referencia.
2. **El reparto de tiempo del taller 5 y el tamaño de equipo.** ¿50 o 60 min de trabajo? ¿3–4 o 4–5
   personas? Recomendación: **60 min + 15 de puesta en común, equipos de 4**, y dejarlo escrito en la guía
   del taller y en el deck.
3. **El deck autoritativo.** ¿La presentación reveal (completa, con diagramas) o el deck autocontenido (sin
   imágenes)? Recomendación: **reveal como principal**, y regenerar el deck offline a partir de ella con al
   menos el esquema del flujo y el de los cuatro componentes embebidos, porque hoy es la única versión que
   funciona sin internet y es justamente la que perdió los diagramas.

**Pendiente ya declarado en el propio material:** el banco de preguntas para Moodle (`README.md:36`). El
quiz diagnóstico de §8.3 y las 16 preguntas de `lessons/` son la base natural para construirlo.

