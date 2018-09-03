export ZSH=$HOME/.oh-my-zsh
fpath=( "$HOME/.zfunctions" $fpath )

export PATH="$HOME/.pyenv/bin:$HOME/.rbenv/bin:$HOME/.nodenv/bin:bin:node_modules/.bin:/usr/local/share/npm/bin:$HOME/.local/bin:/usr/local/sbin:$PATH"

export EDITOR='vim'
export SSH_PUBLIC_KEY_PATH=$HOME/.ssh/id_rsa.pub

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PIP_REQUIRE_VIRTUALENV=true
export PYTHONDONTWRITEBYTECODE=1

# Plugins need to load after rbenv initialization
plugins=(git docker docker-compose zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias clear_history='echo "" >  ~/.zsh_history & exec $SHELL -l'

autoload -U promptinit; promptinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

prompt pure

