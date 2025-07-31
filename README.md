<div align='center'>
 <!-- Repo Title -->
 <h1>Filipondios' Dotfiles</h1>
</div>

![preview](https://github.com/user-attachments/assets/2ca891d7-d6b3-4478-8682-f85f60ce1bcc)

<h1>
  <a href="#--------"><img alt="" align="right" src="https://img.shields.io/github/stars/filipondios/dotfiles?color=0C0E0F&labelColor=0C0E0F&style=for-the-badge"/></a>
  <a href="#--------"><img alt="" align="left" src="https://badges.pufler.dev/visits/filipondios/dotfiles?style=flat-square&label=&color=0C0E0F&logo=github&logoColor=white&labelColor=0C0E0F"/></a>
</h1>


## About

Thanks for dropping by!

This is my personal repository for my [`Arch Linux`](https://archlinux.org/) dotfiles. I try to keep a minimalist but elegant environment at the same time, which is difficult and you might not find this repository to your liking. 

Here are some information about my setup:

- Window Manager: [`hyprland`](https://github.com/hyprwm/Hyprland)
- Terminal: [`alacritty`](https://github.com/alacritty/alacritty)
- Shell: [`zsh`](https://www.zsh.org/) using [oh my zsh](https://github.com/ohmyzsh/ohmyzsh)
- Editor: [`helix`](https://github.com/helix-editor/helix)
- Status Bar: [`waybar`](https://github.com/Alexays/Waybar)
- Application Launcher: [`wofi`](https://github.com/SimplyCEO/wofi)
- Widget Theme: [`orchis`](https://github.com/vinceliuice/Orchis-theme)
- Icon Theme: [`kora`](https://github.com/bikass/kora)
- Cursor Theme: [`capitaine cursors`](https://github.com/keeferrourke/capitaine-cursors)
- Font: [`Iosevka Nerd Font`](https://github.com/ryanoasis/nerd-fonts/tree/master)

## Other configs

In this repository, as you can see, there are other configurations (although quite basic) for other programs such as [emacs](https://github.com/emacs-mirror/emacs) in [.emacs.d](https://github.com/filipondios/dotfiles/tree/main/.emacs.d) and [vim]() in [.vimrc](https://github.com/filipondios/dotfiles/blob/main/.vimrc). While I’m not currently using them, I’d like to keep them stored here in case I change my mind in the future.

> [!NOTE]  
> On the other hand, in commit [2d8a6e2](https://github.com/filipondios/dotfiles/commit/2d8a6e29bd78205b26f317fdcf5b12354a77d543), you can find configurations for [i3](https://github.com/i3/i3), [xmonad](https://github.com/xmonad/xmonad), [rofi](https://github.com/davatorium/rofi), and possibly other Xorg-related config files.

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
