ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(brew composer gem bundler rbenv rsync ruby textmate hk aws web-search)

# Need to add aws to path before sourcing oh-my-zsh
export PATH="$PATH:/usr/local/aws/bin"

source $ZSH/oh-my-zsh.sh

# Load keys into keychain, ignoring errors
ssh-add -K 2>/dev/null

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
  app=$1
  server=$2
  if [ -z "$server" ]; then
	server=vito
	shift
  else
	shift 2
  fi
  ssh $server.fetchdns.nl tail /var/apps/$app/current/log/production.log $@
}

# HUB
export GITHUB_USER="koenpunt"
export HUB_PROTOCOL="https"
eval "$(hub alias -s)"

# Go
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Heroku Toolbelt
export HEROKU_GIT_HOST_REGEX="heroku\.com(\..*)?"
export PATH=/usr/local/heroku/bin:$PATH

# AWS credentials
#export EC2_HOME=$HOME/.aws
#export EC2_PRIVATE_KEY=$(echo $HOME/.aws/pk-*.pem)
#export EC2_CERT=$(echo $HOME/.aws/cert-*.pem)
export AWS_CREDENTIAL_FILE=$HOME/.aws/aws-credential-file.txt
export AWS_DEFAULT_REGION=eu-central-1

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# Node NPM
eval "`npm completion`"

# direnv
eval "$(direnv hook $SHELL)"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# Composer
export PATH=$HOME/.composer/vendor/bin:$PATH

# Docker
[ -f $HOME/.dockerrc ] && source $HOME/.dockerrc


export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# added by travis gem
[ -f /Users/koenpunt/.travis/travis.sh ] && source /Users/koenpunt/.travis/travis.sh

export EDITOR=/Applications/TextMate.app/Contents/Resources/mate
