# Guía de solución del docente — Taller Sesión 6

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 4 — Integración de Datos
**Taller:** `taller_sesion6_automatizar_pipeline.md`
**Uso:** respuestas modelo de la Parte 1 y la Parte 2, flujos por variante y rúbrica.

---

## Parte 1 — Limpieza resuelta (valores exactos)

| Comprobación | Esperado | Fórmula de control (Google Sheets) |
|---|---|---|
| Filas crudas | **24** | `=CONTARA(crudo!A2:A)` |
| Duplicados eliminados | **2** | diferencia entre crudo y limpio |
| Filas limpias | **22** | `=CONTARA(A2:A)` |
| Reclamos `SIN ZONA` | **1** | `=CONTAR.SI(E2:E;"SIN ZONA")` |
| Fechas inválidas | **1** | `=CONTAR.SI(B2:B;"2026-13-05")` |
| Descripciones vacías | **4** | `=CONTAR.BLANCO(F2:F)` |
| Ventanilla / Teléfono / Formulario web | **8 / 7 / 7** | `=CONTAR.SI(C2:C;"Ventanilla")` … |
| Bacheo / Alumbrado / Residuos | **8 / 7 / 7** | `=CONTAR.SI(D2:D;"Bacheo")` … |
| Centro / Cotahuma / Max Paredes / Periférica / Sur / SIN ZONA | **4 / 5 / 4 / 4 / 4 / 1** | `=CONTAR.SI(E2:E;"Macrodistrito Centro")` … |
| Abierto / Cerrado / Anulado | **12 / 9 / 1** | `=CONTAR.SI(G2:G;"Abierto")` … |

### Reemplazos de limpieza (con “coincidir con toda la celda”)

| Campo | Reemplazar | Por |
|---|---|---|
| `canal` | `ventanilla` | `Ventanilla` |
| `canal` | `telefono`, `Telefono` | `Teléfono` |
| `canal` | `formulario web` | `Formulario web` |
| `tipo_reclamo` | `BACHEO` | `Bacheo` |
| `tipo_reclamo` | `alumbrado`, `Alumbrado ` | `Alumbrado` |
| `tipo_reclamo` | `residuos` | `Residuos` |
| `zona` | `centro` | `Macrodistrito Centro` |
| `zona` | `COTAHUMA`, `Cotahuma` | `Macrodistrito Cotahuma` |
| `zona` | `Max Paredes`, `M. Paredes` | `Macrodistrito Max Paredes` |
| `zona` | `periférica` | `Macrodistrito Periférica` |
| `zona` | *(vacío)* | `SIN ZONA` |

> **Punto de aprendizaje clave:** `SIN ZONA` **no** es lo mismo que borrar la fila. El reclamo existe; se
> conserva marcado para no **inflar** ni **perder** totales.

---

## Parte 2 — Flujo resuelto

### Flujo base (las 7 tareas y su orden)

```text
T1 Extraer reclamos (3 sistemas)
        │
        ▼
T2 Limpiar y preparar (unificar, deduplicar, fechas)
        │
        ▼
T3 Combinar con el padrón de zonas
        │
        ├──────────────▶ T6 Detectar alerta (crítico repetido por zona)
        ▼
T4 Cargar al almacén analítico
        │
        ▼
T5 Calcular indicadores del reporte
        │
        ▼
T7 Enviar aviso (resumen del reporte y, si corresponde, alerta)   ◀── T6
```

### Tabla de tareas modelo

| Tarea | Qué hace | Depende de | Frecuencia | Si falla |
|---|---|---|---|---|
| T1 Extraer | Toma datos de ventanilla, teléfono y web | — | Diario 6:00 | Reintentar 3 veces; si una fuente no responde, avisar y seguir con las otras dos, marcando el faltante |
| T2 Limpiar | Unifica canal/tipo/zona, deduplica, corrige fechas | T1 | Diario 6:00 | **Detener**: no se carga nada (mejor no cargar datos sucios) y avisar |
| T3 Combinar | Cruza con el padrón de zonas | T2 | Diario 6:00 | Igual que T2: detener y avisar |
| T4 Cargar | Guarda en el almacén analítico | T3 | Diario 6:00 | Reintentar 3 veces; si persiste, avisar |
| T5 Calcular | Totales por zona, canal y tipo | T4 | Mensual (día 1) | Reintentar; si falla, avisar al responsable del reporte |
| T6 Detectar alerta | ¿Un crítico repetido en la misma zona? | T3 | Cada 6 horas | Reintentar; si falla, avisar (la alerta no puede quedar muda) |
| T7 Enviar aviso | Correo con resumen y/o alerta | T5 y T6 | Diario y mensual | Reintentar; registrar el envío |

### Trazabilidad (respuesta modelo)

- Se registra **una fila por corrida** en una hoja `log`: `fecha_hora | tarea | estado (ok/error) | filas_procesadas | duración`.
- Se conserva el `crudo` de cada extracción y el `limpio` de cada día: permite **reproducir** el reporte.
- Un responsable revisa el log **cada mañana**; si hay errores, recibe aviso automático.

### Decisión sobre la fecha inválida

No se inventa una fecha. Opciones válidas: **excluirla** del reporte marcándola, o **corregirla con el
área** dueña del dato (mesa de entrada) y dejar registro del cambio. Cualquiera de las dos es aceptable
**si se justifica**.

---

## Flujos por variante (énfasis)

| Variante | Qué cambia | Qué se evalúa |
|---|---|---|
| **A — Reporte mensual** | T1→T5 corre **una vez al mes**; se prioriza que T2 quede perfecta | Justifica que los datos estén **completos y limpios** antes de calcular |
| **B — Alerta temprana** | **T1→T3→T6** corre **varias veces al día**; T5→T7 una vez al mes | Distingue la **frecuencia de la alerta** de la del reporte |
| **C — Trazabilidad** | Añade una tarea de **registro** después de cada paso; conserva el log y el crudo | Define **dónde y qué** se guarda, y quién lo revisa |

---

## Errores frecuentes y cómo orientarlos

| Error | Cómo se detecta | Cómo orientar |
|---|---|---|
| Borran filas con zona vacía | El conteo baja de 22 | Recordar `SIN ZONA`: marcar, no borrar |
| Reemplazos que rompen palabras | “centro” dentro de otras palabras | Activar “coincidir con toda la celda” |
| Flujo como lista sin flechas | Tareas sueltas | Preguntar “¿puede empezar sin la anterior?” |
| Todos “si falla: reintentar” sin distinguir | No hay tarea que deba **detenerse** | Discutir por qué cargar datos sucios es peor que no cargar |
| No definen trazabilidad | Falta la sección 3 | Relacionar con auditoría y rendición de cuentas |
| Ignoran su énfasis | A, B y C salen iguales | Volver a las variantes y ajustar frecuencia y tareas |

## Rúbrica con niveles

| Nivel | Descriptor |
|---|---|
| **Insuficiente (1–59)** | No limpia o pierde registros; el flujo no tiene orden ni dependencias ni manejo de fallas. |
| **Suficiente (70–84)** | Limpia la mayoría de los valores; el flujo está ordenado, pero no define qué pasa si falla ni la trazabilidad. |
| **Alto (85–94)** | Limpieza completa y verificada; flujo con frecuencia, dependencias y manejo de fallas; define trazabilidad. |
| **Excelente (95–100)** | Todo lo anterior + coherencia con su énfasis, frecuencia distinta para alerta y reporte, y una decisión justificada con datos (la fecha inválida). |

> Escala del módulo: 1–59 inicial · 60–69 muy parcial · 70–84 suficiente · 85–94 alto porcentaje ·
> 95–100 logro total esperado.
