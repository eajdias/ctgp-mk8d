#!/usr/bin/env bash
# transplant.sh — empacota 1 pista CTGP como mod slot-replacement p/ MK8D 3.0.5 (Eden)
# Uso: ./transplant.sh CT_19 Gu_WaterPark "Green Hill Zone"
# Saída: ~/.local/share/eden/load/0100152000022000/CTGP-<nome>/romfs/...
set -euo pipefail
CT="${1:?ex: CT_19}"; SLOT="${2:?ex: Gu_WaterPark}"; NAME="${3:?ex: Green Hill Zone}"
SRC="$HOME/Downloads/mario-kart-8-dx-ctgp/atmosphere/contents/0100152000022000/romfs"
DST="$HOME/.local/share/eden/load/0100152000022000/CTGP-${NAME// /-}"
[ -d "$SRC/Course/$CT" ] || { echo "ERRO: $CT inexistente"; exit 1; }
rm -rf "$DST"; mkdir -p "$DST/romfs/Course/$SLOT" "$DST/romfs/Audio/Resource/Stream"
cp "$SRC/Course/$CT"/* "$DST/romfs/Course/$SLOT/"
for suf in F N; do
  src="$SRC/Audio/Resource/Stream/pBGM_${CT}_$suf.bfstm"
  [ -f "$src" ] && cp "$src" "$DST/romfs/Audio/Resource/Stream/pBGM_${SLOT}_$suf.bfstm"
done
echo "OK: $DST"
find "$DST" -type f | head -n 20
