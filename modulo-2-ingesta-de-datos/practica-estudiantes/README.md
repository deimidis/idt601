# Práctica interactiva para estudiantes (GitHub Pages)

Un **único archivo** (`index.html`) **autocontenido** con dos tests de la Unidad 2 — Ingesta de Datos:

1. **Lección 1 — ¿Batch o streaming?**
2. **Lección 2 — Conector, script o API**

Cada estudiante entra con su propio dispositivo, responde y ve su **puntaje al final** (con repaso de
las respuestas). **No se guarda nada**: ni nombres, ni puntajes, ni cookies. Está permitido repetirlo.

## Cómo publicarlo en GitHub Pages

> No hace falta saber programar. Solo hay que subir el archivo a un repositorio y activar Pages.

1. Crear un repositorio **público** en GitHub (por ejemplo, `practica-ingesta-idt601`).
2. Subir **el contenido de esta carpeta** (el archivo `index.html`) a la **raíz** del repositorio.
   - Opción por web: en el repo, botón **Add file → Upload files**, arrastrar `index.html`, **Commit**.
3. Ir a **Settings → Pages**.
4. En **Source**, elegir **Deploy from a branch**, rama **main** y carpeta **/ (root)**. Guardar.
5. Esperar 1–2 minutos. La página queda en:
   `https://<tu-usuario>.github.io/<nombre-del-repo>/`

Comparte ese enlace con los estudiantes (por Moodle, correo o un código QR). Cada uno lo abre en su
celular o computadora.

### Si preferís usar el repositorio del módulo

- Subir `index.html` a la raíz del repo del módulo: Pages lo publica directamente.
- O subirlo dentro de una carpeta `docs/` y elegir **/docs** como carpeta de Pages.

## Notas

- Es **autocontenido**: no depende de internet ni de archivos externos; también funciona abriéndolo
  localmente con doble clic.
- No usa `localStorage` ni envía datos a ningún servidor.
- Funciona en celular, tablet y computadora.
- Para agregar otro test (por ejemplo, la lección de **patrones**, de la Sesión 3), se añade un bloque
  al arreglo `TESTS` del archivo; la interfaz se adapta sola.
