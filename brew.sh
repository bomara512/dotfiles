#!/bin/sh

echo "Homebrew..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Determine install location: Apple Silicon vs Intel
  if [ -f /opt/homebrew/bin/brew ]; then
    BREW_BIN=/opt/homebrew/bin/brew
  else
    BREW_BIN=/usr/local/bin/brew
  fi

  echo "eval \"\$(${BREW_BIN} shellenv)\"" >> $HOME/.zprofile
  eval "$($BREW_BIN shellenv)"
fi

# Update Homebrew recipes
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install all our dependencies with bundle (See Brewfile)
brew bundle --file ./Brewfile

# Remove outdated versions from the cellar.
brew cleanup

