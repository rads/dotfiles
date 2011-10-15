# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="../custom/themes/robbyrussell-modified"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="false"

plugins=(vi-mode git)
source $ZSH/oh-my-zsh.sh

bindkey '^S' history-incremental-search-forward
bindkey '^R' history-incremental-search-backward

[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local
