#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# render-docs.sh — Renderiza los documentos markdown del Módulo 6 a HTML con
# el diseño del sitio (assets/styles.css + assets/docs.css).
#
# El .md sigue siendo la fuente; el .html es el render de lectura.
# Mismo patrón que presentacion_sesionN.{md,html}.
#
# Uso:
#   ./render-docs.sh              # todos los documentos de la lista
#   ./render-docs.sh notas-sesion-08.md ...   # solo algunos
#
# Requiere pandoc (>= 2.10). No requiere internet.
# ---------------------------------------------------------------------------
set -euo pipefail
cd "$(dirname "$0")"

KICKER="Módulo 6 — Inteligencia Artificial · IDT 601"
TEMPLATE="assets/doc-template.html"

# Documentos enlazados desde el sitio (idt601/index.html).
# Al agregar un documento nuevo al índice, sumarlo aquí.
DOCS=(
  "06_Inteligencia_Artificial.md"
  "Sesion_08_IA_Historia_Redes_Aprendizaje.md"
  "notas-sesion-08.md"
  "taller_sesion8_regla_dato_aprendizaje.md"
  "guia-solucion-docente-sesion8.md"
  "insumos/tarjetas-dinamica-s8.md"
  "Sesion_09_IA_LLMs_Prompting.md"
  "notas-sesion-09.md"
  "taller_sesion9_prompts_gestion_publica.md"
  "guia-prompting.md"
  "plantilla-captura-prompt.md"
  "guia-solucion-docente-sesion9.md"
  "insumos/tareas-practica-s9.md"
  "Sesion_10_IA_Agentes_Taller.md"
  "notas-sesion-10.md"
  "taller_sesion10_minisolucion_ia.md"
  "plantilla-diseno-flujo-agente.md"
  "plantilla-entrega-minisolucion.md"
  "guia-solucion-docente-sesion10.md"
  "insumos/casos-minisolucion-s10.md"
  "rubrica-modulo.md"
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
