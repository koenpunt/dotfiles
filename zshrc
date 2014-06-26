ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(gem bundler composer gem node npm rake rbenv rsync ruby debian)

source $ZSH/oh-my-zsh.sh

# Load keys into keychain if keychain file exists
if type keychain > /dev/null
then
  keychain id_rsa
  source ~/.keychain/`uname -n`-sh
fi

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/X11R6/bin
export PATH=/usr/local/git/bin:$PATH

export PATH=/usr/local/composer/bin:$PATH

autoload bashcompinit
bashcompinit

# Node Version Manager
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"  # This loads NVM
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export RPROMPT='[%?]'
# Hub
export GITHUB_USER="koenpunt"
eval "$(hub alias -s)"

. $HOME/.aws/keys

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

if [ -n "$SSH_PWD" ] && [ -d "$SSH_PWD" ]; then
   cd "$SSH_PWD"
   unset SSH_PWD
fi

