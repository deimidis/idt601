# Fuente de datos — `reclamos_crudos.csv`

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 4 — Integración de Datos
**Uso:** insumo del taller de la Sesión 6.

## Origen

**Datos sintéticos con fines didácticos.** El archivo simula la exportación de los **tres sistemas
de reclamos** del caso institucional de la sesión 5 (ventanilla, teléfono y formulario web) de una
gobernación. No corresponde a ninguna persona real ni a una institución identificable.

Se eligió un dato sintético para **garantizar la continuidad narrativa** con el caso de la sesión 5 y
para poder **controlar los problemas de calidad** que el taller necesita enseñar (duplicados, zonas
mal escritas, fechas mezcladas, faltantes).

## Contenido

| Archivo | Qué es |
|---|---|
| `reclamos_crudos.csv` | Exportación **cruda** de los tres sistemas: 7 columnas × 24 filas (con duplicados, zonas inconsistentes, fechas mezcladas y faltantes). |
| `DICCIONARIO_reclamos.md` | Diccionario de campos, valores canónicos y reglas de limpieza. |

## Alternativa con dato abierto real

Si se prefiere trabajar con un dato **abierto real** (contexto del Bloque 5), puede usarse la
*Encuesta Final-Profesores de Inclusión Digital* de AGETIC (CC-BY) que ya traen los talleres 2-3:

- `modulo-2-ingesta-de-datos/datos/encuesta_profesores_recorte.csv`
- `modulo-2-ingesta-de-datos/datos/diccionario_recorte.md`

En ese caso, **cambian los nombres de campos** pero el taller es idéntico: limpiar una vez y diseñar el
flujo que corre solo. La ventaja del recorte de reclamos es que conecta con el caso de arquitectura
de la sesión anterior.

## Atribución (si se usa el dato de AGETIC)

> Fuente: AGETIC, *Encuesta Final-Profesores de Inclusión Digital*, Datos Abiertos Bolivia
> (datos.gob.bo, 2019). Licencia CC-BY.
