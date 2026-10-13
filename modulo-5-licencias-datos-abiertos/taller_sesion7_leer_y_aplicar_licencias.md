# Taller — Sesión 7: leer y aplicar una licencia

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 5 — Licencias de Datos y Datos Abiertos
**Duración:** 35 min de taller (5 de consigna + 20 de trabajo + 10 de puesta en común), dentro de la sesión de 3 horas
**Modalidad:** 100 % en línea (Zoom + salas) · **Modo A** (equipos) o **Modo B** (demostración del docente)
**Herramienta:** ninguna que instalar — lectura + documento compartido (Google Docs/Sheets o Word en línea). El entregable es la **ficha de decisión**.
**Insumos:** `datos/encuesta_profesores_completo.csv` + `datos/diccionario_recorte.md` + `datos/FUENTE.md` + `datos/licencias/{CC0-1.0,CC-BY-4.0,ODC-By-1.0}.md`

---

## Objetivo

Que cada equipo **lea el texto de una licencia abierta** y lo **aplique a un conjunto de datos público real**, decidiendo:

1. **Qué permite** la licencia.
2. **Qué condición** exige.
3. **Qué licencia** le pondrían a *su* propio conjunto de datos y por qué.
4. **Qué datos NO publicarían** para proteger datos personales.
5. **Cómo redactarían la atribución** (crédito a la fuente).

No se escribe código: se lee, se decide y se documenta en una ficha.

## Caso institucional

> *Una institución quiere publicar como **datos abiertos** una encuesta educativa que ya realizó. La
> encuesta existe, tiene miles de respuestas y está publicada por otra entidad bajo **CC-BY**. El
> equipo debe decidir qué licencia le pondría a su propia publicación y, sobre todo, **qué datos no
> puede publicar** para no exponer a las personas encuestadas.*

**Dataset de trabajo:** `datos/encuesta_profesores_completo.csv` — dato abierto real de **AGETIC**
(*Encuesta Final-Profesores de Inclusión Digital*, 2019), publicado bajo **CC-BY**.

> **Atribución:** Fuente: AGETIC, *Encuesta Final-Profesores de Inclusión Digital*, Datos Abiertos
> Bolivia (datos.gob.bo, 2019). Licencia CC-BY.

**Variantes por equipo** (todos usan el mismo dataset; cambia el énfasis):

- **Énfasis A — Uso y reutilización:** demostrar **qué permite** la licencia y cómo se puede reutilizar el dato.
- **Énfasis B — Atribución:** enfocarse en **cómo se cumple** la condición de citar la fuente correctamente.
- **Énfasis C — Privacidad:** decidir **qué datos no se publicarían** y con qué criterio (dato personal, sensible, agregación).

## Insumo y preparación previa (el día anterior)

1. Subir a Moodle (o pegar en el chat) estos archivos: `datos/encuesta_profesores_completo.csv`, `datos/diccionario_recorte.md`, `datos/FUENTE.md` y los tres textos de `datos/licencias/`.
2. Asignar a cada equipo una licencia (CC0, CC BY u ODC-By) y una variante (A/B/C).
3. Tener preparada una **ficha de decisión de ejemplo** (para el Modo B) usando la licencia CC-BY del dataset.
4. Tener listo un **documento compartido o pizarra** para pegar las fichas en la puesta en común.

## Reparto del tiempo (35 min, en línea)

| Momento | Tiempo | Quién |
|---|---|---|
| Consigna, conformación de equipos (3–4) y reparto de licencia/variante | 5 min | Docente |
| **Trabajo:** leer la licencia y completar la ficha de decisión | 20 min | Equipos |
| Puesta en común y entrega | 10 min | Todos |

---

## Pasos del trabajo (20 min)

**Consigna:** "Lean el texto de su licencia y completen la ficha de decisión. No se trata de memorizar: se trata de **decidir** y **justificar**."

1. **Leer la licencia asignada.** Identifiquen su nombre y su enlace canónico.
2. **Qué permite.** En una frase: ¿se puede copiar, modificar, usar con fines comerciales, redistribuir?
3. **Qué condición exige.** ¿Ninguna? ¿Atribuir? ¿Compartir igual? ¿Alguna restricción extra?
4. **Qué licencia pondrían a su dataset.** Con el dataset AGETIC en la mano, elijan una licencia y **justifiquen** por qué.
5. **Qué NO publicarían.** Revisen el diccionario (`diccionario_recorte.md`): ¿qué columnas podrían permitir reidentificar a una persona (por ejemplo, cruzar ciudad, edad y sexo)? ¿Qué se debe publicar solo **agregado**?
6. **Redactar la atribución.** Escriban el crédito completo, listo para pegar.

## Plantilla de entrega

Completar `plantilla-ficha-decision.md` (o su copia en el documento compartido). Debe tener:

1. **Qué permite la licencia.**
2. **Qué condición exige.**
3. **Qué licencia le pondrían a su dataset y por qué.**
4. **Qué datos NO publicarían** (y con qué criterio).
5. **Atribución lista para pegar.**

## Modo A — Trabajo de participantes (salas)

**Consigna (pegar en el chat):** "Lean la licencia y completen la ficha de decisión. Entregan la ficha. Guarden el enlace con permiso de edición."

- Roles del equipo: **coordinador** (cuida el tiempo) y **relator** (comparte pantalla).
- Rol del docente: **rotar por las salas cada 4–5 min**, destrabar sobre todo la **diferencia entre "gratis" y "abierto"** y la **identificación de datos personales**.

## Modo B — Demostración del docente (guion para compartir pantalla, 20 min)

Versión totalmente guiada. Los participantes siguen con la vista y anotan.

1. **Encuadre (2 min).** "Vamos a leer una licencia real y decidir cómo publicar un dato público sin exponer a nadie."
2. **Leer CC-BY (4 min).** Mostrar el texto de `datos/licencias/CC-BY-4.0.md`: cualquier uso, con **atribución**.
3. **Comparar (4 min).** Mostrar CC0 (ninguna condición) y ODC-By (atribución, para bases de datos) y ubicarlas en el espectro.
4. **Aplicar al dataset (5 min).** Decidir la licencia del dataset AGETIC: **CC BY**, coherente con la fuente, y redactar la atribución.
5. **Proteger (5 min).** Revisar el diccionario y decidir qué publicar **agregado** y qué **no** publicar (ciudad + edad + sexo podrían reidentificar; se agrupan).
6. **Cierre (2 min).** Repetir: abrir el **agregado**, proteger el **individual**, y **atribuir** siempre.

> **Consejo de pantalla:** hacerlo despacio, pensar en voz alta y mantener el texto de la licencia y el diccionario en ventanas al costado.

## Puesta en común (10 min)

El **relator** de cada equipo comparte pantalla (2 min por equipo; con muchos equipos, solo **un equipo por énfasis A/B/C**). Cuenta:

- **Qué licencia eligió** y por qué.
- **Qué dato decidió no publicar** y con qué criterio.

El docente contrasta las elecciones y refuerza las ideas fuerza: *sin licencia clara no hay reutilización segura; "gratis" no es "abierto"; y la apertura nunca expone datos personales.*

---

## Evaluación y entrega

| Criterio | Evidencia |
|---|---|
| Identifica qué permite la licencia | Punto 1 de la ficha |
| Identifica la condición | Punto 2 de la ficha |
| Elige una licencia y la justifica | Punto 3, coherente con la fuente del dataset |
| Aplica criterios de protección de datos personales | Punto 4, con anonimización/agregación |
| Redacta la atribución | Punto 5, con la fuente AGETIC y la licencia CC-BY |
| Coherencia con su énfasis | La ficha responde a la variante A/B/C asignada |

**Entrega por equipo:** la **ficha de decisión** completada (o el enlace del documento). Se cierra **dentro de la sesión**.

## Guía de corrección / rúbrica con niveles

| Nivel | A quién corresponde |
|---|---|
| **Insuficiente** | No distingue "gratis" de "abierto"; no identifica la condición; publicaría datos personales. |
| **Suficiente** | Identifica qué permite la licencia y su condición, pero no justifica la elección ni protege datos personales. |
| **Alto** | Identifica permisos y condición, elige y justifica una licencia coherente, y decide qué no publicar con criterio de agregación. |
| **Excelente** | Todo lo anterior, más: redacta una atribución completa y correcta y justifica con el diccionario qué columnas podrían reidentificar a una persona. |

> Escala del módulo (Plan de Clases): 1–59 inicial · 60–69 muy parcial · 70–84 suficiente · 85–94 alto porcentaje · 95–100 logro total.

## Problemas frecuentes (y qué hacer)

| Síntoma | Causa | Solución |
|---|---|---|
| "Está gratis, entonces es abierto" | Se confunde precio con licencia | Recordar: abierto exige permitir usar, reutilizar y redistribuir; "no comercial" no es abierto. |
| Eligen CC BY-NC "porque es una institución pública" | Creen que no comercial es más seguro | Aclarar que NC deja de ser abierto; si el fin es abrir, usar CC BY. |
| No atribuyen | Creen que la fuente ya es conocida | Revisar el punto 5: la atribución es obligatoria en CC BY y ODC-By. |
| Publicarían microdatos "porque son anónimos" | No ven la reidentificación | Mostrar que cruzar ciudad + edad + sexo puede identificar a una persona; agregar. |
| Confunden CC con ODC | Nombres parecidos | CC nació para obras; ODC para bases de datos; las condiciones se corresponden. |

## Plan B (si falla la conexión o el acceso)

- **Sin salas:** cada equipo trabaja en un documento compartido coordinado por el chat.
- **Sin poder abrir los textos:** el docente comparte pantalla con la licencia y el diccionario, y los equipos completan la ficha.
- **Sin audio:** la consigna y la puesta en común se hacen por chat y pantalla compartida.

---

## Nota para el docente

- Este taller **reemplaza** el "Análisis guiado" de 15 min del plan de la sesión 7, que era inviable con una actividad de análisis de datos personales.
- Usa un **dato abierto real** (AGETIC, CC-BY) como insumo: permite discutir licencia, atribución, reutilización y datos personales en un solo objeto.
- La **solución modelo** (respuestas por licencia, ficha resuelta y rúbrica) está en `guia-solucion-docente-sesion7.md`.
