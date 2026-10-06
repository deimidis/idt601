# Taller — Sesión 4: identificar los componentes de una arquitectura

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 3 — Arquitectura de Datos
**Duración:** 50 min de práctica (dentro de la sesión de 3 horas)
**Modalidad:** presencial o en línea (salas)
**Materiales:** `assets/esquema-arquitectura-sin-etiquetas.svg` (uno por equipo), hoja de trabajo, y `assets/esquema-arquitectura-resuelto.svg` (docente)

---

## Objetivo

Identificar y **nombrar los componentes** de una arquitectura sobre un esquema dado: distinguir dónde se guarda el dato de lo que lo transforma, y reconocer el catálogo y la gobernanza como **capas transversales**.

## Preparación previa

1. Imprimir o compartir `assets/esquema-arquitectura-sin-etiquetas.svg` (uno por equipo). El esquema tiene cajas rotuladas de forma genérica ("Caja A"…"Caja G") y dos bandas rotuladas "Capa 1" y "Capa 2". Las flechas **no** llevan rótulo: indican el flujo y no se etiquetan.
2. Preparar la hoja de trabajo (abajo) o pedir que la copien.
3. Tener a mano el esquema resuelto (`assets/esquema-arquitectura-resuelto.svg`) para la puesta en común. Los dos esquemas comparten la **misma geometría** (cajas, bandas y flechas en las mismas posiciones), así que se pueden superponer al comparar.

## Reparto del tiempo (50 min)

| Momento | Tiempo | Quién |
|---|---|---|
| Consigna y conformación de equipos (4 personas) | 10 min | Docente |
| Trabajo en equipos sobre el esquema | 30 min | Equipos |
| Puesta en común | 10 min | Todos |

## Pasos

1. **Etiquetar cada caja.** Cada equipo asigna a cada caja uno de los cuatro componentes (almacenamiento, procesamiento, catálogo, gobernanza) y, si aplica, identifica fuentes y uso. Las flechas describen el flujo, no un componente.
2. **Justificar cada elección.** Para cada etiqueta, escribir la razón en una frase (*"es almacenamiento porque aquí se guarda el dato"*).
3. **Describir el flujo.** Ordenar el recorrido de los datos de la fuente al uso: `Fuente → Almacenamiento → Procesamiento → Almacenamiento de análisis → Uso`.
4. **Detectar las capas transversales.** Indicar qué representan "Capa 1" y "Capa 2" y por qué no son una etapa del flujo.

## Hoja de trabajo

| Elemento del esquema | Componente asignado | Justificación |
|---|---|---|
| Caja A | | |
| Caja B | | |
| Caja C | | |
| Caja D | | |
| Caja E | | |
| Caja F | | |
| Caja G | | |
| Capa 1 | | |
| Capa 2 | | |

**Flujo de datos (de la fuente al uso):** ______________________________________________

**¿Qué representan la Capa 1 y la Capa 2 y por qué son transversales?** _________________

## Clave de corrección (para el docente)

| Elemento | Componente | Pista |
|---|---|---|
| Caja A | Fuente | Sistema de trámites. |
| Caja B | Fuente | Formulario web. |
| Caja C | Fuente | Lecturas de medidores. |
| Caja D | Almacenamiento | Base operacional (donde se registra el día a día). |
| Caja E | Procesamiento | Proceso nocturno (limpieza y unión). |
| Caja F | Almacenamiento | Data warehouse (almacenamiento de análisis). |
| Caja G | Uso | Reportes y análisis. |
| Capa 1 | Catálogo | Documenta qué datos existen y qué significan. |
| Capa 2 | Gobernanza | Define dueños, acceso y reglas. |

La versión resuelta está en `assets/esquema-arquitectura-resuelto.svg`.

## Puesta en común

Cada equipo expone **un componente y su justificación** (3–4 min en total). El docente contrasta las respuestas y refuerza dos ideas:
- **Almacenamiento ≠ procesamiento:** guardar no es transformar.
- **Catálogo y gobernanza son capas transversales**, no una caja más del flujo.

## Guía de corrección

Valorar que los equipos:
- Distingan almacenamiento (donde se guarda) de procesamiento (lo que transforma).
- Reconozcan las fuentes como el punto de nacimiento del dato y el uso como su destino.
- Identifiquen el catálogo y la gobernanza como capas que atraviesan todo el trayecto.

## Evaluación y entrega

| Criterio | Evidencia |
|---|---|
| Identifica los componentes correctamente | Hoja de trabajo completa. |
| Justifica cada elección | Frase de justificación por elemento. |
| Describe el flujo de la fuente al uso | Recorrido ordenado. |
| Reconoce las capas transversales | Explicación de la Capa 1 y la Capa 2. |

**Entrega:** hoja de trabajo con el esquema etiquetado, las justificaciones y la descripción del flujo.

## Variante en línea

Compartir el SVG por el chat de la sesión y pedir que cada equipo lo anote en una pizarra colaborativa (Google Jamboard, Miro o una hoja de cálculo compartida). La puesta en común se hace en la sala general, proyectando el esquema resuelto.
