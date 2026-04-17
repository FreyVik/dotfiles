#!/usr/bin/env bash
set -euo pipefail

sudo pacman -Syu --noconfirm

# Init configuration
sudo pacman -S --needed --noconfirm git base-devel

# AUR helper
if ! command -v paru >/dev/null 2>&1; then
  tmpdir="$(mktemp -d)"
  trap 'rm -rf "$tmpdir"' EXIT
  git clone https://aur.archlinux.org/paru.git "$tmpdir/paru"
  (cd "$tmpdir/paru" && makepkg -si --noconfirm)
fi

# Shell
sudo pacman -S --needed --noconfirm zsh

# Terminal
sudo pacman -S --needed --noconfirm kitty

# Bluetooth
sudo pacman -S --needed --noconfirm blueman
