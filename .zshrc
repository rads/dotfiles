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
alias emacs="/Users/rads/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n"
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

export EDITOR="mate -w"

function git(){hub $@}
function clj(){rlwrap clj $@}
alias mongod="mongod run --config /etc/mongod.conf"
alias mysqld_start="sudo launchctl load ~/Library/LaunchDaemons/com.mysql.mysqld.plist"
alias g="git"

# z
. ~/lib/z-zsh/z.sh
function precmd () {
  z --add "$(pwd -P)"
}