# .dotfiles

`.dotfiles` for [@gautamr](https://github.com/gautamr) personal development tools

## Ref
http://sourabhbajaj.com/mac-setup/
https://www.robinwieruch.de/mac-setup-web-development/


## Tools

- https://github.com/anishathalye/dotbot
- https://starship.rs
- https://github.com/Tarrasch/zsh-autoenv
- https://github.com/tldr-pages/tldr
- https://asdf-vm.com/#/core-manage-asdf
- https://clojure-lsp.io/installation/
- https://github.com/sharkdp/fd

Before running `\install` always update the dotbot

```sh
git submodule update --remote dotbot
```
## Macos setup

```sh
mkdir -p /Users/gautamr/screenshots
defaults write com.apple.screencapture location /Users/gautamr/screenshots  && killall SystemUIServer
```

## xcode command line tools

we need Xcode IDE as we are not building software for Mac - flutter cross-platform 
### Install

xcode-select --install
### Update: you can try to list any updates and install with `softwareupdate`

softwareupdate --list

## Homebrew

### Install

https://brew.sh/

### Update

```sh
# First update the formulae and Homebrew itself
brew update
# https://docs.brew.sh/FAQ
```

### check

```sh
brew outdated
brew list --versions
brew cleanup --dry-run
brew cleanup
brew config

brew tap                     # list tapped repositories
brew tap <tapname>           # add tap
brew untap <tapname>         # remove a tap
```

### fonts

```sh
brew install --cask font-fira-code
brew install --cask font-jetbrains-mono
```

### essentials

```sh
brew install --cask alfred

brew install --cask iterm2
brew install starship

#brew install ispell
#brew install tldr

# for multiple java version
brew install jenv

# Dart and flutter
brew install asdf

```

### tools

```sh
brew install ripgrep
brew install fd
brew install --cask emacs
brew install --cask sublime-text
brew install kubectx
brew install --cask visual-studio-code
```
#### NeoVIM

```sh
# commands
TSInstall <lang>
TSInstallInfo

# key
ctrl + n -> file tree
m -> mark a file
a -> new file
c -> copy file
p -> paste file

# File Navigation
SPC f f -> find file
SPC f b -> find ONLY on open buffer

# Window Navigation
ctrl + j/k/h/l




```

# ecosystems
## jvm
### java
```sh
# install openjdk@17
brew install openjdk@17
sudo ln -sfn /usr/local/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk

# install openjdk@11
brew install openjdk@11
# For the system Java wrappers to find this JDK, symlink it with
sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

# insttall latest jdk
brew install openjdk
# For the system Java wrappers to find this JDK, symlink it with
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

# install mvn
brew install mvn
```
### Multiple Java versions
We use `jenv` to manage multiple Java versions throughout the system
```sh
brew install jenv
# list down the jdk versions install
ls -al /Library/Java/JavaVirtualMachines/

# add jdk 17
jenv add /Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home
# add jdk 11
jenv add /Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home
# add jdk latest
jenv add /Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home

# export JAVA_HOME handled by jenv
jenv enable-plugin export
```

### clojure
need not to install `Clojure` separately; will use it with `lein` or `deps`
```sh
brew install borkdude/brew/clj-kondo
brew install candid82/brew/joker
brew install leiningen
```
*NOTE*: Please note that we need to set `LEIN_USE_BOOTCLASSPATH` to `no` until the follwing issues are fixed properl
```
https://github.com/venantius/ultra/issues/108
https://github.com/brandonbloom/fipp/issues/60
https://github.com/venantius/ultra/issues/103
```
```sh
export LEIN_USE_BOOTCLASSPATH=no
```

## Android
```sh
brew cask install android-sdk
```

## node
```sh
brew install coreutils
brew install gpg
npm install -g eslint babel-eslint eslint-plugin-react
npm install -g import-js

```

## Haskell
First of all install `GHCup` with brew; this will manage all ecosystems for Haskell onwards
```
brew install ghcup

````
Install `haskell-language-server` using mason.

## Python
```sh
asdf plugin-add python
asdf install python 3.12.1
asdf global python 3.12.1
pip install virtualenvwrapper

```

## asdf

```sh
asdf list terraform
asdf list all terraform
asdf install terraform 0.14.9
asdf global terraform 0.14.9

asdf plugin-add python
asdf list all python
export ASDF_PYTHON_PATCH_URL="https://github.com/python/cpython/commit/8ea6353.patch?full_index=1"
asdf install python 3.6.14
asdf local python 3.6.14
```
