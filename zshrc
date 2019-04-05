ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# DISABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(
  bundler
  docker
  docker-compose
  rsync
  rbenv
  nodenv
  aws
  kubectl
  kube-ps1
)

# Need to add aws to path before sourcing oh-my-zsh
export PATH="$PATH:/usr/local/aws/bin"

source $ZSH/oh-my-zsh.sh

# Load keys into keychain, ignoring errors
ssh-add -K 2>/dev/null

# Enable bash autocomplete
autoload bashcompinit
bashcompinit

export LANG=en_US.UTF-8

# RBENV
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

# HUB
export GITHUB_USER="koenpunt"
eval "$(hub alias -s)"

# Go
export GOPATH=$HOME/Development/go
export PATH=$GOPATH/bin:$PATH

# Heroku Toolbelt
export HEROKU_GIT_HOST_REGEX="heroku\.com(\..*)?"
export PATH=/usr/local/heroku/bin:$PATH

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# Node NPM
eval "`npm completion`"

# direnv
eval "$(direnv hook $SHELL)"

# DigitalOcean
source <(doctl completion zsh)

export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/emulator
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Rust package manager
export PATH="$HOME/.cargo/bin:$PATH"

# Sketch
export PATH=/Applications/Sketch.app/Contents/Resources/sketchtool/bin/:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
