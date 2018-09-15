export PATH="$HOME/.nodenv/bin:bin:node_modules/.bin:/usr/local/share/npm/bin:$HOME/.local/bin:/usr/local/sbin:$PATH"
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
source ~/.zsh_plugins.sh

export EDITOR='vim'
export SSH_PUBLIC_KEY_PATH=$HOME/.ssh/id_rsa.pub

if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PIP_REQUIRE_VIRTUALENV=true
export PYTHONDONTWRITEBYTECODE=1


alias clear_history='echo "" >  ~/.zsh_history & exec $SHELL -l'
export GPG_TTY="tty"

unalias grv
