#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
zip_file="$repo_root/general/Hack.zip"
target_dir="/usr/local/share/fonts/Hack"

sudo mkdir -p "$target_dir"
sudo bsdtar -xf "$zip_file" -C "$target_dir"
sudo fc-cache -f
