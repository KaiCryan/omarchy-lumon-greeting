#!/usr/bin/env bash
# Install the Lumon terminal greeting into Omarchy.
set -euo pipefail
cd "$(dirname "$0")"

BRAND="$HOME/.config/omarchy/branding"
BASHRC="$HOME/.bashrc"
CONF="$BRAND/lumon-greeting.conf"

echo ":: copying branding files -> $BRAND"
mkdir -p "$BRAND"
# everything except the .conf example
rsync -a --exclude 'lumon-greeting.conf.example' branding/ "$BRAND/" 2>/dev/null || {
  # rsync not installed: fall back to cp
  ( cd branding && find . -name 'lumon-greeting.conf.example' -prune -o -type f -print \
      | while read -r f; do mkdir -p "$BRAND/$(dirname "$f")"; cp "$f" "$BRAND/$f"; done )
}

chmod +x "$BRAND/lumon-greeting" "$BRAND/lumon-globe-spin"
find "$BRAND/lumon-anims" -maxdepth 1 -type f ! -name '_*' -exec chmod +x {} +

if [[ ! -e "$CONF" ]]; then
  cp branding/lumon-greeting.conf.example "$CONF"
  echo ":: wrote default config -> $CONF"
else
  echo ":: keeping your existing $CONF (see lumon-greeting.conf.example for new keys)"
fi

if ! grep -q 'LUMON_GREETED' "$BASHRC" 2>/dev/null; then
  echo ":: adding the greeting hook to $BASHRC"
  cat >> "$BASHRC" <<'EOF'

# Lumon greeting: animated logo on the first terminal after login, briefing after.
if [[ -z $LUMON_GREETED ]]; then
  export LUMON_GREETED=1
  [[ -x ~/.config/omarchy/branding/lumon-greeting ]] && ~/.config/omarchy/branding/lumon-greeting
fi
EOF
else
  echo ":: $BASHRC already has the hook"
fi

echo
echo "Done. Open a new terminal, or run:  lumon-greeting --preview"
