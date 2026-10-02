# Módulo 2 — Ingesta de Datos (paquete docente)

Materiales de la **Unidad/Bloque 2 — Ingesta de Datos** del módulo *Ingeniería de Datos
(IDT 601)*, Diplomado en Data Driven AI (EGPP 2026), organizados para el/la docente.

**Sesiones:** 2 y 3 · cada una sostiene **~180 min (3 horas)**.

## Contenido

| Archivo | Qué es |
|---|---|
| `MISSION.md` | Por qué y para qué dominar este bloque. |
| `GLOSSARY.md` | Lenguaje canónico de ingesta (16 términos). |
| `RESOURCES.md` | Fuentes de confianza y gaps. |
| `02_Ingesta_de_Datos.md` | Documento explicativo de la unidad (lectura base). |
| `Sesion_02_*.md`, `Sesion_03_*.md` | Planes de sesión (cronograma de 180 min, dinámicas, evaluación). |
| `presentacion_sesion2.(md/html)`, `presentacion_sesion3.(md/html)` | Presentaciones reveal (fuente `.md` + render `.html`). |
| `deck-sesion-02.html`, `deck-sesion-03.html` | Decks de participante, autocontenidos. |
| `notas-sesion-02.md`, `notas-sesion-03.md` | Guion del orador por diapositiva. |
| `lessons/` | Lecciones interactivas con quiz: `0001` batch vs. streaming, `0002` conector/script/API, `0003` elegir el patrón. |
| `reference/` | Hojas de referencia rápida (batch vs. streaming; patrones; herramientas). |
| `practica-estudiantes/` | Página autocontenida (`index.html`) con los test de la sesión 2 para publicar en GitHub Pages. |
| `taller_sesion2_practica_online.md` | Práctica de la sesión 2 (conectar una fuente) en línea: participantes + demostración del docente. |
| `taller_sesion3_pipeline_online.md` | Taller de la sesión 3 (pipeline) en línea: participantes + demostración del docente. |
| `datos/` | Dataset real de datos abiertos (AGETIC): recorte, CSV completo, diccionario y ficha de fuente. |
| `assets/` | Tema visual EGPP (`theme-egpp.css`), estilos y `quiz.js`. |
| `presentacion_nube_edge_fog.(md/html)` | **[EXTRA]** Presentación complementaria: la nube, edge y fog (para si sobra tiempo). |
| `deck-nube-edge-fog.html` | **[EXTRA]** Deck autocontenido del mismo contenido (funciona sin internet). |
| `Sesion_03_demo_pipeline_herramientas.md` | **[EXTRA]** Demo docente: pipeline de punta a punta con Colab y n8n (destino NocoDB). |
| `pipeline_colab.ipynb` | **[EXTRA]** Pipeline en Python/Colab. |
| `pipeline_n8n.json` | **[EXTRA]** Workflow de n8n (importable). |

## Cómo se mantiene

- Esta carpeta es una **copia de trabajo** de los materiales de la raíz del proyecto. La raíz
  **no se actualiza sola**: si se cambia un material en la raíz, hay que volver a copiarlo aquí.
- Las presentaciones reveal usan **reveal.js 6.0.1 vía CDN** y el tema local `assets/theme-egpp.css`.
  Sin internet, usar el deck autocontenido (`deck-sesion-0N.html`).
- Los talleres usan **hoja de cálculo** (Google Sheets / Excel en línea) y el dataset de `datos/`.
  Fuente: AGETIC, *Encuesta Final-Profesores de Inclusión Digital* (datos.gob.bo, 2019), licencia CC-BY.
- Pendiente (fase posterior): **banco de preguntas** para Moodle.
