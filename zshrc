ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(brew composer gem bundler rbenv rsync ruby textmate hk aws)

# Use non-Apple git
export PATH="/usr/local/git/bin:$PATH"

# Need to add aws to path before sourcing oh-my-zsh
export PATH="$PATH:/usr/local/aws/bin"

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

alias apps='cd /private/shares/apps/$1'

alias r='rails'

alias rapp='rails new --skip-gemfile --skip-test-unit --database=mysql -m https://raw.githubusercontent.com/fetch/rails-templates/master/default.rb'

alias opendev='open http://$(basename $PWD).dev'

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

productionlog(){
  server=$2
  if [ -z "$server" ]; then
	server=vito
  fi
  ssh $server.fetchdns.nl tail /var/apps/$1/current/log/production.log -f
}

# HUB
export GITHUB_USER="koenpunt"
eval "$(hub alias -s)"

# Go
export GOPATH=$HOME/gocode
export PATH=$GOPATH/bin:$PATH

# Heroku Toolbelt
export HEROKU_GIT_HOST_REGEX="heroku\.com(\..*)?"
export PATH=/usr/local/heroku/bin:$PATH

# AWS credentials
#export EC2_HOME=$HOME/.aws
#export EC2_PRIVATE_KEY=$(echo $HOME/.aws/pk-*.pem)
#export EC2_CERT=$(echo $HOME/.aws/cert-*.pem)
export AWS_CREDENTIAL_FILE=$HOME/.aws/aws-credential-file.txt
export AWS_DEFAULT_REGION=eu-central-1
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# Grunt
eval "$(grunt --completion=zsh)"

# Node NPM
eval "`npm completion`"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# Brew PHP
export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"

# Composer
export PATH=$HOME/.composer/vendor/bin:$PATH

# Docker
[ -f $HOME/.dockerrc ] && source $HOME/.dockerrc
