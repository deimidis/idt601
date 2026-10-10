# Módulo 4 — Integración de Datos (paquete docente)

Materiales de la **Unidad/Bloque 4 — Integración de Datos** del módulo *Ingeniería de Datos (IDT 601)*,
Diplomado en Data Driven AI (EGPP 2026).

**Sesión:** 6 · sostiene **~180 min (3 horas)**.

> **Estado:** la carpeta contiene el **paquete completo del módulo**: el paquete de curso (MISSION,
> GLOSSARY, RESOURCES, lectura de la unidad, 3 lecciones con quiz y 3 referencias) y todos los
> materiales de la sesión 6 (plan, presentación, deck, notas, taller e insumos), siguiendo el molde
> de `modulo-2-ingesta-de-datos/` y `modulo-3-arquitectura-de-datos/`.

## Contenido

| Archivo | Qué es |
|---|---|
| `MISSION.md` | Por qué y para qué dominar este bloque. |
| `GLOSSARY.md` | Lenguaje canónico de integración (18 términos). |
| `RESOURCES.md` | Fuentes de confianza y gaps. |
| `04_Integracion_de_Datos.md` | Documento explicativo de la unidad (lectura base). |
| `lessons/` | Lecciones interactivas con quiz: `0001` ETL vs. ELT, `0002` limpieza de datos, `0003` automatizar y orquestar. |
| `reference/` | Hojas de referencia rápida (ETL vs. ELT; herramientas de integración; orquestación cron/Airflow). |
| `assets/` | Tema visual EGPP (`theme-egpp.css`), estilos y `quiz.js`. |
| `Sesion_06_Integracion_ETL_Orquestacion.md` | Plan de sesión (cronograma de 180 min, dinámicas y evaluación). |
| `presentacion_sesion6.md`, `presentacion_sesion6.html` | Presentación reveal (fuente `.md` + render `.html`). |
| `deck-sesion-06.html` | Deck del participante, autocontenido (funciona sin internet). |
| `notas-sesion-06.md` | Guion del orador por diapositiva. |
| `taller_sesion6_automatizar_pipeline.md` | Taller de la sesión 6: limpiar los datos y diseñar el flujo programado (automatización y orquestación). |
| `guia-solucion-docente-sesion6.md` | Solución del taller: limpieza resuelta, flujo modelo, flujos por variante (A/B/C) y rúbrica. |
| `plantilla-flujo-programado.md` | Plantilla de entrega por equipo (diagrama, tabla de tareas, trazabilidad). |
| `datos/reclamos_crudos.csv` | Insumo: exportación cruda de reclamos (con duplicados, zonas inconsistentes, fechas mezcladas y faltantes). |
| `datos/DICCIONARIO_reclamos.md` | Diccionario de campos, valores canónicos y reglas de limpieza. |
| `datos/FUENTE.md` | Origen del dato (sintético con fines didácticos) y alternativa con dato abierto real de AGETIC. |

## Cómo encaja con la sesión

- Reemplaza la “Práctica: programar una tarea sencilla (40 min)” del plan `Sesion_06_Integracion_ETL_Orquestacion.md`,
  inviable en 40 min, en línea y con público no especialista.
- Conserva la continuidad narrativa con el **caso institucional de la sesión 5** y el tipo de insumo
  (CSV) de los talleres 2-3.
- Enseña los conceptos centrales sin programar: **automatizar = que corra solo; orquestar = que corra en
  orden y avise si falla**.

## Cómo se mantiene

- Esta carpeta es el origen; se publica en el sitio estático `../idt601/modulo-4-integracion-de-datos/`.
- Si se cambia un material aquí, hay que volver a copiarlo allí.
