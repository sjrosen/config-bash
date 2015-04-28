# give ^R some data to work with
export HISTSIZE=5000

case "$(uname)" in
   'Darwin')
      export IsMac=1
      ;;
   'Linux')
      export IsLinux=1
      ;;
   *) ;;
esac

if [ -n "$IsMac" ] ; then
   # Add /usr/local/bin (homebrew install location) to front of PATH, first removing any other occurrences
   export PATH=`echo "/usr/local/bin:$PATH" | sed -e 's|:/usr/local/bin||g'`
fi

export EDITOR=vim
export VISUAL=$EDITOR

if [ -f $HOME/.bashrc ]; then
   source $HOME/.bashrc
fi
