[[ $- != *i* ]] && return

# Enviroment variables & zsh
PATH="$PATH:$HOME/.local/bin/:$HOME/.local/bin/"
ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Change prompt
PS1="%F{1}%n%F{reset}@%m%f %~ "

# Aliases definition
alias ls="eza --icons --group-directories-first"
alias la="eza --icons --group-directories-first -a"
alias ll="eza --icons --group-directories-first -al"
alias tree="eza --icons -T"
alias treel="eza --icons -T -L"
alias grep="grep --color=auto"

# Plugins
plugins=(git)
ZSH_PLUGINS="/usr/share/zsh/plugins"
ZSH_SYNTAX="zsh-syntax-highlighting"
ZSH_AUTOSG="zsh-autosuggestions"
source "$ZSH_PLUGINS/$ZSH_SYNTAX/$ZSH_SYNTAX.zsh"
source "$ZSH_PLUGINS/$ZSH_AUTOSG/$ZSH_AUTOSG.zsh"

# Load ghcup-env
[ -f "/home/tux/.ghcup/env" ] && . "/home/tux/.ghcup/env"
