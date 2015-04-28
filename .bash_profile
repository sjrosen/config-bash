# give ^R some data to work with
export HISTSIZE=5000

# Some programs honor VISUAL, so set this if EDITOR is set.
if [ ! -z "$EDITOR" ] ; then
   export VISUAL=$EDITOR
fi

if [ -f $HOME/.bashrc ] ; then
  . $HOME/.bashrc
fi
