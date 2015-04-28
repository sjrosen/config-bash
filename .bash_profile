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

export EDITOR=vim
export VISUAL=$EDITOR

if [ -f $HOME/.bashrc ]; then
   source $HOME/.bashrc
fi
