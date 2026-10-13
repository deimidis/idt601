# Planilla de limpieza — base de servicios

**Módulo:** IDT 601 · Trabajo integrador (Bloques 1 y 4)
**Insumo:** `datos/registros_servicios.csv`
**Herramienta:** hoja de cálculo (Google Sheets / Excel en línea)

> Completa esta planilla mientras limpias la base. Al terminar, debe existir una copia `limpio`
> verificada y este documento con las decisiones registradas.

---

## 1. Preparación

1. Importa el CSV a una pestaña llamada **`crudo`** y **no la toques** (es tu respaldo).
2. Duplica la pestaña y renómbrala **`limpio`**: ahí se trabaja.
3. Cuenta las filas del `crudo` y anótalo: **filas crudas: ______**.

## 2. Reglas de limpieza (aplicar en `limpio`)

| Campo | Qué corregir | Valor canónico |
|---|---|---|
| `id_registro` | Formato uniforme; quitar duplicados | `S-0001` (mayúscula, 4 dígitos) |
| `fecha` | Unificar a formato ISO | `AAAA-MM-DD` (p. ej. `2026-09-05`) |
| `macrodistrito` | Quitar espacios y unificar | `Macrodistrito Centro`, `Macrodistrito Cotahuma`, `Macrodistrito Max Paredes`, `Macrodistrito Periférica`, `Macrodistrito Sur` |
| `tipo_servicio` | Unificar mayúsculas y espacios | `Barrido`, `Recojo de residuos`, `Lavado de contenedores`, `Poda de árboles` |
| `canal` | Unificar tildes y mayúsculas | `Ventanilla`, `Teléfono`, `Formulario web`, `WhatsApp` |
| `estado` | Unificar | `Atendido`, `En proceso`, `Cerrado`, `Derivado` |
| `cuadrilla` | Quitar espacios dobles | `Cuadrilla 1` … `Cuadrilla 4` |
| `duracion_min` | Convertir a número; negativos → revisar | número entero positivo, o `SIN DATO` |
| `costo_bs` | Quitar texto ("Bs"); usar punto decimal | número, o `SIN DATO` |
| `observacion` | Unificar mayúsculas iniciales | texto libre, o vacío |

**Reglas de oro:**
- **No borrar filas válidas.** Si falta un valor, escríbelo como **`SIN DATO`** (no lo inventes).
- Usa **"Coincidir con toda la celda"** al reemplazar, para no romper palabras.
- Anota **cada decisión** dudosa (p. ej. una duración negativa: ¿se excluye o se corrige?).

## 3. Decisiones registradas

| Dato dudoso | Qué encontré | Qué decidí y por qué |
|---|---|---|
| | | |
| | | |
| | | |

## 4. Verificación (completar con tus conteos)

| Comprobación | Esperado | Obtenido |
|---|---|---|
| Filas crudas | 41 | |
| Duplicados exactos eliminados | (tu conteo) | |
| Filas limpias | | |
| Macrodistritos distintos | 5 | |
| Tipos de servicio distintos | 4 | |
| Canales distintos | 4 | |
| `duracion_min` con `SIN DATO` | | |
| `costo_bs` con `SIN DATO` | | |

## 5. Entrega

- La copia **`limpio`** de la base (enlace de la hoja con permiso de edición, o exportación CSV).
- Esta planilla completada.
