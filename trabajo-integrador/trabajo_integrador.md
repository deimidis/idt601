# Trabajo integrador — Módulos 1 a 4

**Módulo:** Ingeniería de Datos (IDT 601)
**Alcance:** integra los Bloques 1 (datos), 2 (ingesta), 3 (arquitectura) y 4 (integración de datos)
**Modalidad:** grupal (3–4 personas) · **entrega fuera de sesión** · **sin programación**
**Herramienta:** hoja de cálculo (Google Sheets o Excel en línea). **No se instala nada.**

---

## Objetivo

A partir de una **base de datos sucia** de una repartición pública, producir un **informe mensual**
de gestión. Para lograrlo hay que recorrer, de punta a punta, lo aprendido en los cuatro bloques:
identificar **fuentes y tipos** y evaluar su **calidad**, entender la **ingesta**, bocetar una
**arquitectura** donde vive el dato, y **integrar, limpiar y preparar** los datos para el informe.

No se escribe código: todo se resuelve con **hoja de cálculo** y **criterio**.

---

## Caso

> El **Gobierno Autónomo Municipal de Villa Nueva** presta servicios de aseo urbano a través de su
> **Dirección de Servicios Públicos**: barrido de calles, recojo de residuos, lavado de contenedores y
> poda de árboles. Cada servicio atendido se registra con distinto **canal** (ventanilla, teléfono,
> formulario web, WhatsApp) y lo ejecuta una **cuadrilla** en un **macrodistrito**.
>
> La Dirección recibe los registros en **una planilla** (`datos/registros_servicios.csv`), pero nadie
> confía en ella: tiene duplicados, categorías escritas de mil formas, fechas mezcladas y valores
> faltantes. La Dirección necesita, para fin de mes, un **informe mensual confiable** de los servicios
> prestados, pero antes hay que **limpiar la base** y **decidir qué datos usar**.

---

## Entregables

1. **Ficha de fuentes y tipos + calidad** (Bloque 1). Tabla con cada campo de la base: qué representa, qué tipo de dato es (texto, número, fecha, categoría), y qué **problema de calidad** tiene (completitud, exactitud, consistencia, actualidad).
2. **Boceto de arquitectura** (Bloque 3). Un diagrama simple: de dónde vienen los datos, dónde se guardan (crudo y limpio), cómo se procesan y quién los usa. Señalar las cuatro piezas: **almacenamiento, procesamiento, catálogo y gobernanza**.
3. **Base limpia** (Bloques 1 y 4). La planilla `planilla_limpieza.md` completada y una copia **`limpio`** de los datos con: duplicados eliminados, categorías unificadas, fechas en formato único, y faltantes **marcados** (no inventados).
4. **Decisión de datos + informe mensual** (Bloque 4). Elegir **qué campos y qué recortes** usa el informe (y justificar qué deja fuera), y completar `plantilla_informe_mensual.md` con las cifras.
5. **Documento final** (máximo 4 páginas) + **defensa breve** en clase. Reúne los puntos 1 a 4 y explica las decisiones.

---

## Fases sugeridas (fuera de clase)

| Fase | Qué hacer | Bloque |
|---|---|---|
| 1. Entender | Leer el caso y hacer la ficha de fuentes y tipos. | 1 |
| 2. Detectar problemas | Listar los defectos de calidad de la base sucia. | 1 |
| 3. Diseñar | Dibujar el boceto de arquitectura (dónde vive el dato). | 3 |
| 4. Limpiar | Aplicar la planilla de limpieza y producir la copia `limpio`. | 4 |
| 5. Informar | Decidir los datos del informe y completar la plantilla mensual. | 4 |
| 6. Documentar y defender | Armar el documento (≤4 páginas) y preparar la defensa. | 1–4 |

> La **ingesta** (Bloque 2) se cubre al describir **cómo llega** la base: qué canal/archivo, con qué
> frecuencia y con qué problemas de origen.

---

## Insumo

- `datos/registros_servicios.csv` — base sucia (41 registros). Columnas: `id_registro, fecha, macrodistrito, tipo_servicio, canal, estado, cuadrilla, duracion_min, costo_bs, observacion`.

## Reglas

- **No programar.** Todo con hoja de cálculo.
- **No borrar filas válidas.** Los faltantes se **marcan** (p. ej. `SIN DATO`), no se inventan.
- **Documentar cada decisión:** qué se hizo y por qué.
- **Proteger datos personales:** la base es operativa (no trae personas), pero el informe debe **agregar** (totales por zona/tipo), nunca exponer registros individuales.

## Cómo se evalúa (resumen)

| Criterio | Qué se observa |
|---|---|
| Fuentes y tipos (M1) | Ficha completa y correcta |
| Calidad de datos (M1) | Detecta los defectos reales de la base |
| Ingesta (M2) | Explica cómo llega el dato y sus problemas de origen |
| Arquitectura (M3) | Boceto con las cuatro piezas y el flujo |
| Limpieza e integración (M4) | Base `limpio` verificada y coherente |
| Informe mensual (M4) | Datos elegidos con criterio y cifras correctas |
| Documentación y defensa | Claridad y justificación |

> La rúbrica con niveles está en `rubrica_trabajo_integrador.md`.
