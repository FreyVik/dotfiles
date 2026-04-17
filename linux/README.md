# Linux

## Clipboard

This setup uses `wl-clipboard` for Wayland copy/paste and `cliphist` for clipboard history.

### Installed tools

- `wl-copy`: send text or files to the clipboard
- `wl-paste`: read the current clipboard contents
- `cliphist`: save and restore clipboard history

### How it works

`hyprland.conf` starts these watchers on login:

```conf
exec-once = wl-paste --type text --watch cliphist store
exec-once = wl-paste --type image --watch cliphist store
```

That means text and images you copy get stored in history automatically.

### Shortcuts

- `SUPER + SHIFT + V`: open clipboard history with `wofi`, then paste the selected entry
- Normal copy/paste still works inside apps with `Ctrl + C` and `Ctrl + V`

### Useful commands

```bash
wl-copy < file.txt
wl-paste
cliphist list
cliphist list | wofi --dmenu | cliphist decode | wl-copy
```

### Notes

- `wl-clipboard` is the Wayland equivalent of `xclip`/`xsel`.
- `cliphist` is useful when you want to recover something copied earlier.
