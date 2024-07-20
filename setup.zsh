# A quick setup file to move things to the right place.
if [[ -f $HOME/.zshrc ]]; then
  mv $HOME/.zshrc $HOME/.zshrc_old
  echo "Backed up old .zshrc!!"
fi

if [[ -f $HOME/.zprofile ]]; then
  mv $HOME/.zprofile $HOME/.zprofile_old
  echo "Backed up old .zprofile!!"
fi

CWD=$(pwd -P)
ZSHDIR=$HOME/.config/zsh

if [[ ! $CWD == $ZSHDIR ]]; then
  mkdir -p $ZSHDIR
  mv $CWD/* $ZSHDIR
fi

ln -s $ZSHDIR/zprofile $HOME/.zprofile
ln -s $ZSHDIR/zshrc $HOME/.zshrc
echo "Your ZSH config files are stored in ~/.config/zsh. Please restart the shell."
