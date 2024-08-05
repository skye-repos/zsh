## Home brew stuff
if [[ -d "/opt/homebrew/bin/" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PKG_CONFIG="/opt/homebrew/bin/:$PKG_CONFIG"
fi

## PATH
if [[ ! -d "$HOME/.local/bin/" ]]; then
    mkdir -p $HOME/.local/bin
fi
export PATH="$PATH:$HOME/.local/bin"

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
