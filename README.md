<div align='center'>
 <h1>Dotfiles</h1>
</div>

![preview1]
![preview2]

<h1>
  <a href="#--------"><img alt="" align="right" src="https://img.shields.io/github/stars/dpv927/dotfiles?color=0C0E0F&labelColor=0C0E0F&style=for-the-badge"/></a>
  <a href="#--------"><img alt="" align="left" src="https://badges.pufler.dev/visits/dpv927/dotfiles?style=flat-square&label=&color=0C0E0F&logo=github&logoColor=white&labelColor=0C0E0F"/></a>
</h1>


## System Info
- OS: [Arch Linux]
- WM: [i3]
- Terminal: [alacritty]
- Shell: [zsh]
- Editor: [neovim]
- Web browser: [firefox]

## UI Theming 
- Widget Theme: [Orchis]
- Icon Theme: [Kora]
- Cursor Theme: [Capitaine Cursors]
- Font: [FantasqueSansM Nerd Font]

## Dependencies
```bash
sudo pacman -Sy\
 alacritty\
 rofi\
 eza\
 i3-wm\
 i3status\
 neovim\
 ripgrep\
 xsettingsd\
 zsh-autosuggestions\
 zsh-syntax-highlighting\
 btop\
 flameshot\
 i3blocks\
 i3lock\
 xclip\
 xcolor\
```

## Neovim 

I use [packer] as nvim's package manager. You must install it, and then 
type the following command in your terminal to install all my plugins
without reciving an error when opening nvim for the first time:
```bash 
# Equivalent to :PackerSync inside nvim
nvim -c PackerSync
```

## Keybindigs (i3)

Generic keybindings for all window managers:

| Keys                        | Action                                |
|-----------------------------|---------------------------------------|
| `Win` + `Return`            | Open terminal                         |
| `Win` + `q`                 | Close focused window                  |
| `Win` + `d`                 | Open application launcher (rofi)      |
| `Win` + `[1..5]`            | Switch to workspace `1..5`            |
| `Win` + `Shift` + `[1..5]`  | Send Window to workspace `1..5`       |
| `Win` + `i`                 | Increase focused window width         |
| `Win` + `j`                 | Decrease focused window width         |
| `Win` + `Shift` + `i`       | Increase focused window height        |
| `Win` + `Shift` + `j`       | Decrease focused window height        |
| `Win` + `Shift` + `[arrow]` | Move window inside a workspace        |
| `Win` + `f`                 | Set focused window to fullscreen mode |
| `Win` + `period`            | Toggle window floating status         |  
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
| `Normal` | `Space` + `f` + `f` | Find file                     |
| `Normal` | `Space` + `f` + `b` | Find buffer                   |
| `Normal` | `Space` + `f` + `s` | Find string in files          |


<!-- Config screenshots -->
[preview1]: https://github.com/user-attachments/assets/6fa81362-f935-4add-87d3-5432a204694e
[preview2]: https://github.com/user-attachments/assets/c3424012-88d0-4e1f-8646-9de648f8a630

<!-- System Info -->
[Arch Linux]: https://archlinux.org/
[i3]: https://archlinux.org/packages/extra/x86_64/i3-wm/
[alacritty]: https://archlinux.org/packages/extra/x86_64/alacritty/
[zsh]: https://archlinux.org/packages/extra/x86_64/zsh/
[neovim]: https://archlinux.org/packages/extra/x86_64/neovim/
[firefox]: https://archlinux.org/packages/extra/x86_64/firefox/

<!-- UI Theming -->
[Orchis]: https://www.gnome-look.org/p/1357889
[Kora]: https://www.gnome-look.org/p/1256209
[Capitaine Cursors]: https://www.gnome-look.org/p/1148692
[FantasqueSansM Nerd Font]: https://www.nerdfonts.com/font-downloads

<!-- Neovim -->
[packer]: https://github.com/wbthomason/packer.nvim
