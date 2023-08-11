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

## TODO: use stow or at least make backups

## Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

rm -rf $HOME/.gitconfig
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig

rm -rf $HOME/.oh-my-zsh/custom/aliases.zsh
ln -s $HOME/dotfiles/.oh-my-zsh/custom/aliases.zsh $HOME/.oh-my-zsh/custom/aliases.zsh

rm -rf $HOME/.hushlogin
ln -s $HOME/dotfiles/.hushlogin $HOME/.hushlogin

rm -rf $HOME/.p10k.zsh
ln -s $HOME/dotfiles/.p10k.zsh $HOME/.p10k.zsh

# Update Homebrew recipes
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Remove outdated versions from the cellar.
brew cleanup

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos
