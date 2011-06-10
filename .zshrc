# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="robbyrussell"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="false"

plugins=(vi-mode git)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$(defaults read "${HOME}/.MacOSX/environment" PATH)
alias e="~/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias enw="~/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -nw"
alias emacs="~/Applications/Emacs.app/Contents/MacOS/Emacs"
alias vim="~/Applications/MacVim.app/Contents/MacOS/Vim"
alias v="vim -f"
alias work="sudo cp ~/lib/hosts.work /etc/hosts"
alias play="sudo cp ~/lib/hosts.play /etc/hosts"

export EDITOR="vim -f"
export TERM="xterm-256color"

function git(){hub $@}
alias g="git"

# z
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

if [ -z "$TMPDIR" ]; then
export TMPDIR=`getconf DARWIN_USER_TEMP_DIR`
fi
