## PATH
if [[ ! -d "$HOME/.local/bin/" ]]; then
  mkdir -p $HOME/.local/bin
fi
export PATH="$PATH:$HOME/.local/bin"

if [[ -f "$HOME/.zprofile_local" ]]; then
  source "$HOME/.zprofile_local"
fi
