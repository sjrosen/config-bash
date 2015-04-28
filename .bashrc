#------------#
#   bash     #
#------------#

umask 077   # file protection no read or write for others
            # umask 022 is no write but read for others

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
ulimit -c 0
set -o noclobber
alias cp='cp -i'    # prompt before overwriting file
alias mv='mv -i'    # prompt before overwriting file
alias rm='rm -i'    # prompt before removing file

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

# Put any local aliases or settings below this line.
export CLICOLOR=1
export EDITOR=vim
