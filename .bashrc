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
        export COMPUTER_NAME=`scutil --get ComputerName`
    fi
    echo "${COMPUTER_NAME##*/} "
}

export CLICOLOR=1

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    c_host=$magenta
else
    c_host=$green
fi

PS1="\n$violet$(virtualenv_prompt)$c_host$(computer_name)$blue\w$yellow \$$c_reset "
# export PS1="\n$(virtualenv_prompt)$(computer_name):\w> "
#export PS1="\[$blue\]$(virtualenv_prompt)\[$red\]$(computer_name)\[$black\]:\[$blue\]\w> \[$black\]"
# vex autocompletion (not working currently)
# eval "$(vex --shell-config bash)"

# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.config/brew/init ]; then
    source ~/.config/brew/init
fi
