# Caso de estudio — Recorridos de las líneas de buses

**Repartición:** Dirección de Movilidad y Transporte — Gobierno Autónomo Municipal de Villa Nueva
**Módulos:** repaso de los Bloques 1 a 4 (datos, ingesta, arquitectura e integración)
**Modalidad:** individual o en parejas · **entrega:** un documento de **máximo 2 páginas**

> El municipio y las líneas son ficticios, pero los tipos de datos y los problemas representan
> situaciones típicas de la gestión pública del transporte urbano.

---

## Contexto

El Gobierno Autónomo Municipal de Villa Nueva supervisa **30 líneas de buses** operadas por varias
cooperativas. La **Dirección de Movilidad y Transporte** quiere tomar mejores decisiones sobre
frecuencias, paradas y control de las empresas, pero hoy **no tiene claro qué hacer con la enorme
cantidad de datos** que recibe: parte llega **en tiempo real** y parte **una vez al día**.

La Dirección te pidió (como parte del equipo de datos) que prepares **una breve propuesta de
análisis**: no hay que programar ni construir nada; hay que **decidir** y **justificar**.

---

## Los datos que recibe la alcaldía

La Dirección recibe información de varias fuentes a la vez. No todas son útiles para cualquier
análisis: **elegir bien es parte del ejercicio**.

| # | Fuente | Qué trae | Frecuencia |
|---|---|---|---|
| 1 | **Telemetría GPS de los buses** | posición, velocidad, apertura de puertas, bus y línea, por registro | tiempo real (cada 15–30 s) |
| 2 | **Resumen diario del recorrido** | viajes programados y realizados, pasajeros, km, recaudación, demora, cumplimiento | diaria |
| 3 | **Venta de boletos** | boletos por línea, turno y tipo (normal, escolar) | por viaje |
| 4 | **Conteo de pasajeros en paradas** | personas que suben/bajan en paradas principales | cada 5 min |
| 5 | **Cámaras de tránsito** | video continuo en cruces principales | continuo |
| 6 | **Reclamos de usuarios** | texto libre por WhatsApp, formulario web y redes sociales | continua |
| 7 | **Padrón de paradas y recorridos** | paradas oficiales, trazado y horarios de cada línea | casi nunca cambia |
| 8 | **Hojas de taller** | mantenimiento y fallas de cada bus (en papel, escaneadas) | por evento |
| 9 | **Sensores de semáforo** | estado de semáforos en corredores principales | tiempo real |
| 10 | **Encuestas de satisfacción** | calificación 1–5 y comentario abierto | mensual |

**Insumos de ejemplo** (datos ficticios para trabajar): en `datos/` hay dos archivos que representan
lo que llega por las fuentes 1 y 2:

- `datos/recorridos_tiempo_real.csv` — el **feed crudo** de telemetría (un registro por lectura).
- `datos/recorridos_resumen_diario.csv` — el **resumen diario** por línea.

> Los archivos traen **defectos a propósito** (duplicados, fechas en distinto formato, valores
> imposibles, etiquetas inconsistentes y datos faltantes). Reconocerlos es parte del trabajo.

---

## Qué tienes que entregar

Un documento de **máximo 2 páginas** (texto, tablas o diagramas simples; sin código) con:

1. **El análisis que propondrías.** Una pregunta concreta de gestión pública y qué decisión ayudaría a tomar.
   - *Ejemplos:* "¿qué líneas incumplen sistemáticamente su frecuencia en hora pico?"; "¿dónde conviene mover una parada para reducir la espera?".
2. **Qué datos usarías** de todos los que recibe la alcaldía (tabla de arriba) y **por qué** elegiste esos y descartaste los demás.
3. **La granularidad que elegirías:** datos **en tiempo real** o datos **por día / semana / mes**. Justifica según la decisión que quieres apoyar.
4. **Cómo los guardarías:** qué estructura tendría el dato (qué campos/tabla), en qué formato (CSV, base de datos, hoja de cálculo…) y con qué frecuencia se actualizaría.
5. **Qué esperarías obtener:** cómo se vería el resultado (una tabla, un indicador, un mapa, una alerta).

**Formato:** Markdown, PDF o documento de texto. Extensión **máxima: 2 páginas**. Se valora la
claridad y la justificación, no la cantidad.

---

## Preguntas guía

1. ¿Tu pregunta necesita datos **al instante** o basta con un **resumen diario/mensual**? ¿Por qué?
2. De las 10 fuentes, ¿cuáles son **estructuradas**, **semiestructuradas** o **no estructuradas**?
3. ¿Qué **problemas de calidad** ves en los CSV de ejemplo (completitud, exactitud, consistencia, actualidad)?
4. ¿Qué datos son **personales** (de los pasajeros o de los conductores) y cómo los protegerías?
5. ¿Cómo **guardarías** el dato para que sea barato de consultar para tu análisis y confiable?
6. ¿Qué harías si la cooperativa entrega los resúmenes **con un día de retraso** o con errores?

---

## Cómo se evalúa (resumen)

| Criterio | Qué se observa |
|---|---|
| Claridad de la pregunta | Una pregunta concreta y una decisión pública asociada |
| Elección de datos | Justifica qué fuentes usa y cuáles descarta |
| Granularidad | Tiempo real o agregada, coherente con la pregunta |
| Cómo lo guarda | Estructura, formato y frecuencia razonables |
| Calidad y privacidad | Reconoce defectos y datos personales |
| Extensión y claridad | ≤2 páginas, sin código, ordenado |

> La rúbrica con niveles está en `guia_caso_buses.md`.
