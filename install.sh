#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! "$(which omz)"; then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)" & wait
fi

# Check for powerlevel10k and install if we don't have it
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "cloning powerlevel10k"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

. ./brew.sh

stow --verbose --target=$HOME --restow git p10k shell zsh

PYTHON_VERSION="3.11";
echo "PYTHON_VERSION = $PYTHON_VERSION";

# shellcheck disable=SC2039
if [[ $(pyenv global) != "$PYTHON_VERSION" ]]; then
  echo "installing global python: $PYTHON_VERSION...";
  pyenv install $PYTHON_VERSION;
  pyenv global $PYTHON_VERSION;
else
  echo "global python is already at $PYTHON_VERSION";
fi

# Set macOS preferences - we will run this last because this will reload the shell
. ./.macos
