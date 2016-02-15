ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mattberther"
DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_TITLE="true"

sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'

export PATH="bin:node_modules/.bin:/usr/local/share/npm/bin:$PATH"

export EDITOR='vim'

export SSH_PUBLIC_KEY_PATH=$HOME/.ssh/id_rsa.pub

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Plugins need to load after rbenv initialization
plugins=(git mattberther docker)
source $ZSH/oh-my-zsh.sh

alias dokku='$HOME/src/github/dokku/contrib/dokku_client.sh'

eval "$(docker-machine env dev)"
