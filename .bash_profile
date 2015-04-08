# Add /usr/local/bin (homebrew install location) to front of PATH, first removing any other occurrences
export PATH=/usr/local/bin:`echo $PATH | sed -e 's|:/usr/local/bin||g'`
export EDITOR=vim
export VISUAL=$EDITOR

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
