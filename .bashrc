if [ -n "$IsLinux" ]; then
   umask 077   # file protection no read or write for others
               # umask 022 is no write but read for others
   ulimit -c 0
fi

# append to the history file, don't overwrite it
shopt -s histappend

# Solarized color names
base03='\[\033[1;30m\]'
base02='\[\033[0;30m\]'
base01='\[\033[1;32m\]'
base00='\[\033[1;33m\]'
base0='\[\033[1;34m\]'
base1='\[\033[1;36m\]'
base2='\[\033[0;37m\]'
base3='\[\033[1;37m\]'
red='\[\033[0;31m\]'
orange='\[\033[1;31m\]'
green='\[\033[0;32m\]'
yellow='\[\033[0;33m\]'
blue='\[\033[0;34m\]'
magenta='\[\033[0;35m\]'
violet='\[\033[1;35m\]'
cyan='\[\033[0;36m\]'
white=$base3
black=$base02
c_reset='\[\033[0m\]'
 
# for python vex
function virtualenv_prompt() {
    if [ -n "$VIRTUAL_ENV" ]; then
        echo "(${VIRTUAL_ENV##*/}) "
    fi
}

function computer_name() {
    if [ -z "$COMPUTER_NAME" ]; then
       if [ -n "$IsMac" ]; then
          COMPUTER_NAME=`scutil --get ComputerName`
       elif [ -n "$IsLinux" ]; then
          COMPUTER_NAME=$(hostname -s)
       fi
    fi
    echo "${COMPUTER_NAME##*/} "
}

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    c_host=$magenta
else
    c_host=$green
fi

function set_prompt() {
   export PS1="\n$violet$(virtualenv_prompt)$c_host$(computer_name)$blue\w$yellow \$$c_reset "
}
export PROMPT_COMMAND=set_prompt

export CLICOLOR=1

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

set -o noclobber

# setup for python virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src
export VIRTUAL_ENV_DISABLE_PROMPT=1
source /usr/local/bin/virtualenvwrapper.sh

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] ; then
   . /etc/bash_completion
fi

# on Mac with homebrew
if [ -n "$IsMac" ] && hash brew 2>/dev/null; then
   if [ -f $(brew --prefix)/etc/bash_completion ]; then
       . $(brew --prefix)/etc/bash_completion
   fi
   if [ -f ~/.config/brew/init ]; then
       source ~/.config/brew/init
   fi
fi
