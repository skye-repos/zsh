## PATH
if [[ ! -d "$HOME/.local/bin/" ]]; then
    mkdir -p $HOME/.local/bin
fi
export PATH="$PATH:$HOME/.local/bin"

if [[ -f "$HOME/.zprofile_local" ]]; then
  source "$HOME/.zprofile_local"
fi

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
