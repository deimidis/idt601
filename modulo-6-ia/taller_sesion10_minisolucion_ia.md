# Taller — Sesión 10: mini-solución de IA

**Módulo:** Ingeniería de Datos (IDT 601) · Bloque 6 — Inteligencia Artificial
**Duración:** 75 min de taller y defensa (35 + 25 + 15), dentro de la sesión de 180 min
**Modalidad:** 100 % en línea (Zoom + salas) · **Modo A** (equipos) o **Modo B** (demostración del docente)
**Herramienta:** un chat LLM en el navegador (sin instalar) o, si no hay cuenta, el **Plan B** del final.
**Insumos:** `insumos/casos-minisolucion-s10.md` (los cinco casos) ·
`plantilla-diseno-flujo-agente.md` · `plantilla-entrega-minisolucion.md`

---

## Objetivo

Que cada equipo **construya y documente una mini-solución** con un LLM (chat o agente) para un caso
institucional acotado, siguiendo el método **Definir → Armar → Evaluar → Mejorar** y dejando explícito
su **punto de control humano**.

Entregables **nombrados**:

1. **Mini-solución documentada** (`plantilla-entrega-minisolucion.md`): tarea, prompt/flujo, resultado
   de una prueba, evaluación crítica y mejora aplicada.
2. **Flujo del agente diseñado** (`plantilla-diseno-flujo-agente.md`): modelo, herramientas, memoria,
   planificación y punto de control humano.

> El flujo del agente **se diseña y se documenta**, aunque no se ejecute en vivo. Los casos 2
> (clasificador de reclamos) y 4 (verificador de expedientes) se resuelven con **chat + criterio +
> supervisión humana**: no hacen falta plataformas de agentes reales.

## Caso institucional

> *Una institución pública quiere usar un LLM para aliviar una tarea repetitiva. El equipo elige **una**
> tarea acotada, define para quién es y qué resultado espera, arma el prompt (chat) o el flujo (agente),
> lo evalúa con un caso **ficticio o público** y lo mejora.*

Los cinco casos están detallados en `insumos/casos-minisolucion-s10.md`: asistente de trámites,
clasificador de reclamos, resumidor de informes, verificador de expedientes y avisos a la ciudadanía.

> **Regla transversal:** no se sube a un chat público ningún dato de ciudadanos, documento reservado ni
> información no pública. Se trabaja con ejemplos **ficticios** o datos ya **públicos**.

## Preparación previa (el día anterior)

1. Subir a Moodle (o pegar en el chat) los insumos: `insumos/casos-minisolucion-s10.md` y las dos
   plantillas.
2. Preparar una **mini-solución de ejemplo** (para el Modo B) usando el caso 3 (resumidor de informes)
   con un texto ficticio.
3. Verificar que el chat LLM abre sin cuenta o tener listo el **Plan B**.
4. Tener un **documento compartido o pizarra** para que los equipos peguen sus entregas en la defensa.
5. Tener a mano la `guia-solucion-docente-sesion10.md` con los casos resueltos y la rúbrica.

## Reparto minuto a minuto (75 min)

| Momento | Tiempo | Quién |
|---|---|---|
| **Definir y armar** — tarea y prompt/flujo | 35 min | Equipos |
| **Evaluar, mejorar y preparar la defensa** | 25 min | Equipos |
| **Defensa** — 2 min por equipo | 15 min | Todos |
| **Total taller y defensa** | **75 min** | |

> La **consigna, la formación de equipos y la elección del caso** (5 min) ocurren en el bloque anterior,
> "Aplicación integrada: el método y la consigna" (15 min), junto con la explicación del método de
> cuatro pasos.

### Dentro de "Definir y armar" (35 min)

| Minutos | Qué pasa |
|---|---|
| 0–10 | Escribir el problema, el destinatario y el criterio de éxito (punto 1 de la entrega). |
| 10–25 | Armar el **prompt** (chat) o completar el **flujo del agente** (`plantilla-diseno-flujo-agente.md`). |
| 25–32 | Revisar que estén los cuatro componentes y el **punto de control humano**. |
| 32–35 | Chequeo interno con la lista de control y pedir ayuda al docente si hace falta. |

### Dentro de "Evaluar, mejorar y preparar la defensa" (25 min)

| Minutos | Qué pasa |
|---|---|
| 0–8 | **Probar** la solución con un caso ficticio o público y pegar el resultado. |
| 8–15 | **Evaluar** con las tres preguntas: ¿responde a lo pedido?, ¿es exacto y verificable?, ¿hay alucinación o sesgo? |
| 15–21 | Aplicar **una mejora** (prompt, flujo o fuente) y anotar el antes y el después. |
| 21–25 | **Preparar la defensa de 2 min** con la plantilla de entrega. |

### Dentro de "Defensa" (15 min)

| Minutos | Qué pasa |
|---|---|
| 0–1 | Encuadre del docente: qué se muestra y en qué orden. |
| 1–13 | **2 min por equipo** (unos 6 equipos). Cada equipo muestra prompt/flujo, resultado de la prueba y qué verificó. |
| 13–15 | Cierre del docente: contrasta elecciones y refuerza la regla de oro. |

---

## Pasos del trabajo

**Consigna:** "Elijan un caso acotado, definan para quién es y qué resultado esperan, y documenten el
prompt o el flujo. Después pruébenlo con un caso ficticio, evalúenlo con criterio y apliquen una
mejora. No se busca la perfección: se busca un paso útil y bien pensado."

1. **Definir la tarea.** Un problema acotado, un destinatario y un criterio de éxito.
2. **Armar.** Para **chat**: prompt con claridad, contexto, ejemplos y rol. Para **agente**: completar
   los cuatro componentes y el punto de control humano en `plantilla-diseno-flujo-agente.md`.
3. **Probar.** Un caso **ficticio o público**; pegar el resultado.
4. **Evaluar.** Tres preguntas: ¿responde a lo pedido?, ¿es exacto y verificable?, ¿hay alucinación o
   sesgo? Anotar honestamente.
5. **Mejorar.** Un cambio concreto (prompt, flujo o fuente) y su efecto.
6. **Preparar la defensa.** 2 min por equipo con la plantilla de entrega.

## Modo A — Trabajo de participantes (salas)

**Consigna (pegar en el chat):** "Elijan un caso, definan la tarea y armen el prompt/flujo. Luego
prueben, evalúen y mejoren. Entreguen las dos plantillas. Guarden el enlace con permiso de edición."

- Roles del equipo: **coordinador** (cuida el tiempo) y **relator** (comparte pantalla en la defensa).
- Rol del docente: **rotar por las salas cada 5–6 min**, destrabar sobre todo el **alcance de la tarea**
  (que no sea enorme), la **calidad del prompt/flujo** y la **ubicación del punto de control humano**.

## Modo B — Demostración del docente (guion para compartir pantalla, 35 min)

Versión totalmente guiada. Los participantes siguen con la vista y completan su plantilla.

1. **Encuadre (3 min).** "Vamos a construir una mini-solución completa, de la tarea a la mejora."
2. **Definir (5 min).** Caso 3 (resumidor de informes): destinatario (una autoridad) y criterio de
   éxito (resumen fiel de 150 palabras).
3. **Armar (10 min).** Escribir el prompt con rol, longitud, secciones y un ejemplo de estilo; mostrar
   el antes (prompt vago) y el después (prompt completo).
4. **Probar (6 min).** Pegar un **texto ficticio** y mostrar el resultado real del chat.
5. **Evaluar (5 min).** Verificar una cifra contra el texto original; señalar si el resumen cambió un
   dato y qué se debe revisar siempre.
6. **Mejorar (4 min).** Ajustar el prompt (pedir "no inventes cifras; cita el párrafo") y volver a
   probar.
7. **Cerrar (2 min).** Repetir el punto de control humano y la regla de confidencialidad.

> **Consejo de pantalla:** hacerlo despacio, pensar en voz alta y dejar visibles el prompt y el
> resultado para comparar.

## Puesta en común / defensa (15 min)

El **relator** comparte pantalla (**2 min por equipo**). Cuenta:

- **Qué problema** resolvió y **para quién**.
- El **prompt o flujo** y el **resultado** de la prueba.
- **Qué tuvo que verificar o corregir** y **qué mejora** aplicó.
- **Dónde** revisa una persona el resultado (punto de control humano).

El docente contrasta las soluciones y refuerza las ideas fuerza: *un error del agente puede ser una
acción; el agente sugiere y el humano decide; y la confidencialidad no se negocia.*

---

## Evaluación y entrega

| Criterio | Evidencia |
|---|---|
| Define una tarea acotada y útil | Punto 1 de la entrega |
| Diseña el flujo (modelo, herramientas, memoria, planificación) | Plantilla de diseño |
| Incorpora supervisión humana | Punto de control humano definido |
| Prueba y evalúa | Punto 3 y 4 de la entrega |
| Aplica una mejora | Punto 5 de la entrega |
| Cuida la confidencialidad | Usa caso ficticio o público |
| Defiende con claridad | Exposición de 2 min |

**Entrega por equipo:** `plantilla-entrega-minisolucion.md` + `plantilla-diseno-flujo-agente.md`
completadas (o el enlace del documento). Se cierra **dentro de la sesión**.

## Rúbrica con niveles

| Nivel | Descriptor |
|---|---|
| **Insuficiente (1–59)** | Tarea vaga o desmedida; no identifica los componentes ni prevé control humano; no prueba o no evalúa. |
| **Suficiente (70–84)** | Tarea acotada con destinatario; identifica los cuatro componentes; menciona revisión humana; prueba y evalúa con las tres preguntas. |
| **Alto (85–94)** | Justifica los componentes según la tarea; define **puntos de control** con menor privilegio y trazabilidad; detecta un problema y aplica una mejora. |
| **Excelente (95–100)** | Todo lo anterior, más: criterio de éxito explícito; detecta y documenta alucinación o sesgo; usa caso ficticio o público y prevé el resguardo de datos de ciudadanos. |

> Escala del módulo (Plan de Clases): 1–59 inicial · 60–69 muy parcial · 70–84 suficiente · 85–94 alto
> porcentaje · 95–100 logro total esperado.

## Problemas frecuentes (y qué hacer)

| Síntoma | Causa | Solución |
|---|---|---|
| Tarea enorme ("un asistente para toda la institución") | No acotan | Reducir a **un paso**: un tipo de consulta, un tipo de reclamo, un informe. |
| Prompt vago ("resumime esto") | Faltan claridad y contexto | Pedir rol, formato, longitud y un ejemplo de estilo. |
| No aparece la supervisión humana | Creen que el control va "implícito" | Exigir que escriban **en qué paso y qué revisa** una persona. |
| Pegan datos reales de ciudadanos | Prueban con datos de trabajo | Detener, borrar y usar un **caso ficticio**; repetir la regla de confidencialidad. |
| "El agente es muy avanzado para documentarlo sin plataforma" | Confunden ejecutar con diseñar | Aclarar que el flujo **se diseña y se documenta** aunque no se ejecute en vivo. |
| No aplican mejora | Cierran con la primera versión | Pedir el "antes y después" de un cambio concreto. |

## Plan B (si falla la conexión, el acceso o la cuenta)

- **Sin cuenta en el chat:** usar un chat que abra sin registro; si no, el docente comparte pantalla y
  la clase sigue el guion del **Modo B**.
- **Sin salas:** cada equipo trabaja en un documento compartido coordinado por el chat.
- **Sin poder pegar texto:** el equipo escribe el prompt y **describe** el resultado esperado; documenta
  igual el flujo, la evaluación y la mejora.
- **Sin audio:** la consigna y la defensa se hacen por chat y pantalla compartida.

---

## Nota para el docente

- El taller continúa el método de la sesión 9 (prompts y verificación) y lo lleva a **diseño de flujo**.
- Los casos 2 y 4 se resolvieron con **chat + criterio + supervisión humana** para no depender de una
  plataforma de agentes real; el flujo del agente **se diseña y se documenta** con la plantilla.
- La **solución modelo** (casos resueltos, errores frecuentes y rúbrica del trabajo final) está en
  `guia-solucion-docente-sesion10.md`.
