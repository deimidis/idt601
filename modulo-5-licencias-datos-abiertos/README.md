# Módulo 5 — Licencias de Datos y Datos Abiertos (paquete docente)

Materiales de la **Unidad/Bloque 5 — Licencias de Datos y Datos Abiertos** del módulo *Ingeniería de
Datos (IDT 601)*, Diplomado en Data Driven AI (EGPP 2026).

**Sesión:** 7 · sostiene **~180 min (3 horas)**.

> **Estado:** la carpeta contiene el **paquete completo del módulo**: el paquete de curso (MISSION,
> GLOSSARY, RESOURCES, lectura de la unidad, 3 lecciones con quiz y 3 referencias) y todos los
> materiales de la sesión 7 (plan, presentación, deck, notas, taller e insumos), siguiendo el molde
> de `modulo-2-ingesta-de-datos/`, `modulo-3-arquitectura-de-datos/` y `modulo-4-integracion-de-datos/`.

## Contenido

| Archivo | Qué es |
|---|---|
| `MISSION.md` | Por qué y para qué dominar este bloque. |
| `GLOSSARY.md` | Lenguaje canónico de licencias y datos abiertos (21 términos). |
| `RESOURCES.md` | Fuentes de confianza y gaps. |
| `05_Licencias_Datos_Abiertos.md` | Documento explicativo de la unidad (lectura base). |
| `lessons/` | Lecciones interactivas con quiz: `0001` la licencia de datos, `0002` licencias abiertas, `0003` datos abiertos y datos personales. |
| `reference/` | Hojas de referencia rápida (espectro de licencias; Creative Commons vs. ODC; datos abiertos y datos personales). |
| `assets/` | Tema visual EGPP (`theme-egpp.css`), estilos, `quiz.js` y los esquemas SVG (espectro, línea de tiempo y abierto vs. personal). |
| `Sesion_07_Licencias_Datos_Abiertos.md` | Plan de sesión (cronograma de 180 min, dinámicas y evaluación). |
| `presentacion_sesion7.md`, `presentacion_sesion7.html` | Presentación reveal de 19 láminas (fuente `.md` + render `.html`). |
| `deck-sesion-07.html` | Deck del participante, autocontenido (funciona sin internet). |
| `notas-sesion-07.md` | Guion del orador por diapositiva (sincronizado con la presentación). |
| `taller_sesion7_leer_y_aplicar_licencias.md` | Taller de la sesión 7: leer y aplicar una licencia a un dato abierto real. |
| `guia-solucion-docente-sesion7.md` | Solución del taller: respuestas por licencia, ficha modelo, errores frecuentes y rúbrica. |
| `plantilla-ficha-decision.md` | Plantilla de entrega por equipo (ficha de decisión). |
| `datos/encuesta_profesores_completo.csv` | Insumo: encuesta real de AGETIC (871 filas, CC-BY). |
| `datos/diccionario_recorte.md` | Diccionario de 17 columnas relevantes de la encuesta. |
| `datos/FUENTE.md` | Origen del dato (AGETIC, CC-BY) y texto de atribución. |
| `datos/licencias/` | Textos de CC0 1.0, CC BY 4.0 y ODC-By 1.0 para el taller. |

## Cómo encaja con la sesión

- Reemplaza el "Análisis guiado" de 15 min del plan `Sesion_07_Licencias_Datos_Abiertos.md` por un **taller de 35 min** con insumos empaquetados y entregable.
- Usa un **dato abierto real de AGETIC (CC-BY)** como insumo: permite discutir licencia, atribución, reutilización y datos personales en un solo objeto.
- Cierra el punto más débil señalado por el informe del módulo: **protección de datos personales con normativa boliviana citada por número y objeto** (CPE art. 21.2 y 130–131; D.S. 5340 y 5468), sin inventar artículos.

## Cómo se mantiene

- Esta carpeta es el origen; se publica en el sitio estático `../idt601/modulo-5-licencias-datos-abiertos/`.
- Si se cambia un material aquí, hay que volver a copiarlo allí.
- Los `.docx` (`taller_sesion7…`, `plantilla-ficha-decision`) se generan con `pandoc` desde el `.md` y **no se versionan** en el sitio.
