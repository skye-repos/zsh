# -*- mode: sh; -*-
# Common aliases for relatively common things.
alias sudo='sudo ' # Space at the end of aliases successive alias completion

# Make cd-ing up directories easier.
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

BREW='/opt/homebrew/bin'
PORT='/opt/local/bin'
UBIN='/usr/bin'

if [[ -x $BREW/nvim || -x $PORT/nvim || -x $UBIN/nvim ]]; then
  export EDITOR='nvim'
fi

if [[ -x $BREW/eza || -x $PORT/eza || -x $UBIN/eza || -x $HOME/.cargo/bin/eza ]]; then
  alias ls='eza '
fi

if [[ -x $BREW/pinentry-mac || -x $PORT/pinentry-mac ]]; then
  alias pinentry='pinentry-mac '
fi

if [[ -x $UBIN/batcat ]]; then
	alias cat='batcat '
  export MANROFFOPT='-c'
  export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
  export BAT_THEME="ansi"
fi

if [[ -x $BREW/bat || -x $PORT/bat || -x $UBIN/bat ]]; then
  alias cat='bat '
  export MANROFFOPT='-c'
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export BAT_THEME="ansi"
fi

## Homebrew aliases
if [[ -x $BREW/brew ]]; then
  alias install='brew install '
  alias search='brew search '
  alias remove='brew uninstall '
  alias update='brew update '
  alias upgrade='brew upgrade '
fi

## MacPorts aliases
if [[ -x $PORT/port ]]; then
  alias install='sudo port install '
  alias search='sudo port search '
  alias remove='sudo port uninstall '
  alias update='sudo port selfupdate'
  alias upgrade='sudo port upgrade '
fi

if [[ -x $UBIN/apt ]]; then
  alias install='sudo apt install '
  alias search='sudo apt search '
  alias remove='sudo apt remove '
  alias update='sudo apt update'
  alias upgrade='sudo apt upgrade '
  alias sctl='systemctl '
  alias jctl='journalctl '
fi

if [[ -x $UBIN/dnf ]]; then
  alias install='sudo dnf install '
  alias search='sudo dnf search '
  alias remove='sudo dnf remove '
  alias update='sudo dnf updateinfo'
  alias upgrade='sudo dnf upgrade '
  alias sctl='systemctl '
  alias jctl='journalctl '
fi

# Changes to the 'ls' family of commands.
alias ll='ls -al --group-directories-first' # The obvious answer.
alias l='ll -h' # Human readable.
alias lg='ll --git' # List git status of individual files.
alias lln='ll | grep --color=always "\-> $HOME" | awk '\''{print $7 $8 $9}'\'' ' # View symlinks in current folder.
alias llnv='ll | grep --color=always "\-> $HOME" -v | awk '\''{print $7}'\'' ' # View everything not symlinked in current folder.

# Ask for confirmation on basic shit.
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
