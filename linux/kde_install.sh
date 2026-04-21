set -euo pipefail

sudo -v

tmpdir=""

while true; do
  sudo -n true
  sleep 60
done &

sudo_keepalive_pid="$!"

cleanup() {
  kill "$sudo_keepalive_pid" >/dev/null 2>&1 || true
  if [ -n "$tmpdir" ]; then
    rm -rf "$tmpdir"
  fi
}

trap cleanup EXIT

sudo pacman -S --needed --noconfirm plasma kde-system