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

export CLICOLOR=1

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

set -o noclobber

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] ; then
   . /etc/bash_completion
fi

# fancy prompt
case "$TERM" in
   xterm*)
     PSSUF='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
     PS1="\n\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PSSUF"
    ;;
   *)
    PS1='\n${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac
