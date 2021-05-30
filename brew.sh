#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install git
brew install gs
brew install imagemagick 
brew install lua
brew install lynx
brew install p7zip
brew install pv
brew install rename
brew install ssh-copy-id
brew install tree
brew install node
brew install sqlite
brew install python3
brew install nmap
brew install pyenv
brew install pyenv-virtualenv
brew install redis
brew install docker
brew install docker-compose

# casks
brew tap adoptopenjdk/openjdk
brew install --cask adoptopenjdk12

brew install --cask intellij-idea
brew install --cask postman
brew install --cask iterm2
brew install --cask macdown
brew install --cask slack
brew install --cask skype
brew install --cask firefox
brew install --cask google-chrome
brew install --cask shiftit
brew install --cask spotify
brew install --cask caffeine
brew install --cask sourcetree
brew install --cask alfred
brew install --cask docker
brew install --cask steam

# Remove outdated versions from the cellar.
brew cleanup

