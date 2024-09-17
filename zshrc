# -*- mode: sh; -*-

ZSHDIR=$HOME/.config/zsh

## History File
HISTFILE="$ZSHDIR/zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
  
## Emacs keybinds
bindkey -e

## Check if zshrc is coming from correct place
if [[ ! -f $ZSHDIR/zshrc || ! -L "$HOME/.zshrc" ]]; then
  echo "Please run setup.zsh first"
else
  source $HOME/.zprofile
  source $ZSHDIR/auto-ls.zsh
  source $ZSHDIR/aliases.zsh

  # Uncomment the following line to use case-sensitive completion.
  CASE_SENSITIVE="true"

  ## User configuration
  #Locale
  export LANG=en_US.UTF-8

  # Autosuggestions
  source $ZSHDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  
  # Autocompletions 
  source $ZSHDIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh
  bindkey              '^I'         menu-complete
  bindkey "$terminfo[kcbt]" reverse-menu-complete
  
# Prompt Theme
  eval "$(oh-my-posh init zsh --config "$ZSHDIR/oh-my-posh-theme.omp.toml")" 

# Syntax Highlighting
  source $ZSHDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
