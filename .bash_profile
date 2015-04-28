# give ^R some data to work with
export HISTSIZE=5000

# Add /usr/local/bin (homebrew install location) to front of PATH, first removing any other occurrences
export PATH=`echo "/usr/local/bin:$PATH" | sed -e 's|:/usr/local/bin||g'`
export EDITOR=vim
export VISUAL=$EDITOR

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
