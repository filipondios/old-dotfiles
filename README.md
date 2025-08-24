
<div align='center'>
 <!-- Repo Title -->
 <h1>Filipondios' Dotfiles</h1>
</div>

![preview](https://github.com/user-attachments/assets/67b18ed0-cc73-4c59-8f4f-b4b10e4ecb8e)


<h1>
  <a href="#--------"><img alt="" align="right" src="https://img.shields.io/github/stars/filipondios/dotfiles?color=0C0E0F&labelColor=0C0E0F&style=for-the-badge"/></a>
  <a href="#--------"><img alt="" align="left" src="https://badges.pufler.dev/visits/filipondios/dotfiles?style=flat-square&label=&color=0C0E0F&logo=github&logoColor=white&labelColor=0C0E0F"/></a>
</h1>


## About

Thanks for dropping by!

This is my personal repository for my [`Arch Linux`](https://archlinux.org/) dotfiles. I try to keep a 
minimalist but elegant environment at the same time, which is difficult and you might not find this 
repository to your liking. 

Here are some information about my setup:

- Window Manager: [`hyprland`](https://github.com/hyprwm/Hyprland)
- Terminal: [`alacritty`](https://github.com/alacritty/alacritty)
- Shell: [`zsh`](https://www.zsh.org/) using [`oh my zsh`](https://github.com/ohmyzsh/ohmyzsh)
- Editor: [`helix`](https://github.com/helix-editor/helix)
- Status Bar: [`waybar`](https://github.com/Alexays/Waybar)
- Application Launcher: [`wofi`](https://github.com/SimplyCEO/wofi)
- Widget Theme: [`orchis`](https://github.com/vinceliuice/Orchis-theme)
- Icon Theme: [`kora`](https://github.com/bikass/kora)
- Cursor Theme: [`capitaine cursors`](https://github.com/keeferrourke/capitaine-cursors)
- Font: [`Iosevka Nerd Font`](https://github.com/ryanoasis/nerd-fonts/tree/master)

## Other configs

In this repository, at previous commits there are other configurations (although quite basic) for other programs
such as [emacs](https://github.com/emacs-mirror/emacs), [vim](https://github.com/vim/vim), [neovim](https://github.com/neovim/neovim),
[rofi](https://github.com/davatorium/rofi), [xmonad](https://github.com/xmonad/xmonad) and [i3](https://github.com/i3/i3). While I’m not currently using them, I’d like to note the commits of the different programmes mentioned before:

| Commit                                                                                             | Program/s          |
|:--------------------------------------------------------------------------------------------------:|--------------------|
| [13a2003](https://github.com/filipondios/dotfiles/commit/13a2003e8280157a7eb829ec4700b7bfc88a2297) | neovim, vim, emacs |
| [2d8a6e2](https://github.com/filipondios/dotfiles/commit/2d8a6e29bd78205b26f317fdcf5b12354a77d543) | i3                 |
| [13a0873](https://github.com/filipondios/dotfiles/commit/13a087341acdadb6b8123d0fb7f4ad8076e1c46f) | i3, xmonad         |
| [23f7ebd](https://github.com/filipondios/dotfiles/commit/23f7ebd070a8e3527194869935a4429dbfede9cc) | i3, xmonad, dwm    |

> [!NOTE]
> The Emacs configuration includes two files containing compilation flags for Emacs in terminal and GUI mode,
> both files being focused on a minimalist version of Emacs.

## Keybindigs (hyprland)

| Keys                        | Action                                |
|-----------------------------|---------------------------------------|
| `Win` + `Return`            | Open terminal                         |
| `Win` + `q`                 | Close focused window                  |
| `Win` + `d`                 | Open application launcher (rofi)      |
| `Win` + `[1..5]`            | Switch to workspace `1..5`            |
| `Win` + `Shift` + `[1..5]`  | Send Window to workspace `1..5`       |
| `Win` + `f`                 | Set focused window to fullscreen mode |
| `Win` + `space`             | Toggle window floating status         |  
| `Win` + `Shift` + `s`       | Take a screenshot                     |
| `Win` + `Shift` + `q`       | Kill/quit window manager              |

## Keybindings (helix)

| Mode     | Keys                | Action                          |
| -------- | --------------------|---------------------------------|
| `Normal` | `Alt` + `Right Key` | Switch to next buffer           |
| `Normal` | `Alt` + `Left Key`  | Switch to previous buffer       |
| `Normal` | `Alt` + `x`         | Close current buffer            |
| `Normal` | `Spacebar` + `f`    | Find file                       |
| `Normal` | `Alt` + `r`         | Reload config                   |
| `Normal` | `Alt` + `c`         | Toggle comments in current line |
| `Normal` | `c`                 | Enter command mode              |
| `Normal` | `Alt` + `n`         | New buffer                      |
