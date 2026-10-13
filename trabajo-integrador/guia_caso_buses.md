# Guía del docente — Caso de estudio "Recorridos de las líneas de buses"

**Uso:** acompañar `caso_estudio_buses.md`; incluye respuestas orientadoras, errores frecuentes y rúbrica.

---

## 1. Qué evalúa el ejercicio

No se evalúa una solución técnica: se evalúa la **capacidad de decidir con criterio** qué datos usar,
a qué granularidad y cómo guardarlos. Es un ejercicio de **alfabetización de datos** aplicado a la
gestión pública, no de programación.

## 2. Respuestas orientadoras (no únicas)

**Pregunta 1 — el análisis.** Cualquier pregunta de gestión es válida si es concreta y accionable. Ejemplos fuertes:
- "¿Qué líneas incumplen su frecuencia en hora pico y cuánto espera el usuario?" → decisión: reasignar buses.
- "¿Dónde se concentran las demoras?" → decisión: ajustar el trazado o las paradas.
- "¿Hay buses que reportan velocidad imposible (falla de GPS)?" → decisión: mantenimiento/calibración.

**Pregunta 2 — datos.** Combinaciones razonables:
- Para **frecuencia/espera**: telemetría (1) + resumen diario (2) + padrón de paradas (7).
- Para **control de cooperativas**: resumen diario (2) + venta de boletos (3) + hojas de taller (8).
- Para **atención al usuario**: reclamos (6) + encuestas (10).
- Se **descartan** con justificación las cámaras (5) y los semáforos (9) si no aportan a la pregunta, o los reclamos si el foco es operativo.

**Pregunta 3 — granularidad.**
- **Tiempo real**: para *alertas* (bus detenido, desvío, exceso de velocidad) y espera en parada.
- **Agregada (día/semana/mes)**: para *reportes de gestión*, cumplimiento de frecuencia y planificación. No hace falta tiempo real para un informe mensual.

**Pregunta 4 — cómo guardar.**
- Estructura: una tabla de **hechos** (registros de telemetría) y **dimensiones** (bus, línea, parada, fecha). Campos: `fecha_hora, id_bus, linea, lat, lon, velocidad, parada`.
- Formato: base de datos o tabla particionada por día para el feed; CSV/hoja para el resumen.
- Frecuencia: el feed se **anexa** continuamente; el resumen se **actualiza una vez al día**.

**Pregunta 5 — resultado.** Un indicador (cumplimiento %), una tabla por línea, un mapa de calor de demoras o una alerta automática.

## 3. Defectos esperados en los CSV (para discutir)

`recorridos_tiempo_real.csv`: `id_registro` duplicado; `timestamp` en dos formatos; `velocidad_kmh` 999 y −12; `linea` con cuatro variantes (`L1`, `Linea 1`, `L-1`, `linea2`); `placa`, `lon` y `pasajeros_estimados` faltantes; `estado_puerta` y `sentido` con valores en distinta caja.

`recorridos_resumen_diario.csv`: `fecha` en dos formatos; `viajes_realizados` mayor que los programados; `pasajeros_totales` y `cumplimiento_pct` faltantes; `recaudacion_bs` como texto ("Bs 4521.30") y negativa; fila duplicada; `km_recorridos` en 0; `demora_promedio_min` de 240.

## 4. Errores frecuentes y cómo orientarlos

| Error | Cómo se detecta | Cómo orientar |
|---|---|---|
| Querer usar **todo** | Eligen las 10 fuentes | Preguntar: "¿cuál de estas no cambia tu decisión? Descártala." |
| Confundir granularidad | Piden tiempo real para un informe mensual | Volver a la pregunta: ¿necesitas el instante o el total? |
| Ignorar la calidad | No mencionan los defectos | Pedir que revisen los CSV: duplicados, formatos, imposibles. |
| Publicar datos personales | Proponen usar el DNI del conductor | Recordar: agregar y anonimizar. |
| "Guardar todo en Excel" | Sin estructura | Preguntar por los campos y la frecuencia de actualización. |
| Pasarse de 2 páginas | Entrega extensa | Recordar que se evalúa claridad, no extensión. |

## 5. Rúbrica con niveles

| Nivel | Descriptor |
|---|---|
| **Insuficiente (1–59)** | No define una pregunta concreta; elige datos sin justificar; confunde granularidad; ignora la calidad y la privacidad. |
| **Suficiente (70–84)** | Pregunta clara y datos pertinentes; granularidad coherente; reconoce algún defecto de calidad; propone una forma de guardar básica. |
| **Alto (85–94)** | Todo lo anterior, más: descarta fuentes con argumento, distingue tiempo real de agregado, describe estructura y frecuencia, y menciona datos personales. |
| **Excelente (95–100)** | Todo lo anterior, más: conecta la elección de datos y de almacenamiento con la decisión pública, y propone cómo manejar los defectos de calidad (validaciones). |

> Escala del módulo: 1–59 inicial · 60–69 muy parcial · 70–84 suficiente · 85–94 alto porcentaje · 95–100 logro total.
