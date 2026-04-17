#!/usr/bin/env bash
set -euo pipefail

sudo pacman -Syu --noconfirm

# KDE Plasma session
sudo pacman -S --needed --noconfirm plasma-meta

# Display manager
sudo pacman -S --needed --noconfirm sddm

# File manager
sudo pacman -S --needed --noconfirm dolphin

# File previews
sudo pacman -S --needed --noconfirm ffmpegthumbs

# Admin actions
sudo pacman -S --needed --noconfirm kio-admin

# Extra file actions
sudo pacman -S --needed --noconfirm kio-extras

# Desktop utilities
sudo pacman -S --needed --noconfirm kde-cli-tools

# Archive integration
sudo pacman -S --needed --noconfirm ark

# Wayland portals
sudo pacman -S --needed --noconfirm xdg-desktop-portal-kde

sudo systemctl enable sddm
