#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# render-docs.sh — Renderiza los documentos markdown de este módulo a HTML
# con el diseño del sitio (assets/styles.css + assets/docs.css).
# El .md sigue siendo la fuente; el .html es el render de lectura.
# Uso:  ./render-docs.sh   |   ./render-docs.sh archivo.md ...
# Requiere pandoc (>= 2.10). No requiere internet.
# ---------------------------------------------------------------------------
set -euo pipefail
cd "$(dirname "$0")"

KICKER="Módulo 3 — Arquitectura de Datos · IDT 601"
TEMPLATE="assets/doc-template.html"

DOCS=(
  "03_Arquitectura_de_Datos.md"
  "notas-sesion-04.md"
  "notas-sesion-05.md"
  "Sesion_04_Arquitectura_Conceptos_Componentes.md"
  "Sesion_05_Arquitectura_Patrones_Diseno.md"
  "taller_sesion4_componentes.md"
  "taller_sesion5_diseno_arquitectura.md"
)

[ "$#" -gt 0 ] && DOCS=("$@")

for f in "${DOCS[@]}"; do
  if [ ! -f "$f" ]; then
    echo "ERROR: no existe $f" >&2
    exit 1
  fi

  # Prefijo relativo hacia la raíz del módulo (donde están assets/ e index.html).
  dir="$(dirname "$f")"
  prefix=""
  if [ "$dir" != "." ]; then
    depth=$(( $(printf '%s' "$dir" | tr -cd '/' | wc -c) + 1 ))
    prefix="$(printf '../%.0s' $(seq 1 "$depth"))"
  fi
  homeurl="${prefix}../index.html"

  srcbase="$(basename "$f")"
  out="${f%.md}.html"
  title="$(grep -m1 '^# ' "$f" | sed 's/^# *//' || true)"
  [ -n "$title" ] || title="$srcbase"

  pandoc "$f" \
    --from=gfm \
    --to=html5 \
    --standalone \
    --template="$TEMPLATE" \
    -V "pagetitle=$title" \
    -V "kicker=$KICKER" \
    -V "assetsprefix=$prefix" \
    -V "homeurl=$homeurl" \
    -V "srclabel=$srcbase" \
    -V "srclink=$srcbase" \
    -o "$out"

  echo "  $f → $out"
done

echo "Listo: ${#DOCS[@]} documento(s)."
