[[ $- != *i* ]] && return

# Enviroment variables & zsh
PATH="$PATH:$HOME/.local/bin/"
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"
source $ZSH/oh-my-zsh.sh

# Aliases definition
alias ls="exa --icons --group-directories-first"
alias la="exa --icons --group-directories-first -a"
alias ll="exa --icons --group-directories-first -al"
alias tree="exa --icons -T"
alias treel="exa --icons -T -L"
alias grep="grep --color=auto"
alias nvim="lvim"

# Plugins
plugins=(git)
ZSH_PLUGINS="/usr/share/zsh/plugins"
ZSH_SYNTAX="zsh-syntax-highlighting"
ZSH_AUTOSG="zsh-autosuggestions"
source "$ZSH_PLUGINS/$ZSH_SYNTAX/$ZSH_SYNTAX.zsh"
source "$ZSH_PLUGINS/$ZSH_AUTOSG/$ZSH_AUTOSG.zsh"

# Custom start
pfetch

# ghcup enviroment
[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"
