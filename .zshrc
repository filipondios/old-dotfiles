[[ $- != *i* ]] && return

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="half-life"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)
source "$ZSH/oh-my-zsh.sh"

# Cargo :O !!!
. "$HOME/.cargo/env"

# Aliases definition
alias ls="eza --icons --group-directories-first -loh --no-time"
alias la="eza --icons --group-directories-first -laoh --no-time"
alias tree="eza --icons -T"
alias grep="grep --color=auto"
alias updates="checkupdates"
alias packages="pacman -Qe"

# Print system thingies
fastfetch
