ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(brew bundler composer gem node npm rbenv rsync ruby rails textmate hk)

source $ZSH/oh-my-zsh.sh

# Load keys into keychain if keychain file exists
if type keychain > /dev/null
then
  keychain id_rsa
  source ~/.keychain/`uname -n`-sh
fi

# DNS Flush
alias flushdns='dscacheutil -flushcache;sudo killall -HUP mDNSResponder'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# SSH Auto CD
alias ssh='env SSH_PWD="$PWD" command ssh'

# Shortcut to editing local git config
alias vgit='vim .git/config'

alias r='rails'
alias h='heroku'

alias rapp='rails new --skip-gemfile --skip-test-unit --database=mysql -m https://raw.githubusercontent.com/fetch/rails-templates/master/default.rb'

alias opendev='open http://$(basename $PWD).dev'

# s3cmd aliases for different s3 accounts
alias s3koen='s3cmd -c ~/.s3cfg'
alias s3fetch='s3cmd -c ~/.s3cfg-fetch'

setopt complete_aliases

# Enable bash autocomplete
autoload bashcompinit
bashcompinit

# RBENV
export RBENV_ROOT="${HOME}/.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

# Git
#export PATH=/usr/local/git/bin:$PATH

# HUB
export GITHUB_USER="koenpunt"
eval "$(hub alias -s)"

# PHP
#export PATH=/usr/local/php5/bin:$PATH

# Override pg_config from php
#export PATH=/usr/local/bin:$PATH

# Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

# AWS credentials
export EC2_HOME=$HOME/.aws
export EC2_PRIVATE_KEY=$(echo $HOME/.aws/pk-*.pem)
export EC2_CERT=$(echo $HOME/.aws/cert-*.pem)
export AWS_CREDENTIAL_FILE=$HOME/.aws/aws-credential-file.txt
export PATH="$EC2_HOME/bin:$PATH"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

# NVM
export NVM_DIR="/Users/koenpunt/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads NVM

# Grunt
eval "$(grunt --completion=zsh)"
