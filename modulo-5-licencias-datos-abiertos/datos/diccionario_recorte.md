# Diccionario del recorte — `encuesta_profesores_recorte.csv`

17 columnas tomadas de la encuesta de AGETIC. Los **encabezados del CSV siguen siendo los códigos
originales** (`a0`, `a1`, …): parte de la práctica es **renombrarlos** con su pregunta real.

| Código | Pregunta / significado | Valores observados | Notas |
|---|---|---|---|
| `a0` | ¿Fue parte del proyecto Inclusión Digital? | `Sí` / `No` | 848 Sí, 23 No |
| `a1` | ¿Cuál es su sexo? | `Femenino` / `Masculino` | |
| `a2` | ¿Cuántos años tiene? | número (20–78) | Convertir a número |
| `a3` | ¿En qué departamento está la unidad educativa? | texto (9 departamentos) | |
| `a4` | ¿En qué ciudad está la unidad educativa? | texto | |
| `b2` | Años de experiencia como profesor (toda la vida laboral) | número | |
| `b3` | Tiempo como profesor de la unidad educativa actual | `Menos de un año` / `Más de un año` | |
| `b4` | Años como profesor de la unidad educativa actual | número / `NA` | 85 `NA` (cuando `b3` = "Menos de un año") |
| `b8` | ¿Pasó algún curso o capacitación en uso de tecnologías en aula? | `Sí` / `No` | |
| `c3` | ¿Cuántas computadoras (escritorio o portátil) tiene? | número / `NA` | 18 `NA` |
| `d2` | ¿El celular que tiene es inteligente (smartphone)? | `Sí` / `No` / `N/A` | 7 `N/A` |
| `e7` | ¿Qué tipo de conexión usa con mayor frecuencia? | `Internet fijo` / `Internet móvil` / vacío | 115 vacíos |
| `e8` | ¿De qué lugar accede a internet con mayor frecuencia? | `Casa`, `Colegio`, `Otro`, … / vacío | 115 vacíos |
| `g1` | ¿Qué sistema operativo usa en su computadora? | `Windows` / `Linux` / `Otro` | 838 Windows |
| `g21` | Autocalificación (1–5) en uso de software libre | `1`…`5` / `NA` | 261 `NA` |
| `h1` | ¿Sabe qué son las licencias libres? | `Sí` / `No` | |
| `h3` | ¿Sabe qué son los datos abiertos? | `Sí` / `No` | |

## Valores "sucios" que la práctica debe resolver

- `NA` y `N/A` mezclados para "sin dato" (columnas `b4`, `c3`, `d2`, `g21`).
- **Celdas vacías** usadas como "no responde" (columnas `e7`, `e8`).
- Números guardados como **texto** (columnas `a2`, `b2`, `b4`, `c3`, `g21`).
- Encabezados que **no dicen nada** hasta consultar este diccionario.

> Fuente: AGETIC, *Encuesta Final-Profesores de Inclusión Digital*, Datos Abiertos Bolivia (datos.gob.bo, 2019). Licencia CC-BY.
