ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="agnoster"
ZSH_THEME="bira"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(brew bundler capistrano composer gem git github node npm nvm rake rbenv rsync ruby textmate)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Load keys into keychain if keychain file exists
if type keychain > /dev/null
then
  keychain id_rsa
  source ~/.keychain/`uname -n`-sh
fi

export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin

# Enable bash autocomplete
autoload bashcompinit
bashcompinit

# DNS Flush
alias flushdns='dscacheutil -flushcache;sudo killall -HUP mDN

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

# NVM
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM

# Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

# AWS credentials
export EC2_HOME=$HOME/.aws
export EC2_PRIVATE_KEY=$(echo $HOME/.aws/pk-*.pem)
export EC2_CERT=$(echo $HOME/.aws/cert-*.pem)
export AWS_CREDENTIAL_FILE=$HOME/.aws/aws-credential-file.txt
export PATH="$EC2_HOME/bin:$PATH"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

