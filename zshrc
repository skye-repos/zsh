# -*- mode: sh; -*-

## Check if zshrc is coming from correct place
if [[ ! -f "$ZDOTDIR/zshrc" || ! -L "$HOME/.zshrc" ]]; then
  echo "Please run setup.zsh first"
else
  source $HOME/.zprofile
  source $ZDOTDIR/auto-ls.zsh
  source $ZDOTDIR/aliases.zsh

  ## Emacs keybinds
  bindkey -e

  ## Completions
  compinit -d $ZDOTDIR/zcompdump

  ## History File
  HISTFILE="$ZDOTDIR/zsh_history"
  HISTSIZE=10000
  SAVEHIST=10000
  setopt appendhistory

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
  source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
