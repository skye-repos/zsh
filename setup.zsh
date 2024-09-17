# A quick setup file to move things to the right place.
CWD=$(pwd -P)
ZSHDIR=$HOME/.config/zsh

if [[ ! $CWD == $ZSHDIR ]]; then
  mkdir -p $ZSHDIR
  mv $CWD/* $ZSHDIR
fi

if [[ -f $HOME/.zshrc ]]; then
  mv $HOME/.zshrc $ZSHDIR/zshrc_backup
  echo "Backed up zshrc file to $ZSHDIR/zshrc_backup!!"
fi

if [[ -f $HOME/.zprofile ]]; then
  mv $HOME/.zprofile $ZSHDIR/zprofile_local
  ln -s $ZSHDIR/zprofile_local $HOME/.zprofile_local
  echo "Previous .zprofile now being loaded from .zprofile_local!!\nModifications in .zprofile may be overwritten when pulling from repository.\nI suggest quickly skimming the new .zprofile to remove redundant and duplicated lines."
fi

ln -s $ZSHDIR/zprofile $HOME/.zprofile
ln -s $ZSHDIR/zshrc $HOME/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSHDIR/zsh-autosuggestions/
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSHDIR/zsh-autocomplete/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.config/zsh/zsh-syntax-highlighting/
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d $HOME/.local/bin/

echo "Your ZSH config files are stored in $ZSHDIR. Please restart the shell."
