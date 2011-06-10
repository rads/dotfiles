# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="robbyrussell"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="false"

plugins=(vi-mode git)
source $ZSH/oh-my-zsh.sh

[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local
