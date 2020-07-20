# For managing different versions use "asdf"
. $(brew --prefix asdf)/asdf.sh

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Android
export ANDROID_STUDIO_HOME="/Applications/Android Studio.app/Contents"

# Flutter setup
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME=$ANDROID_SDK_ROOT
export FLUTTER_HOME=/usr/local/Caskroom/flutter/latest/flutter
export DART_HOME=$FLUTTER_HOME/bin/cache/dart-sdk
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools/platform-tools:$DART_HOME/bin"

# Haskell
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# Python
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

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
alias kubectl="HTTPS_PROXY=localhost:8888 kubectl"
alias istioctl="HTTPS_PROXY=localhost:8888 istioctl"
alias fluxctl="HTTPS_PROXY=localhost:8888 fluxctl"
alias helm="HTTPS_PROXY=localhost:8888 helm"

eval "$(starship init zsh)"