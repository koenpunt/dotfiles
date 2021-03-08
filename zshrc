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
  kubectl
  kube-ps1
)

source $ZSH/oh-my-zsh.sh

# Load keys into keychain, ignoring errors
ssh-add -K 2>/dev/null

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Enable zsh autocomplete
autoload -Uz compinit
compinit

# Enable bash autocomplete
autoload bashcompinit
bashcompinit

export LANG=en_US.UTF-8
export HOMEBREW_NO_AUTO_UPDATE=1


# RBENV
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

# HUB
export GITHUB_USER="koenpunt"
eval "$(hub alias -s)"

# Heroku Toolbelt
export HEROKU_GIT_HOST_REGEX="heroku\.com(\..*)?"
export PATH=/usr/local/heroku/bin:$PATH

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# Node NPM
eval "`command npm completion`"

# direnv
eval "$(direnv hook $SHELL)"

# DigitalOcean
if type doctl > /dev/null; then
  source <(doctl completion zsh)
fi

#eval "$(velero completion zsh)"

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

# AWS
if [ -f "/usr/local/bin/aws_completer" ]; then
  complete -C '/usr/local/bin/aws_completer' aws
fi

zmodload -u zsh/stat
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then . "$HOME/.nix-profile/etc/profile.d/nix.sh"; fi # added by Nix installer
