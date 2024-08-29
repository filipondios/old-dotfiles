<div align='center'>
 <h1>Dotfiles</h1>
</div>

![preview(1)](https://github.com/user-attachments/assets/3b4b7413-a5e0-461c-b1fe-5d6a04211a45)

<h1>
  <a href="#--------"><img alt="" align="right" src="https://img.shields.io/github/stars/dpv927/dotfiles?color=0C0E0F&labelColor=0C0E0F&style=for-the-badge"/></a>
  <a href="#--------"><img alt="" align="left" src="https://badges.pufler.dev/visits/dpv927/dotfiles?style=flat-square&label=&color=0C0E0F&logo=github&logoColor=white&labelColor=0C0E0F"/></a>
</h1>


## System Info
- OS: [Arch Linux](https://archlinux.org/)
- WM: [i3](https://archlinux.org/packages/extra/x86_64/i3-wm/)
- Terminal: [alacritty](https://archlinux.org/packages/extra/x86_64/alacritty/)
- Shell: [zsh](https://archlinux.org/packages/extra/x86_64/zsh/)
- Editor: [neovim](https://archlinux.org/packages/extra/x86_64/neovim/)
- Web browser: [firefox](https://archlinux.org/packages/extra/x86_64/firefox/)

## GTK Theming 
- Widget Theme: [Orchis](https://www.gnome-look.org/p/1357889)
- Icon Theme: [Kora](https://www.gnome-look.org/p/1256209)
- Cursor Theme: [Capitaine Cursors](https://www.gnome-look.org/p/1148692)

## Dendencies
```bash
sudo pacman -Syu && pacman -S\
 alacritty\
 btop\
 eza\
 flameshot\
 i3-wm\
 i3blocks\
 i3lock\
 i3status\
 neovim\
 ripgrep\
 xclip\
 xcolor\
 xsettingsd\
 zsh-autosuggestions\
 zsh-syntax-highlighting
```

## Keybindigs (i3)

Generic keybindings for all window managers:

| Keys                        | Action                                 |
|-----------------------------|---------------------------------------|
| `Win` + `Return`            | Open terminal                         |
| `Win` + `q`                 | Close focused window                  |
| `Win` + `d`                 | Open application launcher             |
| `Win` + `[1..5]`            | Switch to workspace `1..5`            |
| `Win` + `Shift` + `[1..5]`  | Send Window to workspace `1..5`       |
| `Win` + `i`                 | Increase focused window width         |
| `Win` + `j`                 | Decrease focused window width         |
| `Win` + `Shift` + `i`       | Increase focused window height        |
| `Win` + `Shift` + `j`       | Decrease focused window height        |
| `Win` + `Shift` + `[arrow]` | Move window inside a workspace        |
| `Win` + `f`                 | Set focused window to fullscreen mode |
| `Win` + `Shift` + `s`       | Take a screenshot                     |
| `Win` + `Shift` + `p`       | Start color desktop picker            |
| `Win` + `Shift` + `r`       | Restart window manager                |
| `Win` + `Shift` + `q`       | Kill/quit window manager              |

## Keybindings (neovim)

| Mode     | Keys                | Action                        |
| -------- | --------------------|-------------------------------|
| `Normal` | `Alt` + `n`         | Switch to next buffer         |
| `Normal` | `Alt` + `p`         | Switch to previous buffer     |
| `Normal` | `Alt` + `c`         | Close current buffer          |
| `Normal` | `Alt` + `s`         | Vertical split current buffer |
| `Normal` | `Space` + `f` + `f` | Find file                     |   |
| `Normal` | `Space` + `f` + `b` | Find buffer                   |
| `Normal` | `Space` + `f` + `s` | Find string in files          |
