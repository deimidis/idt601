# Módulo 6 — Inteligencia Artificial (paquete docente)

Materiales de la **Unidad/Bloque 6 — Historia y Desarrollo de la Inteligencia Artificial** del módulo
*Ingeniería de Datos (IDT 601)*, Diplomado en Data Driven AI (EGPP 2026).

**Sesiones:** 8, 9 y 10 · cada una sostiene **~180 min (3 horas)**.

> **Estado:** la carpeta contiene el **paquete completo del módulo**: el paquete de curso (MISSION,
> GLOSSARY, RESOURCES, lectura de la unidad, 6 lecciones con quiz y 6 referencias) y todos los
> materiales de las sesiones 8–10 (planes, presentaciones, decks, notas, talleres, plantillas e
> insumos), siguiendo el molde de `modulo-4-integracion-de-datos/` y `modulo-5-licencias-datos-abiertos/`.

## Contenido

| Archivo | Qué es |
|---|---|
| `MISSION.md` | Por qué y para qué dominar este bloque. |
| `GLOSSARY.md` | Lenguaje canónico de IA (≈40 términos). |
| `RESOURCES.md` | Fuentes de confianza y gaps. |
| `06_Inteligencia_Artificial.md` | Documento explicativo de la unidad (lectura base). |
| `rubrica-modulo.md` | Rúbrica con niveles de las sesiones 8–10 y del trabajo final integrador. |
| `lessons/` | Lecciones interactivas con quiz: `0001` historia, `0002` determinista/indeterminista, `0003` cómo aprende una red, `0004` tipos de aprendizaje, `0005` LLMs y prompting, `0006` agentes. |
| `reference/` | Hojas de referencia rápida (historia; determinista vs. indeterminista; cómo aprende una red; técnicas de prompting; límites de un LLM; componentes de un agente). |
| `assets/` | Tema visual EGPP (`theme-egpp.css`), estilos, `quiz.js` y los esquemas SVG (línea de tiempo, red neuronal, ciclo de prompt, componentes del agente). |
| `Sesion_08_IA_Historia_Redes_Aprendizaje.md` | Plan de la sesión 8 (cronograma de 180 min, dinámica y evaluación). |
| `presentacion_sesion8.{md,html}` | Presentación reveal de la sesión 8 (fuente `.md` + render `.html`). |
| `deck-sesion-08.html` | Deck del participante de la sesión 8, autocontenido. |
| `notas-sesion-08.md` | Guion del orador por diapositiva (sesión 8). |
| `taller_sesion8_regla_dato_aprendizaje.md` | Taller 8: dinámica de clasificación "¿regla, dato o aprendizaje?" (2 rondas). |
| `plantilla-ficha-dinamica.md` | Plantilla de entrega del taller 8. |
| `guia-solucion-docente-sesion8.md` | Clave de las dos rondas, criterios y rúbrica. |
| `Sesion_09_IA_LLMs_Prompting.md` | Plan de la sesión 9. |
| `presentacion_sesion9.{md,html}` | Presentación reveal de la sesión 9. |
| `deck-sesion-09.html` | Deck del participante de la sesión 9, autocontenido. |
| `notas-sesion-09.md` | Guion del orador por diapositiva (sesión 9). |
| `taller_sesion9_prompts_gestion_publica.md` | Taller 9: redactar, evaluar e iterar prompts para una tarea institucional. |
| `guia-prompting.md` | Guía de prompting (claridad, contexto, ejemplos, rol) con ejemplos. |
| `plantilla-captura-prompt.md` | Plantilla de captura: prompt v1 → evaluación → prompt v2 mejorado. |
| `guia-solucion-docente-sesion9.md` | Criterios, errores frecuentes y rúbrica. |
| `Sesion_10_IA_Agentes_Taller.md` | Plan de la sesión 10 (cierre del módulo). |
| `presentacion_sesion10.{md,html}` | Presentación reveal de la sesión 10. |
| `deck-sesion-10.html` | Deck del participante de la sesión 10, autocontenido. |
| `notas-sesion-10.md` | Guion del orador por diapositiva (sesión 10). |
| `taller_sesion10_minisolucion_ia.md` | Taller 10: mini-solución con LLM/agente y defensa. |
| `plantilla-diseno-flujo-agente.md` | Plantilla de diseño del flujo de un agente. |
| `plantilla-entrega-minisolucion.md` | Plantilla de entrega de la mini-solución. |
| `guia-solucion-docente-sesion10.md` | Casos resueltos de ejemplo, criterios y rúbrica del módulo. |
| `insumos/tarjetas-dinamica-s8.md` | 12 casos de la dinámica de la sesión 8, listos para compartir. |
| `insumos/tareas-practica-s9.md` | Tareas de la práctica de la sesión 9 y notas de acceso al chat. |
| `insumos/casos-minisolucion-s10.md` | 5 casos del taller de cierre (los casos 2 y 4 adaptados a chat). |

## Cómo encaja con las sesiones

- **Sesión 8** cierra el punto que decide el uso real: **sobreajuste, conjunto de prueba y métricas**, además de la historia, los dos enfoques y los tres tipos de aprendizaje.
- **Sesión 9** corrige la descripción del preentrenamiento, suma **tokens, ventana de contexto, temperatura y embeddings**, y trae la **guía de prompting** y un **Plan B sin cuenta** para el chat.
- **Sesión 10** reescribe los casos que exigían un agente para resolverse con **chat + supervisión humana**, aporta la **rúbrica del módulo** y las plantillas, y cierra el arco con los dos componentes nuevos del trabajo final.
- Transversal: la **advertencia de confidencialidad** (no subir datos de ciudadanos ni documentos reservados a un chat público).

## Cómo se mantiene

- Esta carpeta es el origen; se publica en el sitio estático `../idt601/modulo-6-ia/`.
- Si se cambia un material aquí, hay que volver a copiarlo allí.
- Los `.docx` (`taller_sesion*`, `plantilla-*`, `guia-prompting`) se generan con `pandoc` desde el `.md` y **no se versionan** en el sitio.
- Las presentaciones reveal publicadas usan `reveal.js` por **CDN** (jsDelivr 6.0.1) y el tema `assets/theme-egpp.css` local.
