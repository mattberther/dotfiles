ZSHA_BASE=$HOME/.zsh-antigen
source $ZSHA_BASE/antigen.zsh

antigen bundle git
antigen bundle docker
antigen bundle docker-compose
antigen bundle golang
antigen bundle pyenv
antigen bundle tmux
antigen bundle tmuxinator

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen bundle cswl/zsh-rbenv

if [[ $OSTYPE =~ '^darwin' ]]; then
    antigen bundle brew
fi

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply

HISTFILE=$ZSHA_BASE/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

if [[ $OSTYPE =~ '^darwin' ]]; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    export CLICOLOR=1
    export CLICOLOR_FORCE=1
else
    alias ls='ls --color=auto'
fi

[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" history-substring-search-up
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" history-substring-search-down

export PATH="$HOME/.nodenv/bin:bin:node_modules/.bin:/usr/local/share/npm/bin:$HOME/.local/bin:/usr/local/sbin:$PATH"

export EDITOR='vim'
export SSH_PUBLIC_KEY_PATH=$HOME/.ssh/id_rsa.pub

if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PIP_REQUIRE_VIRTUALENV=true
export PYTHONDONTWRITEBYTECODE=1


alias clear_history='echo "" >  ~/.zsh_history & exec $SHELL -l'
export GPG_TTY="tty"

