# Sesión 7 — Licencias de datos y datos abiertos

**Módulo:** Ingeniería de Datos (IDT 601)
**Bloque:** 5 — Licencias de Datos y Datos Abiertos
**Duración:** 3 horas (180 min)
**Público:** Profesionales no especializados en ingeniería de datos

---

## Objetivos de la sesión

- Comprender qué es una licencia de datos y por qué importa para el uso y la reutilización.
- Reconocer las licencias abiertas y el movimiento de datos abiertos.
- Distinguir con claridad datos abiertos de datos personales y aplicar criterios de protección.
- Conocer la regulación boliviana en materia de datos abiertos y licencias.
- Leer una licencia abierta y decidir cómo aplicarla a un conjunto de datos público.

## Ideas clave (qué debe quedar al final)

1. Una **licencia** es un permiso formal que dice qué se puede y qué no se puede hacer con un conjunto de datos; sin licencia clara, los datos no se pueden reutilizar con seguridad.
2. Los datos "**abiertos**" son los que cualquiera puede usar, reutilizar y redistribuir, con pocas o ninguna restricción, idealmente indicando la fuente.
3. **Abierto no significa "sin reglas"**: hay licencias que permiten todo (CC0) y otras que exigen atribución (CC BY); elegir bien protege al autor y habilita la reutilización.
4. **Datos abiertos ≠ datos personales**: la apertura tiene límites claros en la privacidad y en los datos que pueden identificar a personas.
5. Bolivia cuenta con un **marco normativo propio** (Ley N.º 164, D.S. 1793, D.S. 2514, D.S. 3251, D.S. 5340 y D.S. 5468, y lineamientos de AGETIC) que impulsa el gobierno electrónico, los estándares abiertos y los datos abiertos del Estado.

## Cronograma sugerido (180 min)

| Bloque | Duración | Qué ocurre |
|---|---|---|
| Apertura y encuadre | 10 min | Bienvenida, contexto del Bloque 5 y preguntas disparadoras. |
| Licencias de datos | 25 min | Concepto, espectro y rol en el uso y la reutilización. |
| Licencias abiertas | 30 min | Creative Commons, Open Data Commons y la definición de "abierto". |
| Pausa | 10 min | Receso. |
| Datos abiertos: principios y beneficios | 20 min | El movimiento de datos abiertos, principios, beneficios y portales. |
| Límites y protección de datos personales | 25 min | Datos personales, anonimización/agregación y protección en Bolivia. |
| Regulación en Bolivia | 15 min | Línea de tiempo e instrumentos normativos. |
| **Taller: leer y aplicar una licencia** | 35 min | Actividad integrada con insumos y entregable (ficha de decisión). |
| Cierre y preguntas | 10 min | Síntesis, dudas y puente a la próxima sesión. |

> **Ajuste de tiempos:** el bloque "Análisis guiado" de 15 min se reemplaza por un **taller de 35 min** con insumos; los 20 min extra se recuperan recortando "Licencias de datos" (30→25), "Licencias abiertas" (35→30), "Datos abiertos" (25→20) y "Regulación" (25→15). El bloque "Límites" sube de 20 a 25 para desarrollar la protección de datos personales.

---

## Apertura y encuadre (10 min)

- Presentar el **módulo IDT 601** y ubicar el **Bloque 5 — Licencias de Datos y Datos Abiertos** como la dimensión **legal y de gobernanza** de los datos: no basta con tener datos, hay que saber **bajo qué condiciones** se pueden compartir y reutilizar.
- Recuperar la dimensión técnica ya trabajada en el módulo: *"Ya sabemos de dónde salen los datos y cómo medir su calidad. Ahora: ¿quién puede usarlos? ¿qué dice la ley? ¿qué podemos publicar?"*
- Preguntas de la sesión: **¿qué es una licencia de datos?**, **¿qué es un dato abierto?** y **¿qué dice Bolivia al respecto?**
- Palabras clave: **licencia, abierto, reutilización, atribución, dominio público, transparencia**.

> Momento de enganche: preguntar al grupo *"¿alguien sabe si puede reutilizar una base de datos que encontró en internet o en el sitio de otra institución? ¿Sabe qué está permitido?"* — casi nadie lo sabe, y eso es exactamente el problema que esta sesión resuelve.

---

## Licencias de datos (25 min)

Explicar que una **licencia** es un permiso formal que establece los derechos y obligaciones de quien usa un conjunto de datos. Su función central es **dar certeza**: tanto al autor (qué protege) como al usuario (qué puede hacer sin arriesgarse).

### Concepto y por qué importa

- Un conjunto de datos **sin licencia** es jurídicamente ambiguo: nadie sabe si puede copiarlo, mezclarlo o publicarlo.
- La licencia **reduce esa incertidumbre** y habilita la reutilización.
- **Ejemplo cercano:** una institución pública publica su presupuesto ejecutado en un PDF. Sin una nota de licencia, otra entidad o un periodista no sabe si puede redistribuirlo o crear un reporte con esos datos.

### Tipos de licencias (un espectro)

| Nivel | Qué permite | Ejemplo |
|---|---|---|
| Todos los derechos reservados | Nada, salvo permiso expreso | Un informe con "© todos los derechos reservados" |
| Licencias con condiciones | Usar bajo reglas (citar, no comercial) | CC BY-NC: uso no comercial |
| Licencias abiertas | Usar, reutilizar y redistribuir | CC BY: solo exige atribución |
| Dominio público | Todo, sin condiciones | CC0 / ODC PDDL |

**Idea para la pizarra:** dibujar una flecha de "más cerrado" a "más abierto" con estos cuatro puntos. Si no se elige licencia, por defecto se cae en "todos los derechos reservados".

### El rol en el uso y la reutilización

- La licencia es el **puente** entre "tener datos" y "usar datos ajenos con seguridad".
- Para el sector público: licencias claras permiten que **ciudadanos, empresas, periodistas y otras instituciones** construyan sobre los datos del Estado.

---

## Licencias abiertas (30 min)

### Creative Commons (CC)

- **CC0** — renuncia total de derechos; equivale al dominio público.
- **CC BY** — permite cualquier uso con la única condición de **atribuir**.
- Otras variantes (CC BY-SA, CC BY-NC, etc.) agregan condiciones y dejan de ser plenamente "abiertas" en sentido estricto.

### Open Data Commons (ODC)

| Licencia | Condición | Equivalente CC |
|---|---|---|
| ODC PDDL | Dominio público | CC0 |
| ODC-By | Atribución obligatoria | CC BY |
| ODbL | Atribución + compartir igual | CC BY-SA |

### La definición de "abierto"

- Un dato es **abierto** si cualquiera puede: **usarlo, reutilizarlo y redistribuirlo**.
- Condiciones aceptadas: a lo sumo, **atribución** y **compartir igual**.
- Restricciones como "solo uso no comercial" o "solo fines educativos" hacen que un dato **deje de ser abierto**.

**Momento de reflexión:** mostrar que "gratis" no es lo mismo que "abierto". Un dato puede verse sin costo pero estar prohibido de redistribuir.

---

## Pausa (10 min)

---

## Datos abiertos: principios y beneficios (20 min)

### El movimiento de datos abiertos

- Surge de la idea de que los datos producidos con **fondos públicos** deben volver a la ciudadanía en formatos reutilizables.
- **Principios:** abiertos por defecto · oportunos y completos · accesibles y usables (formatos legibles por máquina, no solo PDF) · interoperables y comparables · para la mejora y la innovación.

### Beneficios

1. **Transparencia** — la ciudadanía puede verificar el uso de los recursos públicos.
2. **Reutilización** — otros actores construyen servicios y análisis sobre los datos.
3. **Innovación** — surgen aplicaciones y emprendimientos a partir de datos abiertos.
4. **Control social** — organizaciones y prensa vigilan la gestión pública con datos.

**Portales:** `datos.gob.bo` (portal histórico de datos abiertos del Estado) y `gob.bo` (sección "Datos abiertos del Estado").

---

## Límites y protección de datos personales (25 min)

- **Datos personales** son los que identifican o hacen identificable a una persona (nombre, DNI, teléfono, ubicación, salud).
- La apertura **nunca** implica publicar datos personales: se aplican **anonimización** y **agregación**.
- Regla práctica: **abrir el dato agregado, proteger el dato individual**.
  - *Sí se publica:* cantidad de beneficiarios de un programa por municipio.
  - *No se publica:* el listado con DNI y domicilio de esos beneficiarios.

| Escenario | ¿Publicar? | Por qué |
|---|---|---|
| Cantidad de beneficiarios por municipio | Sí | Dato agregado, no identifica personas |
| Listado de beneficiarios con DNI y domicilio | No | Dato personal identificable |
| Presupuesto ejecutado por programa | Sí | Información pública de gestión |
| Historia clínica individual de un paciente | No | Dato sensible; requiere protección |

### La protección de datos personales en Bolivia

- La protección hoy es **constitucional**: la **CPE art. 21.2** reconoce los derechos a la intimidad, privacidad, honor y propia imagen, y la **CPE art. 130–131** establece la **acción de protección de la privacidad** (antes hábeas data), que permite acceder, rectificar y eliminar datos de registros públicos o privados.
- Bolivia **no cuenta todavía con una ley integral de datos personales**; hay **proyectos en trámite** (un proyecto de ley de acceso a la información pública aprobado por el Senado en 2026 y remitido a Diputados, y un anteproyecto de AGETIC).
- Mensaje: *"Los datos abiertos y la privacidad no se oponen; conviven si se aplica anonimización responsable."*

---

## Regulación en Bolivia (15 min)

Presentar el marco normativo boliviano, sin inventar artículos; citar las normas por su número y objeto.

| Año | Norma | Aporte principal |
|---|---|---|
| 2011 | Ley N.º 164 | Ley marco de TIC y gobierno electrónico |
| 2013 | D.S. 1793 | Gobierno electrónico, software libre y estándares abiertos |
| 2015 | D.S. 2514 | Crea la AGETIC |
| 2017 | D.S. 3251 | Planes de gobierno electrónico e interoperabilidad |
| 2025 | D.S. 5340 | Plataforma gob.bo y "Datos abiertos del Estado" |
| 2025 | D.S. 5468 | Actualiza el Plan de Gobierno Electrónico (hasta 2028) y el de Software Libre y Estándares Abiertos |

**Instrumentos:**

- **Lineamientos de Datos Abiertos de AGETIC** — guías técnicas del órgano rector para publicar con estándares, metadatos y licencias adecuadas.
- **LPG-Bolivia (Licencia Pública General de Bolivia)** — licencia de **software libre** del Estado (aplica a software, no a datos; para datos se usan CC u ODC).

**Idea para la pizarra:** una línea de tiempo 2011 → 2025. Destacar que la política va **de los estándares abiertos (2013) a los datos abiertos consolidados (2025)**.

---

## Taller: leer y aplicar una licencia (35 min)

> Reemplaza el "Análisis guiado" de 15 min. El taller completo, con insumos, reparto, plantilla y rúbrica, está en `taller_sesion7_leer_y_aplicar_licencias.md`.

**Objetivo:** que los participantes lean una licencia abierta y la apliquen a un conjunto de datos público real.

**Insumos:** `datos/encuesta_profesores_completo.csv` (AGETIC, CC-BY) + `datos/diccionario_recorte.md` + `datos/FUENTE.md` + textos de licencia `datos/licencias/{CC0-1.0,CC-BY-4.0,ODC-By-1.0}.md`.

**Reparto:** consigna y equipos (5 min) + trabajo en equipos de 3–4 (20 min) + puesta en común (10 min).

**Entregable:** **ficha de decisión** (`plantilla-ficha-decision.md`), cerrada en la sesión: qué permite la licencia, qué condición exige, qué licencia pondrían a *su* dataset y por qué, y qué datos **no** publicarían.

**Guía de corrección:** valorar la correcta identificación de la condición de cada licencia y el criterio para excluir datos personales (anonimización).

**Criterios de evaluación:** identificación correcta de licencias, de la normativa boliviana aplicable y de los límites con datos personales.

---

## Cierre y preguntas (10 min)

- Síntesis con el grupo: releer los cuatro puntos del espectro de licencias.
- Reforzar la idea central: *"Publicar no alcanza; hay que publicar bajo una licencia clara, abierta y protegiendo los datos personales."*
- Anticipar la próxima sesión: *"El siguiente paso del módulo es la inteligencia artificial: empezamos por su historia y por las redes neuronales."*
- Espacio de preguntas y dudas.

---

## Recursos

- Presentación `presentacion_sesion7.html` y deck `deck-sesion-07.html`.
- Textos de las licencias abiertas para el taller: `datos/licencias/` (CC0, CC BY, ODC-By).
- Dataset AGETIC `datos/encuesta_profesores_completo.csv` (CC-BY) con diccionario y ficha de fuente.
- Portales de datos abiertos: `datos.gob.bo` y `gob.bo`.
- Pizarra o pizarra digital para la línea de tiempo normativa.

## Evaluación de la sesión

| Criterio | Evidencia |
|---|---|
| Explica qué es una licencia de datos y por qué importa | Participación en el enganche y en el bloque de licencias |
| Distingue licencias abiertas y sus condiciones | Respuestas en el taller de licencias |
| Identifica la normativa boliviana aplicable | Aportes en el bloque de regulación y en la línea de tiempo |
| Aplica criterios de protección de datos personales | Justificación en la ficha de decisión del taller |
| Usa la terminología adecuada | Precisión de términos en la puesta en común |
