#!/usr/bin/env bash
set -euo pipefail

sudo pacman -Syu --noconfirm

# File manager
sudo pacman -S --needed --noconfirm thunar

# File operations
sudo pacman -S --needed --noconfirm gvfs

# Thumbnails
sudo pacman -S --needed --noconfirm tumbler

# Removable media
sudo pacman -S --needed --noconfirm thunar-volman

# Archive support
sudo pacman -S --needed --noconfirm thunar-archive-plugin

# XDG helpers
sudo pacman -S --needed --noconfirm xdg-utils
