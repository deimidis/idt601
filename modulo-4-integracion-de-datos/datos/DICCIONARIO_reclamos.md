# Diccionario de campos — `reclamos_crudos.csv`

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 4 — Integración de Datos
**Uso:** insumo del taller de la Sesión 6 (automatizar el pipeline).

El archivo tiene **7 columnas** y **24 filas de datos** (incluye filas repetidas a propósito).
Los encabezados ya vienen en palabras; los problemas están en los **valores**.

| Campo | Qué significa | Valores esperados (canónicos) | Problemas que trae el archivo |
|---|---|---|---|
| `id_reclamo` | Identificador del reclamo | `REC-0001` … | Hay ids repetidos porque hay filas duplicadas. |
| `fecha` | Fecha en que se registró el reclamo | `AAAA-MM-DD` | Formatos mezclados (`2026/09/01`) y una fecha imposible (`2026-13-05`). |
| `canal` | Vía por la que entró el reclamo | `Ventanilla`, `Teléfono`, `Formulario web` | Mayúsculas, minúsculas y tildes inconsistentes. |
| `tipo_reclamo` | Categoría del reclamo | `Bacheo`, `Alumbrado`, `Residuos` | Mayúsculas/minúsculas y espacios sobrantes. |
| `zona` | Macrodistrito donde ocurrió | `Macrodistrito Centro`, `Macrodistrito Cotahuma`, `Macrodistrito Max Paredes`, `Macrodistrito Periférica`, `Macrodistrito Sur` | Abreviaturas, variantes de escritura y celdas vacías. |
| `descripcion` | Detalle en texto libre | Texto | Algunas filas no traen descripción. |
| `estado` | Situación del reclamo | `Abierto`, `Cerrado`, `Anulado` | (Sin problemas; sirve de control.) |

## Reglas de limpieza (lo que el equipo debe lograr)

1. **Un canal, un nombre:** todas las variantes de canal quedan en una de las tres categorías.
2. **Un tipo, un nombre:** todas las variantes de `tipo_reclamo` quedan en una de las tres categorías.
3. **Una zona, un nombre:** todas las variantes quedan en uno de los cinco macrodistritos oficiales.
4. **Zona vacía = `SIN ZONA`:** no se borra la fila; se marca para no perder el reclamo.
5. **Fechas en un solo formato:** `AAAA-MM-DD`. La fecha imposible se marca como error y no se usa en los cálculos.
6. **Sin duplicados:** se eliminan las filas exactamente repetidas.
7. **No se pierde ningún reclamo válido:** el conteo de registros únicos se mantiene.
