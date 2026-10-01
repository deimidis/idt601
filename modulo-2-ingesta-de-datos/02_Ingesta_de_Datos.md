# Bloque 2 — Ingesta de Datos

**Módulo:** Ingeniería de Datos (IDT 601)
**Sesiones:** 2 y 3 · **Carga del bloque:** 8 teóricas + 4 prácticas (Plan de Clases) · dictado en 2 sesiones de 3 h cada una

---

## ¿De qué trata este bloque?

Ya sabemos de dónde salen los datos y qué forma tienen. Ahora llega la pregunta
práctica: **¿cómo los movemos desde su fuente hasta el lugar donde se van a usar?**.
Ese proceso se llama **ingesta de datos**.

La ingesta es el primer eslabón real de un pipeline de datos. Si falla aquí, todo lo
que viene después (análisis, reportes, modelos) se construye sobre una base débil. En
este bloque aprenderás qué es ingerir, con qué métodos y herramientas se hace, qué
decisiones de diseño hay que tomar, qué patrones reutilizar y cómo implementar un
pipeline de ingesta completo.

**Cómo se reparte en dos sesiones de 3 horas (180 min cada una):**
- **Sesión 2** — qué es ingerir, extracción y carga, batch vs. streaming, métodos y
  herramientas, y una práctica de conexión a una fuente sencilla.
- **Sesión 3** — decisiones de diseño, patrones de ingesta, el esqueleto del pipeline
  y un taller de implementación de punta a punta.

---

## Lectura

### 1. ¿Qué es la ingesta de datos?

Ingerir es **tomar datos de una o varias fuentes y llevarlos a un lugar donde se puedan
almacenar, procesar o analizar**. Es el **puente** entre la fuente y el destino: no es
análisis, es el paso previo que lo hace posible.

La ingesta cumple tres tareas:

1. **Recolectar** — juntar información que ya existe pero está dispersa (planillas,
   sistemas, formularios, sensores).
2. **Transportar** — mover los datos desde su origen hasta un destino confiable.
3. **Preparar el terreno** — dejar los datos listos para el almacenamiento y el
   procesamiento que vienen después.

¿Por qué importa? Porque **evita decisiones a ciegas** (sin datos, se decide con
información incompleta), **ahorra trabajo manual** (reemplaza horas de copiar y pegar) y
**habilita todo lo demás** (calidad, análisis y aprendizaje automático dependen de que
los datos fluyan).

> Idea para la pizarra: **Ingesta = recolectar + transportar + dejar listo.**

### 2. Extracción y carga: los dos extremos

Toda ingesta tiene dos extremos:

- **Extracción** — es **tomar** el dato de su origen (una base de datos, un archivo, un
  formulario, una API, un sensor). Implica saber **dónde está** el dato y **cómo acceder**
  a él. *Ejemplo:* descargar el reporte mensual de recaudación desde el sistema de impuestos.
- **Carga** — es **llevar** el dato a su destino (una base de datos central, un almacén de
  datos, un archivo consolidado). Implica saber **a dónde** va y en **qué formato** debe
  quedar. *Ejemplo:* volcar esos datos en la base central de la alcaldía para que todos los
  analistas los consulten.

Entre los extremos casi siempre hay un paso intermedio de **transformación** (limpiar,
renombrar, convertir formatos), que se trabaja con más detalle en la Unidad de
Integración de Datos.

```
Fuente ──extraer──► (transformar) ──cargar──► Destino
```

**Mensaje clave:** *extraer sin cargar es quedarse con el dato en la mano; cargar sin
extraer no es posible. La ingesta es el recorrido completo.*

### 3. Batch vs. streaming: dos modos de mover

Hay dos grandes formas de ingerir, y la pregunta que decide es: **¿cuán frescos deben
estar los datos, y cuánto cuesta mantenerlos así?**

**Por lotes (batch)** — se **acumulan** datos durante un período y se mueven **juntos**,
a intervalos (cada hora, cada noche, cada mes). Es la forma **más común y más económica**.
Ventaja: simple y tolera bien los errores (se reintenta el lote). Desventaja: los datos
tienen un **desfase**. *Ejemplo:* cada noche se consolida la recaudación del día.

**En tiempo real (streaming)** — cada dato se mueve **en cuanto se genera**, sin esperar a
acumular. Se usa cuando la frescura importa y el volumen es continuo. Ventaja: datos
**siempre frescos**. Desventaja: más compleja y costosa de operar. *Ejemplo:* un tablero
que muestra en vivo los reclamos que entran, o las lecturas de semáforos y medidores.

| Criterio | Batch (por lotes) | Streaming (tiempo real) |
|---|---|---|
| Cuándo se mueve el dato | En bloques, a intervalos | En cuanto llega |
| Frescura | Horas o días de desfase | Segundos o menos |
| Costo y complejidad | Baja | Alta |
| Tolerancia a errores | Fácil de reintentar | Más delicada |
| Uso típico | Reportes, cierres, históricos | Alertas, tableros en vivo, sensores |

> **Regla práctica:** *batch cubre casi todo lo que una institución necesita; streaming
> se reserva para lo que no puede esperar.*

### 4. Métodos y herramientas: conectores, scripts y APIs

Conviene separar dos preguntas: el **método** responde a *"¿cómo y cuándo movemos los
datos?"* (batch o streaming); la **herramienta** responde a *"¿con qué lo hacemos?"*.
Las herramientas se agrupan en tres familias:

- **Conectores** — piezas **ya construidas** que saben leer de una fuente o escribir en un
  destino específicos. Rápidos y confiables; sirven para fuentes conocidas. Se configuran,
  no se programan.
- **Scripts** — **código propio** (Python, R, etc.) que hace la extracción y la carga a
  medida. Control total, pero hay que saber programar y mantenerlo.
- **APIs** — **puertas de acceso estandarizadas** que exponen datos de un sistema para que
  otros los lean. Acceso controlado y automatizable; exigen entender el contrato (endpoints,
  claves, límites).

| Herramienta | ¿Qué es? | ¿Cuándo usarla? | ¿Requiere programar? |
|---|---|---|---|
| Conector | Pieza hecha para una fuente/destino | Fuentes conocidas y repetidas | No (configuración) |
| Script | Código propio | Casos a medida o transformaciones | Sí |
| API | Puerta de acceso estandarizada | Cuando el sistema la ofrece | Un poco (llamadas) |

> La mayoría empieza con archivos y scripts, y agrega conectores y APIs cuando la ingesta
> se vuelve repetida y crítica.

### 5. Decisiones de diseño: frecuencia, volumen y fiabilidad

Antes de elegir herramienta o método, hay que responder tres preguntas que condicionan
todo el diseño:

- **Frecuencia — ¿cada cuánto?** Determina el método (batch vs. streaming) y la
  periodicidad. *Ejemplo:* la nómina se procesa una vez al mes; los reclamos, varias veces
  al día.
- **Volumen — ¿cuánto?** Determina el esfuerzo y la técnica para no saturar el sistema.
  *Ejemplo:* consolidar 500 registros mensuales es trivial; ingerir miles de lecturas por
  hora exige otro diseño.
- **Fiabilidad — ¿qué pasa si falla?** Determina las garantías: reintentos, monitoreo y
  **idempotencia** (repetir una carga no debe duplicar ni corromper datos).

| Pregunta | Decisión que condiciona |
|---|---|
| ¿Cada cuánto? (frecuencia) | Método y periodicidad |
| ¿Cuánto? (volumen) | Técnica y capacidad |
| ¿Qué pasa si falla? (fiabilidad) | Reintentos, idempotencia, monitoreo |

*Ejemplo de fiabilidad:* si la carga nocturna falla y se reintenta, el informe no debe
contar dos veces la misma recaudación.

### 6. Patrones de ingesta: completa, incremental, CDC, pull y push

Un **patrón** es una forma probada y reutilizable de resolver un problema recurrente. No
hay que inventar de cero.

- **Carga completa (full load)** — se mueve **todo** el conjunto cada vez, reemplazando lo
  anterior. Cuándo: volúmenes pequeños o datos que cambian por completo.
- **Carga incremental** — se mueve **solo lo nuevo o lo modificado** desde la última carga.
  Cuándo: volúmenes grandes que crecen con el tiempo.
- **Captura de cambios (CDC)** — la **propia fuente** registra y entrega solo los cambios
  (altas, bajas, modificaciones). Cuándo: se necesita saber exactamente qué cambió, casi en
  tiempo real.
- **Pull vs. push** — en **pull**, nuestro sistema **va a buscar** los datos; en **push**,
  la fuente **nos envía** los datos cuando hay novedades.

| Patrón | Idea central | Cuándo usarlo |
|---|---|---|
| Carga completa | Mover todo y reemplazar | Datos pequeños o que cambian por completo |
| Carga incremental | Mover solo lo nuevo | Volúmenes grandes y crecientes |
| CDC | La fuente entrega solo los cambios | Necesidad de cambios exactos y a tiempo |
| Pull | Nosotros buscamos los datos | Control de horario, fuentes que no notifican |
| Push | La fuente envía los datos | Frescura alta, alertas |

> Elegir el patrón correcto evita rehacer el trabajo y previene duplicados.

### 7. Del diseño al pipeline: extraer → transformar → cargar → verificar

Un **pipeline de ingesta** es la secuencia repetible que lleva los datos desde la fuente
hasta el destino. Su esqueleto tiene cuatro etapas:

1. **Extraer** — definir la fuente y cómo acceder; escribir el paso que **lee** los datos.
   *Ejemplo:* leer un CSV con la recaudación diaria.
2. **Transformar** — aplicar las correcciones mínimas para que los datos sean útiles
   (renombrar columnas, limpiar espacios, convertir formatos, quitar nulos).
3. **Cargar** — definir el destino y cómo escribir; aplicar el **patrón** elegido.
   *Ejemplo:* insertar los registros en una tabla de recaudación, sin duplicar.
4. **Verificar** — confirmar que **llegó lo que debía llegar**: número de registros,
   ausencia de duplicados, valores sensatos. Es la etapa que vuelve el pipeline confiable.

```
Fuente ──extraer──► (transformar) ──cargar──► Destino
                        ▲
                   ───verificar───
```

**Mensaje clave:** *un pipeline funcional es el que se puede volver a correr mañana y
produce lo mismo, sin duplicados ni pérdidas.*

---

## Ideas clave

- La ingesta es **extraer y cargar** datos de una fuente a un destino; es el puente hacia
  el resto del ciclo de vida.
- Hay dos modos: **batch** (por lotes, programado) y **streaming** (tiempo real). **Batch
  cubre casi todo; streaming, solo lo que no puede esperar.**
- Las herramientas habituales son **conectores, scripts y APIs**.
- Antes de ingerir se deciden **frecuencia, volumen y fiabilidad** (con **idempotencia**).
- Los patrones más usados son **carga completa, incremental, CDC, pull y push**.
- Un pipeline recorre **extraer → transformar → cargar → verificar**.

## Glosario

| Término | Definición |
|---|---|
| Ingesta de datos | Proceso de tomar datos de una o varias fuentes y llevarlos a un destino. |
| Extracción | Tomar el dato de su origen. |
| Carga | Llevar el dato a su destino, en el formato acordado. |
| Batch | Ingesta que mueve los datos en bloques, a intervalos programados. |
| Streaming | Ingesta que mueve cada dato en cuanto se genera. |
| Conector | Pieza ya construida que lee de una fuente o escribe en un destino. |
| Script | Código propio que hace la extracción y la carga a medida. |
| API | Puerta de acceso estandarizada para leer datos de otro sistema. |
| Patrón de ingesta | Solución probada y reutilizable para un problema recurrente. |
| CDC | Captura de cambios: la fuente entrega solo lo que cambió. |
| Idempotencia | Repetir una carga no produce duplicados ni datos corrompidos. |

## Para repasar (autoevaluación)

1. ¿Cuál es la diferencia entre ingesta batch y streaming? Da un ejemplo de cada una.
2. Nombra las tres familias de herramientas de ingesta y di cuándo conviene cada una.
3. ¿Qué tres decisiones de diseño hay que tomar antes de ingerir?
4. Describe las cuatro etapas de un pipeline de ingesta y por qué la verificación importa.

## Referencias recomendadas

- Martin Kleppmann, *Diseño de aplicaciones con uso intensivo en datos* (Marcombo, 2022).
  Procesamiento por lotes, streaming y pipelines.
- Josep Curto, *Fundamentos de big data* (FUOC/UOC, acceso abierto en línea). Ingesta y
  procesamiento de datos.
- Luis Joyanes Aguilar, *Big Data: Análisis de grandes volúmenes de datos en organizaciones*
  (Alfaomega, 2013). Fuentes, tecnologías y ciclo de vida del dato.

## Presentaciones del bloque

- Sesión 2 — Ingesta: conceptos, métodos y herramientas: `presentacion_sesion2.html`
- Sesión 3 — Ingesta: patrones e implementación de pipelines: `presentacion_sesion3.html`
