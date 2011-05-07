# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="robbyrussell-modified"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="false"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$(defaults read "${HOME}/.MacOSX/environment" PATH)
alias e="~/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias enw="~/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -nw"
alias emacs="~/Applications/Emacs.app/Contents/MacOS/Emacs"
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

export EDITOR="~/bin/vim"
export TERM="xterm-256color"

function git(){hub $@}
alias mongod="mongod run --config /etc/mongod.conf"
alias g="git"

# z
. ~/lib/z-zsh/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

if [ -z "$TMPDIR" ]; then
export TMPDIR=`getconf DARWIN_USER_TEMP_DIR`
fi
