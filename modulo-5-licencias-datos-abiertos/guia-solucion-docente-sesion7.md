# Guía de solución del docente — Taller Sesión 7

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 5 — Licencias de Datos y Datos Abiertos
**Taller:** `taller_sesion7_leer_y_aplicar_licencias.md`
**Uso:** respuestas modelo por licencia, ficha resuelta y rúbrica.

---

## 1. Respuestas por licencia

| Licencia | Qué permite | Condición | En una frase |
|---|---|---|---|
| **CC0 1.0** | Copiar, modificar, distribuir y usar con fines comerciales. | **Ninguna.** | "Puedo hacer cualquier cosa, sin pedir permiso ni citar." |
| **CC BY 4.0** | Compartir y adaptar con cualquier propósito, incluso comercial. | **Atribución.** | "Cualquier uso, con una sola condición: atribuir." |
| **ODC-By 1.0** | Compartir, crear y adaptar la base de datos con cualquier propósito. | **Atribución.** | "Compartir y adaptar la base, con la condición de atribuir." |

> Las tres son **abiertas**: permiten usar, reutilizar y redistribuir, y a lo sumo exigen atribución.
> Si el texto trajera "no comercial" (NC) o "solo educativo", **dejaría de ser abierta**.

---

## 2. Ficha de decisión — solución modelo (dataset AGETIC)

**Dataset:** `datos/encuesta_profesores_completo.csv` — AGETIC, *Encuesta Final-Profesores de
Inclusión Digital* (2019), publicado bajo **CC-BY**.

**1. Qué permite la licencia (CC BY):** compartir y adaptar el conjunto con cualquier propósito,
incluso comercial.

**2. Qué condición exige:** **atribución** — dar crédito a AGETIC, indicar la licencia y si hubo
cambios.

**3. Qué licencia pondríamos a *nuestro* dataset y por qué:** **CC BY** (o su equivalente **ODC-By**
por tratarse de una base de datos). Es coherente con la fuente original, que ya es CC-BY, y habilita
la reutilización exigiendo solo el crédito. CC0 también sería válido si se quiere renunciar a toda
condición; **CC BY-NC no**, porque deja de ser abierto.

**4. Qué datos NO publicaríamos:** los que, combinados, permiten **reidentificar** a una persona.

| Dato o columna | ¿Publicar? | Por qué |
|---|---|---|
| `a3` departamento + `a2` edad + `a1` sexo (microdato por fila) | No | La combinación puede identificar a un docente concreto; se publica **agregado**. |
| Cantidad de docentes por departamento (agregado) | Sí | Dato agregado; no identifica personas. |
| Datos de contacto o de salud, si existieran | No | Dato personal / sensible. |
| Respuestas abiertas que mencionen nombres | No (o se anonimizan) | Texto libre que puede contener datos personales. |

**5. Atribución lista para pegar:**

> Fuente: AGETIC, *Encuesta Final-Profesores de Inclusión Digital*, Datos Abiertos Bolivia
> (datos.gob.bo, 2019). Licencia CC-BY.

---

## 3. Errores frecuentes y cómo orientarlos

| Error | Cómo se detecta | Cómo orientar |
|---|---|---|
| Confundir "gratis" con "abierto" | Dicen "está en internet, es abierto" | Abierto exige permitir usar, reutilizar y redistribuir; "no comercial" rompe la apertura. |
| Elegir CC BY-NC "por seguridad" | Eligen la variante no comercial | Aclarar que NC deja de ser abierta; si el fin es abrir, usar CC BY. |
| No atribuir | No redactan el crédito | La atribución es **obligatoria** en CC BY y ODC-By; recordar el punto 5. |
| Publicar microdatos | Publican fila por fila | Mostrar la reidentificación (ciudad + edad + sexo); publicar **agregado**. |
| Confundir CC con ODC | Nombres parecidos | CC nació para obras; ODC para bases de datos; condiciones equivalentes. |
| "Bolivia tiene ley integral de datos" | Afirmación incorrecta | La protección es constitucional (CPE 21.2 y 130–131); la ley integral está en trámite. |

## 4. Rúbrica con niveles

| Nivel | Descriptor |
|---|---|
| **Insuficiente (1–59)** | No distingue "gratis" de "abierto"; no identifica la condición; publicaría datos personales. |
| **Suficiente (70–84)** | Identifica qué permite la licencia y su condición, pero no justifica la elección ni protege datos personales. |
| **Alto (85–94)** | Identifica permisos y condición, elige y justifica una licencia coherente con la fuente, y decide qué no publicar con criterio de agregación. |
| **Excelente (95–100)** | Todo lo anterior + atribución completa y correcta + justifica con el diccionario qué columnas podrían reidentificar a una persona. |

> Escala del módulo: 1–59 inicial · 60–69 muy parcial · 70–84 suficiente · 85–94 alto porcentaje ·
> 95–100 logro total esperado.
