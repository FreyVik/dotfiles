#!/usr/bin/env bash
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

sudo pacman -Syu --noconfirm

# Init configuration
sudo pacman -S --needed --noconfirm git base-devel

# AUR helper
if ! command -v paru >/dev/null 2>&1; then
  tmpdir="$(mktemp -d)"
  git clone https://aur.archlinux.org/paru.git "$tmpdir/paru"
  (cd "$tmpdir/paru" && makepkg -si --noconfirm)
fi

# Shell
sudo pacman -S --needed --noconfirm zsh

# Terminal
sudo pacman -S --needed --noconfirm kitty

# Bluetooth
sudo pacman -S --needed --noconfirm blueman

# Browser
paru -S --needed --noconfirm --skipreview helium-browser-bin

# Node & npm
sudo pacman -S nodejs npm --needed -noconfirm

sudo npm install -g @openai/codex

# AI tools
paru -S --needed --noconfirm opencode

# Java & Python
sudo pacman -S --needed --noconfirm jdk25-openjdk python python-pip

# Fonts
sudo pacman -S --needed --noconfirm noto-fonts-emoji

# Status bar
sudo pacman -S --needed --noconfirm waybar

# Clipboard
sudo pacman -S --needed --noconfirm wl-clipboard cliphist

# Wallpaper
sudo pacman -S --needed --noconfirm swww

# Editors
paru -S --needed --noconfirm --skipreview visual-studio-code-bin intellij-idea-community-edition pycharm-community-edition

# Authentication Agent
sudo pacman -S --needed --noconfirm polkit-kde-agent
