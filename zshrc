# -*- mode: sh; -*-

## Create ZSH Config Directory
if [[ ! -d "$HOME/.config/zsh" ]]; then
    mkdir -p $HOME/.config/zsh
fi
ZSHDIR="$HOME/.config/zsh"

## PATH
if [[ ! -d "$HOME/.local/bin/" ]]; then
    mkdir -p $HOME/.local/bin
fi
export PATH="$PATH:$HOME/.local/bin"

if [[ ! -L "$HOME/.zprofile" ]]; then
  mv $HOME/.zprofile $HOME/.zprofile_old
  ln -s $ZSHDIR/zprofile $HOME/.zprofile
  source $HOME/.zprofile
  echo "Backed up old .zprofile!!"
else
  source $HOME/.zprofile
fi

## History File
HISTFILE="$ZSHDIR/zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

## User configuration
export LANG=en_US.UTF-8

## Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacs'
else
  export EDITOR='emacsclient'
fi

## Aliases
source $ZSHDIR/aliases.zsh

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

## BAT as a manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

## Auto-ls when entering a directory
source $ZSHDIR/auto-ls.zsh

## Emacs keybinds
bindkey -e

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
