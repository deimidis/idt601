# idt601 — Ingeniería de Datos (IDT 601)

Sitio estático con las **presentaciones** y **lecciones** de los Módulos 1 (Datos) y 2 (Ingesta de Datos)
del Diplomado en Data Driven AI (EGPP 2026).

- Portada: `index.html`
- Módulo 1: `modulo-1-datos/`
- Módulo 2: `modulo-2-ingesta-de-datos/`

## Publicar en GitHub Pages

1. Crear en GitHub un repositorio público llamado `idt601` (sin README ni .gitignore).
2. Subir este contenido:
   ```bash
   git remote add origin https://github.com/deimidis/idt601.git
   git push -u origin main
   ```
3. En el repo: **Settings → Pages → Build and deployment → Source: Deploy from a branch**,
   rama **main**, carpeta **/ (root)**. Guardar.
4. Esperar 1–2 minutos. El sitio queda en: <https://deimidis.github.io/idt601/>

## Publicar en un servidor propio

El sitio no necesita build. Clonar y servir la raíz:

```bash
git clone https://github.com/deimidis/idt601.git
cd idt601
python3 -m http.server 8000
# abrir http://localhost:8000/
```

Con nginx/apache, apuntar el `root` del sitio a la carpeta clonada.

## Notas técnicas

- Las presentaciones `presentacion_sesion*.html` usan **reveal.js 6.0.1 vía CDN** (jsDelivr) y el tema
  local `assets/theme-egpp.css`. Necesitan internet.
- Los `deck-sesion-0N.html` son **autocontenidos**: funcionan sin internet (alternativa offline).
- Todos los enlaces internos son relativos: el sitio funciona igual en la raíz de un dominio o en un
  subpath (`/idt601/`).
- Fuente de datos del Módulo 2: AGETIC, *Encuesta Final-Profesores de Inclusión Digital*
  (datos.gob.bo, 2019), licencia CC-BY.
