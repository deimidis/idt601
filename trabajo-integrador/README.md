# Trabajo integrador (Módulos 1 a 4) y caso de estudio de buses

Paquete docente del **trabajo integrador** del módulo *Ingeniería de Datos (IDT 601)*, Diplomado en
Data Driven AI (EGPP 2026). Reúne un **caso de estudio** y un **trabajo integrador** independientes,
ambos **sin programación** (hoja de cálculo).

## Contenido

| Archivo | Qué es |
|---|---|
| `caso_estudio_buses.md` | Caso de estudio: una alcaldía recibe datos de los **recorridos de buses** (tiempo real y resúmenes diarios). El alumno entrega **≤2 páginas** con un análisis propuesto, eligiendo datos, granularidad y forma de guardarlos. |
| `guia_caso_buses.md` | Guía del docente del caso: respuestas orientadoras, defectos esperados en los CSV y **rúbrica** con niveles. |
| `datos/recorridos_tiempo_real.csv` | Insumo del caso: feed crudo de **telemetría GPS** (con defectos a propósito). |
| `datos/recorridos_resumen_diario.csv` | Insumo del caso: **resumen diario** por línea (con defectos a propósito). |
| `trabajo_integrador.md` | Enunciado del **trabajo integrador** (Bloques 1–4): ficha de fuentes y tipos, calidad, ingesta, arquitectura, limpieza e **informe mensual**. |
| `planilla_limpieza.md` | Planilla/checklist de **limpieza** de la base, con valores canónicos y verificación. |
| `plantilla_informe_mensual.md` | Plantilla del **informe mensual** de servicios. |
| `rubrica_trabajo_integrador.md` | **Rúbrica** con niveles del trabajo integrador. |
| `datos/registros_servicios.csv` | Insumo del trabajo integrador: base **sucia** de servicios públicos (duplicados, categorías inconsistentes, fechas mezcladas, faltantes). |

## Cómo se relacionan con el módulo

- El **caso de estudio** repasa los Bloques 1–4 aplicados al transporte urbano: fuentes y tipos,
  calidad, granularidad (tiempo real vs. agregada) y forma de almacenamiento.
- El **trabajo integrador** es el cierre sumativo de los Bloques 1–4 (datos, ingesta, arquitectura e
  integración) y coincide con el "Trabajo final integrador del módulo" descrito en el Plan de Clases:
  documento + artefactos + defensa, **sin programación**.
- Son **independientes**: cada uno usa su propio caso y sus propios datos.

## Cómo se mantiene

- Esta carpeta es el origen; se publica en el sitio estático `../idt601/trabajo-integrador/`.
- Si se cambia un material aquí, hay que volver a copiarlo allí.
- Los `.docx` se generan con `pandoc` desde el `.md` y **no se versionan** en el sitio.
