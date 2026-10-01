# Taller — Inventario de datos (online)

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 1 · Sesión 1
**Modalidad:** online sincrónica — videoconferencia con salas de trabajo
**Duración:** 30 min (dentro de la Sesión 1)
**Equipos:** 3–4 personas por sala
**Planilla:** colaborativa en línea (Google Sheets / Excel en línea)

---

## Objetivo

Levantar un **inventario de datos** de un caso institucional, identificando para cada dato su **fuente**, su **tipo** (estructurado, semiestructurado o no estructurado), su **formato**, su **frecuencia**, su **responsable** y las **observaciones de calidad** detectadas.

## Materiales

- Caso de estudio (`taller_sesion1_caso_estudio.md`): se comparte el texto o el enlace por el **chat** de la videoconferencia.
- Planilla colaborativa en línea, creada a partir de `taller_sesion1_inventario.csv` (una hoja por equipo, o una hoja con una columna de equipo).
- Pizarra digital colaborativa (Miro, Jamboard, etc.) — **opcional**, para la puesta en común.
- Un dispositivo con micrófono y, si es posible, cámara por persona.

## Preparación (antes de la sesión)

1. Subí `taller_sesion1_inventario.csv` a una planilla en línea (Google Sheets / Excel en línea) y dejá el enlace con **permiso de edición** para quien lo tenga.
2. Definí los equipos (3–4 personas) y creá una **sala** por equipo.
3. Tené a mano los enlaces para pegar en el chat: **caso**, **planilla** y (opcional) **pizarra**.

## Pasos del taller (30 min)

### 1. Consigna (3 min)

- Pegá en el chat el enlace del **caso** y de la **planilla**.
- Explicá la consigna y el **entregable**: la planilla completada.
- Recordá los roles de cada equipo: **coordinador** (ordena el trabajo y cuida el tiempo) y **relator** (comparte pantalla en la puesta en común).

### 2. Trabajo en salas (18 min)

1. **Leer el caso** y detectar todos los datos que la institución maneja.
2. **Por cada dato**, completar una fila en la planilla con:
   - **Nombre del dato:** qué dato es.
   - **Fuente:** de dónde proviene (sistema interno, web, sensores, redes sociales, encuesta, papel).
   - **Tipo:** estructurado, semiestructurado o no estructurado.
   - **Formato:** en qué se guarda (tabla/BD, CSV, JSON, imagen, PDF, video, texto).
   - **Frecuencia:** cada cuánto se genera o actualiza (diaria, mensual, continua, a demanda).
   - **Responsable:** qué área o persona lo produce o administra.
   - **Observación de calidad:** anotar si hay problemas de completitud, exactitud o actualidad.
3. **Detectar al menos un problema de calidad** por equipo y proponer una mejora concreta.

> **Ritmo sugerido:** si el tiempo aprieta, completen primero 5–6 datos y prioricen detectar el problema de calidad.

### 3. Puesta en común (9 min)

- El **relator** de cada equipo **comparte pantalla** con su planilla y cuenta: un dato **bien inventariado** y un **problema de calidad** detectado.
- El docente cierra reforzando los tres lentes: **completitud, exactitud y actualidad**.

## Rol del docente durante las salas

- **Rotar por las salas** cada 4–5 minutos para destrabar dudas de clasificación.
- Avisar por el **chat** el tiempo restante (quedan 10', quedan 5').
- Si un equipo se queda sin audio, continuar por el **chat** de la sala.

## Estructura de la planilla

La planilla (base `taller_sesion1_inventario.csv`) tiene estas columnas:

| Columna | Descripción |
|---|---|
| `nombre_del_dato` | Identificador breve del dato |
| `fuente` | Origen del dato |
| `tipo` | estructurado / semiestructurado / no estructurado |
| `formato` | Tabla (BD), CSV, JSON, imagen, PDF, video, texto |
| `frecuencia` | diaria, semanal, mensual, continua, a demanda |
| `responsable` | Área o persona responsable |
| `observacion_calidad` | Problemas de completitud / exactitud / actualidad |

## Entregable

La planilla colaborativa completada por el equipo. Se entrega el **enlace** (con permiso de edición) o una **exportación CSV** subida al chat o a la tarea del aula virtual.

Se valora que cada dato tenga **todos los campos llenos** y que las observaciones de calidad sean **específicas** (no genéricas).

## Guía de corrección / criterios de evaluación

| Nivel | Descripción |
|---|---|
| Insuficiente | Planilla incompleta o con tipos mal clasificados. |
| Suficiente | La mayoría de los datos inventariados; tipos correctos. |
| Alto | Inventario completo, tipos y fuentes correctos, y al menos un problema de calidad bien identificado. |
| Excelente | Todo lo anterior, más una mejora concreta y realista para el problema de calidad. |

> Nota para el docente: el caso está diseñado para que aparezcan los tres tipos de datos y al menos dos problemas de calidad evidentes (padrón desactualizado y formulario con datos faltantes).

## Plan B (si falla la conexión)

- **Sin salas:** cada equipo trabaja en un documento o pizarra compartida coordinado por el chat.
- **Sin planilla en línea:** cada equipo completa un CSV local y lo comparte al final.
- **Sin audio:** la consigna y la puesta en común se hacen por chat y pantalla compartida.

---

## Clave de respuestas (para el docente)

| # | Dato | Fuente | Tipo |
|---|---|---|---|
| 1 | Reclamos en sistema de trámites | Sistema interno | Estructurado |
| 2 | Reclamos del formulario web | Web y formularios | Semiestructurado |
| 3 | Comentarios en redes sociales | Redes sociales | No estructurado |
| 4 | Registro de cámaras de tránsito | Sensores y dispositivos | No estructurado |
| 5 | Encuestas de satisfacción | Encuestas | Semiestructurado (combina estructurado + no estructurado) |
| 6 | Lectura de medidores de agua | Sensores y dispositivos | Estructurado |
| 7 | Recaudación diaria de impuestos | Sistema interno | Estructurado |
| 8 | Padrón de contribuyentes | Sistema interno | Estructurado |
| 9 | Actas escaneadas | Papel digitalizado | No estructurado |
| 10 | Registro de atenciones en papel | Papel | No estructurado |

**Problemas de calidad esperados:**

- **Actualidad:** el padrón de contribuyentes sin actualizar en más de tres años (dato #8).
- **Completitud:** el formulario web con descripciones vacías (dato #2) y los reclamos que a veces no registran la zona (dato #1).
- **Exactitud/completitud:** el registro en papel no digitalizado (dato #10), donde la información puede perderse o transcribirse con errores.

**Respuestas a las preguntas guía:**

1. Estructurados: #1, #6, #7, #8. Semiestructurados: #2, #5. No estructurados: #3, #4, #9, #10.
2. Combinan tipos: #5 (opciones estructuradas + comentario no estructurado) y #2 (JSON semiestructurado + descripción en texto libre).
3. Problemas de calidad: actualidad (#8), completitud (#1 y #2), y riesgo de exactitud por no digitalización (#10).
4. Ejemplo de decisión: con un padrón actualizado y reclamos con zona, la Dirección podría decidir dónde reforzar cuadrillas o ventanillas según la demanda real.
