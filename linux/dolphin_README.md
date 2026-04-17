# Dolphin setup

This setup is for a full KDE Plasma + Dolphin environment.

## Installed by script

- `plasma-meta`: Plasma session and core KDE desktop
- `sddm`: login manager
- `dolphin`: file manager
- `ffmpegthumbs`: video thumbnails
- `kio-admin`: admin file actions
- `kio-extras`: extra file protocols and actions
- `kde-cli-tools`: KDE desktop utilities
- `ark`: archive integration
- `xdg-desktop-portal-kde`: Wayland portal backend

## Manual steps

1. Enable and boot into Plasma via SDDM.
2. In Plasma, open `System Settings` and set `Dolphin` as the default file manager.
3. If you want directories to open with Dolphin from XDG tools, set the default desktop file for `inode/directory` to `org.kde.dolphin.desktop`.
4. If video thumbnails do not appear, keep `ffmpegthumbs` installed.
5. If you want admin access inside Dolphin, keep `kio-admin` installed.

## Notes

- Dolphin uses Qt6 in current KDE Plasma.
- Qt5 is not needed for Dolphin itself.
- Qt5 is only needed for apps that depend on Qt5, like your VLC GUI package.
