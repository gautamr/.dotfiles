export LANG=en_US.UTF-8

# For managing different versions use `asdf`; except for Java
. $(brew --prefix asdf)/libexec/asdf.sh

# For managing different Java version use `jenv`
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# For managing differen versions of NodeJS use `asdf`
# Add globally installed `npm` packages in $PATH
export PATH=$PATH:$(npm get prefix -g)/bin

# GCP
export CLOUDSDK_CONFIG=$HOME/.config/gcloud
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Android
export ANDROID_STUDIO_HOME="/Applications/Android Studio.app/Contents"
export ANDROID_AVD_HOME=$HOME/.android/avd

# Dart/Flutter setup
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME=$ANDROID_SDK_ROOT
export FLUTTER_HOME=/usr/local/Caskroom/flutter/latest/flutter
export DART_HOME=$FLUTTER_HOME/bin/cache/dart-sdk
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools/platform-tools:$DART_HOME/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Haskell
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# Python
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
#export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
#export WORKON_HOME=~/.virtualenvs
#export PROJECT_HOME=~/dev-projects
#export PROJECT_HOME=~/dev-projects-asconsoft
#source /usr/local/bin/virtualenvwrapper.sh
#export PATH=$PATH:$HOME/.virtualenvs/default/lib/python3.8/site-packages
export PATH=~/Library/Python/3.9/bin:$PATH

# zsh-autoenv
AUTOENV_FILE_ENTER=.autoenv.zsh
AUTOENV_FILE_LEAVE=.autoenv.zsh
AUTOENV_HANDLE_LEAVE=1
AUTOENV_LOOK_UPWARDS=1

# ZSH plugins management with zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "Tarrasch/zsh-autoenv"
zplug "zsh-users/zsh-completions"
#zplug "kiurchv/asdf.plugin.zsh", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3 # Should be loaded last.
zplug "zsh-users/zsh-syntax-highlighting", defer:3 # Should be loaded 2nd last.
zplug "tldr-pages/tldr-node-client", use:bin/completion/zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

# alias

eval "$(starship init zsh)"

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"
