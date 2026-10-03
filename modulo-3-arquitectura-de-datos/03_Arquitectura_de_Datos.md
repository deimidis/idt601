# Bloque 3 — Arquitectura de Datos

**Módulo:** Ingeniería de Datos (IDT 601)
**Sesiones:** 4 y 5 · **Carga del bloque:** 8 teóricas + 4 prácticas (Plan de Clases) · dictado en 2 sesiones de 3 h cada una

---

## ¿De qué trata este bloque?

Ya sabemos de dónde salen los datos, qué forma tienen y cómo llegan a la institución.
Ahora llega la pregunta de fondo: **¿cómo los organizamos para que toda la institución
pueda usarlos con confianza?** La respuesta es una **arquitectura de datos**.

Una arquitectura de datos es el **plano** que define qué datos existen, dónde se guardan,
cómo se mueven y quién los usa con qué reglas. Sin ese plano, cada área guarda "su" dato
en "su" sistema: aparecen duplicados, versiones que no coinciden y reportes que nadie
puede conciliar. Con un plano, la información se vuelve un activo compartido y confiable.

**Cómo se reparte en dos sesiones de 3 horas (180 min cada una):**
- **Sesión 4** — qué es una arquitectura de datos, por qué importa el diseño, sus cuatro
  componentes y el flujo entre ellos; una práctica de identificación de componentes.
- **Sesión 5** — los patrones de arquitectura (data warehouse, data lake, data lakehouse
  y lambda), el proceso de diseño paso a paso y un taller de diseño con entrega.

---

## Lectura

### 1. ¿Qué es una arquitectura de datos?

La arquitectura de datos es el **diseño global de cómo una organización guarda, mueve,
procesa y gobierna sus datos**. Es como el plano de una casa: antes de construir se define
dónde van las habitaciones, las cañerías y las conexiones eléctricas. El plano no es la
casa, pero determina cómo funcionará.

Conviene una distinción clave: la arquitectura **no es una herramienta ni un software**.
Es un **conjunto de decisiones de diseño** que antecede a la tecnología. Dos instituciones
pueden usar el mismo sistema y tener arquitecturas muy distintas según cómo deciden
organizar sus datos. Primero se decide el diseño; después se elige la tecnología.

La arquitectura responde tres preguntas:

1. **¿Dónde** vive cada dato? (almacenamiento)
2. **¿Cómo** se mueve y transforma? (procesamiento)
3. **¿Quién** puede usarlo y con qué reglas? (acceso y gobernanza)

> Idea para la pizarra: **arquitectura de datos = el plano de la información institucional.**

### 2. Por qué importa el diseño

Diseñar no es un lujo técnico: es una decisión con consecuencias prácticas. Cuando no hay
un plano compartido ocurren cuatro problemas típicos:

- **Silos de información** — cada área guarda "su" dato y nadie ve el conjunto.
- **Duplicación y retrabajo** — el mismo dato se captura varias veces, con valores distintos.
- **Desconfianza** — cada reporte cuenta una historia distinta y se pierde credibilidad.
- **No poder crecer** — sumar una fuente o un servicio obliga a reconstruir todo desde cero.

Estos problemas se reconocen en síntomas cotidianos: el mismo padrón con valores distintos
entre dos reparticiones, datos encerrados por área, reportes que se arman a mano durante
días, migraciones traumáticas y reglas poco claras sobre quién es dueño del dato.

**Mensaje puente:** *diseñar es barato; reparar una arquitectura improvisada es caro.*

### 3. Los cuatro componentes

Toda arquitectura se arma con cuatro piezas, y cada una responde una pregunta distinta:

| Componente | Pregunta que responde | Ejemplo |
|---|---|---|
| **Almacenamiento** | ¿Dónde vive el dato y en qué forma? | Base de trámites + repositorio de escaneos |
| **Procesamiento** | ¿Cómo se mueve y transforma? | Consolidación nocturna de pagos |
| **Catálogo** | ¿Qué datos existen y qué significan? | Diccionario que define "DNI" |
| **Gobernanza** | ¿Quién puede usarlo y con qué reglas? | Solo Personal modifica el sueldo |

- El **almacenamiento** responde *dónde*: bases de datos, data warehouse, data lake, archivos;
  guarda datos estructurados y no estructurados.
- El **procesamiento** responde *cómo*: limpieza, unión y cálculo de indicadores, por lotes
  (batch) o en tiempo real (streaming).
- El **catálogo** responde *qué es*: documenta cada dato con sus **metadatos** (definición,
  formato, dueño y origen); su forma más conocida es el **diccionario de datos**.
- La **gobernanza** responde *quién y con qué reglas*: define dueños del dato y condiciones
  de calidad, seguridad, privacidad y acceso.

### 4. El flujo entre componentes y las capas transversales

Los componentes no actúan aislados: forman un **flujo** desde la fuente hasta el uso.

```
Fuente → Almacenamiento → Procesamiento → Almacenamiento de análisis → Uso
```

Los datos **entran** desde las fuentes (sistemas, formularios, sensores), se **guardan**,
se **transforman** para unirlos y limpiarlos, y quedan **disponibles** para reportes y análisis.

El catálogo y la gobernanza no son "una caja más" del flujo: son **capas transversales** que
atraviesan todo el trayecto. Documentan y regulan la información de la fuente al uso. Es el
error frecuente dibujarlos como un paso adicional.

Para leer cualquier diagrama basta un procedimiento de cinco preguntas: ¿dónde **nacen** los
datos?, ¿dónde se **guardan**?, ¿qué los **transforma**?, ¿dónde está su **definición**?,
¿quién controla el **acceso**?

### 5. Los patrones: warehouse, lake, lakehouse y lambda

Un **patrón de arquitectura** es una forma típica y probada de organizar los datos para un
propósito. No hay que inventar de cero: se elige entre soluciones conocidas.

- **Data warehouse** — almacena **datos ya procesados, limpios y estructurados**, listos para
  reportes. Esquema fijo, alta confiabilidad. A favor: datos confiables y consistentes. En
  contra: poco flexible ante datos nuevos o no estructurados.
- **Data lake** — guarda **datos crudos y diversos**, de cualquier tipo y a gran escala. Esquema
  al leer. A favor: flexibilidad. En contra: sin gobierno se vuelve un "pantano de datos"
  (data swamp).
- **Data lakehouse** — **combina** la flexibilidad del lake con la estructura y el gobierno del
  warehouse. Guarda crudo y permite consultarlo con esquema. A favor: un solo lugar para datos
  crudos y analíticos. En contra: exige más herramientas y madurez de gobierno.
- **Arquitectura lambda** — combina **dos caminos**: una **capa batch** (procesa la historia
  completa, con precisión) y una **capa de velocidad** (procesa lo recién llegado, de inmediato).
  Ideal para reportes confiables **y** alertas inmediatas. En contra: dos lógicas que mantener.

| Patrón | Qué guarda | Foco | Tiempo real | Riesgo o costo |
|---|---|---|---|---|
| Data warehouse | Datos procesados y limpios | Reportes confiables | No | Poco flexible ante datos nuevos. |
| Data lake | Datos crudos y diversos | Guardar todo | No | Sin gobierno, pantano de datos. |
| Data lakehouse | Crudo + esquema y gobierno | Analizar ambos mundos | Parcial | Exige más herramientas y madurez. |
| Lambda | Batch + velocidad | Reportes y alertas | Sí | Dos lógicas; mayor complejidad. |

**No hay un patrón "mejor":** la elección depende del **caso**, el **volumen**, la
**estructura del dato** y la **necesidad de tiempo real**.

### 6. Diseñar una arquitectura paso a paso

Diseñar una arquitectura sigue un proceso ordenado. Primero el plano; la tecnología viene después.

1. **Entender el caso** — ¿qué necesita la institución y qué preguntas debe responder con datos?
2. **Mapear las fuentes** — ¿de dónde salen los datos y qué tipo son? (Bloque 1).
3. **Definir los componentes** — almacenamiento, procesamiento, catálogo y gobernanza (Sesión 4).
4. **Elegir el patrón** — warehouse, lake, lakehouse o lambda, según el caso.
5. **Documentar** — dibujar el flujo, nombrar cada componente y registrar las reglas de gobernanza.

| Sección de la plantilla | Qué completar |
|---|---|
| Caso y objetivo | Qué necesita la institución y qué pregunta responde |
| Fuentes de datos | De dónde salen los datos y su tipo |
| Componentes | Almacenamiento, procesamiento, catálogo, gobernanza |
| Patrón elegido | Cuál y por qué |
| Diagrama de flujo | Esquema desde la fuente hasta el uso |
| Reglas de gobernanza | Quién accede, calidad y seguridad |

**Mensaje puente:** *el plano no es la casa.* Hoy dibujamos el plano; la implementación
tecnológica viene después.

---

## Ideas clave

- La arquitectura de datos es el **plano** de cómo se guardan, procesan y gobiernan los datos;
  **no es una herramienta**.
- Importa porque evita **silos, duplicación, desconfianza** y la incapacidad de crecer.
- Sus componentes son **almacenamiento, procesamiento, catálogo y gobernanza**; catálogo y
  gobernanza son **capas transversales**.
- Los patrones comunes son **data warehouse, data lake, data lakehouse y lambda**.
- Elegir el patrón depende del **caso, el volumen, la estructura del dato y el tiempo real**.
- Diseñar es responder, en orden: **qué datos → dónde se guardan → cómo se procesan → quién
  los gobierna**, y documentarlo.

## Glosario

| Término | Definición |
|---|---|
| Arquitectura de datos | Plano que define qué datos existen, dónde se guardan, cómo se mueven y quién los usa con qué reglas. |
| Almacenamiento | Dónde vive el dato y en qué forma. |
| Procesamiento | Cómo se mueven y transforman los datos. |
| Catálogo de datos | Inventario que documenta qué datos existen y qué significan. |
| Metadatos | Datos que describen a los datos (definición, formato, dueño, origen). |
| Gobernanza de datos | Reglas y responsables sobre calidad, acceso, seguridad y uso. |
| Silo de datos | Datos encerrados en un área o sistema que los demás no ven. |
| Data warehouse | Almacén de datos procesados y estructurados, listos para reportar. |
| Data lake | Repositorio de datos crudos y diversos, en cualquier formato. |
| Data lakehouse | Combinación de lake y warehouse: crudo + esquema y gobierno. |
| Arquitectura lambda | Patrón con dos caminos: capa batch y capa de velocidad. |

## Para repasar (autoevaluación)

1. ¿Por qué se dice que la arquitectura de datos es "el plano" y no "la herramienta"?
2. Nombra y explica los cuatro componentes, y di qué pregunta responde cada uno.
3. ¿Cuál es la diferencia entre data warehouse y data lake? ¿Qué agrega el lakehouse?
4. ¿Qué patrón combina reportes confiables con alertas en tiempo real y a qué costo?

## Referencias recomendadas

- Martin Kleppmann, *Diseño de aplicaciones con uso intensivo en datos* (Marcombo, 2022).
  Arquitecturas de sistemas de datos, procesamiento por lotes y por flujos.
- Luis Joyanes Aguilar, *Ciencia de Datos: Un enfoque práctico* (Alfaomega, 2024). Data
  warehouse, data lake y data lakehouse.
- Josep Curto, *Fundamentos de big data* (FUOC/UOC, acceso abierto en línea). Arquitecturas
  y componentes.

## Presentaciones del bloque

- Sesión 4 — Arquitectura: conceptos y componentes: `presentacion_sesion4.html`
- Sesión 5 — Arquitectura: patrones y diseño: `presentacion_sesion5.html`
