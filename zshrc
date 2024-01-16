# -*- mode: sh; -*-
## PATH
export PATH="$PATH:$HOME/.local/bin"

## History File
HISTFILE="$HOME/.config/zsh/zsh_history"
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
source $HOME/.config/zsh/aliases

## Autocomplete
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

zstyle ':completion:*' completer _expand_alias _complete _ignored
zstyle ':completion:*:processes' command 'NOCOLORS=1 ps -U $(whoami)|sed "/ps/d"'
zstyle ':completion:*:processes' insert-ids menu yes select
zstyle ':completion:*:processes-names' command 'NOCOLORS=1 ps xho command|sed "s/://g"'
zstyle ':completion:*:processes' sort false

bindkey '^R' history-incremental-search-backward

## BAT as a manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

## Auto-ls when entering a directory
source ~/.config/zsh/auto-ls.zsh

## Emacs keybinds
bindkey -e

## Conda

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

## Theme
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh

## Syntax Highlighting - NOTE INSTALL THE PLUGIN
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
