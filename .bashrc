[[ $- != *i* ]] && return

# Enviroment variables & zsh
PATH="$PATH:$HOME/.local/bin/"
[ -f "/home/tux/.ghcup/env" ] && . "/home/tux/.ghcup/env"

# Aliases definition
alias ls="eza --icons --group-directories-first"
alias la="eza --icons --group-directories-first -a"
alias ll="eza --icons --group-directories-first -al"
alias tree="eza --icons -T"
alias treel="eza --icons -T -L"
alias grep="grep --color=auto"

# Custom start
pfetch
