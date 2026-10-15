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

KICKER="Módulo 4 — Integración de Datos · IDT 601"
TEMPLATE="assets/doc-template.html"

DOCS=(
  "04_Integracion_de_Datos.md"
  "guia-solucion-docente-sesion6.md"
  "notas-sesion-06.md"
  "plantilla-flujo-programado.md"
  "Sesion_06_Integracion_ETL_Orquestacion.md"
  "taller_sesion6_automatizar_pipeline.md"
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
