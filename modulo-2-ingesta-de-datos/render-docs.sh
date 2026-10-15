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

KICKER="Módulo 2 — Ingesta de Datos · IDT 601"
TEMPLATE="assets/doc-template.html"

DOCS=(
  "02_Ingesta_de_Datos.md"
  "datos/FUENTE.md"
  "notas-sesion-02.md"
  "notas-sesion-03.md"
  "Sesion_02_Ingesta_Conceptos_Metodos_Herramientas.md"
  "Sesion_03_demo_pipeline_herramientas.md"
  "Sesion_03_Ingesta_Patrones_Pipelines.md"
  "taller_sesion2_practica_online.md"
  "taller_sesion3_pipeline_online.md"
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
