ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(brew bundler composer gem node npm rbenv rsync ruby textmate)

source $ZSH/oh-my-zsh.sh

# Load keys into keychain if keychain file exists
if type keychain > /dev/null
then
  keychain id_rsa
  source ~/.keychain/`uname -n`-sh
fi

# DNS Flush
alias flushdns='dscacheutil -flushcache;sudo killall -HUP mDNS'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# SSH Auto CD
alias ssh='env SSH_PWD="$PWD" command ssh'

#alias rake='noglob bundled_rake'

setopt complete_aliases

# Enable bash autocomplete
autoload bashcompinit
bashcompinit

# HUB
export GITHUB_USER="koenpunt"
eval "$(hub alias -s)"

# RBENV
export RBENV_ROOT="${HOME}/.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

# PHP 
export PATH=/usr/local/php5/bin:$PATH

# Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

# AWS credentials
export EC2_HOME=$HOME/.aws
export EC2_PRIVATE_KEY=$(echo $HOME/.aws/pk-*.pem)
export EC2_CERT=$(echo $HOME/.aws/cert-*.pem)
export AWS_CREDENTIAL_FILE=$HOME/.aws/aws-credential-file.txt
export PATH="$EC2_HOME/bin:$PATH"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

[ -s "/Users/koenpunt/.nvm/nvm.sh" ] && . "/Users/koenpunt/.nvm/nvm.sh" # This loads NVM

# Grunt
eval "$(grunt --completion=zsh)"
