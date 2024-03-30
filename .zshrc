# Change some variables
export ZSH="$HOME/.oh-my-zsh"
PATH="$PATH:/home/tux/.local/bin/"
source "$HOME/.cargo/env"

# Prompt
PROMPT="%F{1}%n%F{reset}@%m%f %~ "
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Aliases
alias ls='lsd --group-directories-first'
alias la='lsd -a'
alias ll='lsd -l'
alias nvim='lvim'
echo -e "" && neofetch

# Ghcup generated this
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
