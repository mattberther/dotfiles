ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mattberther"
DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_TITLE="true"

sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'

export PATH="bin:node_modules/.bin:/usr/local/share/npm/bin:$PATH"

export EDITOR='vim'
export SSH_PUBLIC_KEY_PATH=$HOME/.ssh/id_rsa.pub

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PIP_REQUIRE_VIRTUALENV=true

# Plugins need to load after rbenv initialization
plugins=(git mattberther docker docker-compose)
source $ZSH/oh-my-zsh.sh

alias dokku='$HOME/src/dokku/contrib/dokku_client.sh'

source dnvm.sh


# tabtab source for yo package
# uninstall by removing these lines or running `tabtab uninstall yo`
[[ -f /usr/local/lib/node_modules/yo/node_modules/tabtab/.completions/yo.zsh ]] && . /usr/local/lib/node_modules/yo/node_modules/tabtab/.completions/yo.zsh
