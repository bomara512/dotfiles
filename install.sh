#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/usr/local/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Update Homebrew recipes
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Remove outdated versions from the cellar.
brew cleanup

stow --verbose --target=$HOME --restow git p10k shell zsh

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos
