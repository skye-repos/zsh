# -*- mode: sh; -*-

ZSHDIR="$HOME/.config/zsh"
## Check if zshrc is coming from correct place
if [[ ! -f "$ZSHDIR/zshrc" || ! -L "$HOME/.zshrc" ]]; then
  echo "Please run setup.zsh first"
else
  source $HOME/.zprofile
  source $ZSHDIR/auto-ls.zsh
  source $ZSHDIR/aliases.zsh

  ## Emacs keybinds
  bindkey -e

  ## History File
  HISTFILE="$ZSHDIR/zsh_history"
  HISTSIZE=10000
  SAVEHIST=10000
  setopt appendhistory

  # Uncomment the following line to use case-sensitive completion.
  CASE_SENSITIVE="true"

  ## User configuration
  export LANG=en_US.UTF-8
fi

## Autosuggestions
if [[ -d "$ZSHDIR/zsh-autosuggestions" ]]; then
    source $ZSHDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSHDIR/zsh-autosuggestions/
    source $ZSHDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

## Completions
if [[ -d "$ZSHDIR/zsh-autocomplete" ]]; then
    source $ZSHDIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh
else
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSHDIR/zsh-autocomplete/
    source $ZSHDIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh
fi

bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

## Theme
if [[ -f "$HOME/.local/bin/oh-my-posh" ]]; then
    eval "$(oh-my-posh init zsh --config "$ZSHDIR/oh-my-posh-theme.omp.toml")"
else
    curl -s https://ohmyposh.dev/install.sh | bash -s -- -d $HOME/.local/bin/
    eval "$(oh-my-posh init zsh --config "$ZSHDIR/oh-my-posh-theme.omp.toml")"
fi

## Syntax Highlighting
if [[ -d "$ZSHDIR/zsh-syntax-highlighting" ]]; then
    source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.config/zsh/zsh-syntax-highlighting/
    source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
