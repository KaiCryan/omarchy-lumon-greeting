#!/usr/bin/env bash
# Remove the Lumon terminal greeting.
set -euo pipefail

BRAND="$HOME/.config/omarchy/branding"
BASHRC="$HOME/.bashrc"

echo ":: removing the greeting hook from $BASHRC"
if grep -q 'LUMON_GREETED' "$BASHRC" 2>/dev/null; then
  tmp=$(mktemp)
  awk '
    /^# Lumon greeting: animated logo/ { skip=3; next }
    skip && /^fi[[:space:]]*$/          { skip=0; next }
    skip                                { next }
    { print }
  ' "$BASHRC" > "$tmp"
  # also drop a leading blank line left behind
  awk 'NR==1&&$0==""{next}{print}' "$tmp" > "$BASHRC"
  rm -f "$tmp"
fi

echo ":: removing installed files"
rm -f  "$BRAND"/lumon-greeting "$BRAND"/lumon-globe-spin \
       "$BRAND"/lumon-globe-ascii.txt "$BRAND"/lumon-globe-ascii-small.txt \
       "$BRAND"/lumon-wordmark-ascii.txt "$BRAND"/lumon-logo.txt "$BRAND"/mdr-digits.txt
rm -rf "$BRAND"/lumon-anims

echo ":: your $BRAND/lumon-greeting.conf is left in place — delete it by hand if you want"
echo "Done."
