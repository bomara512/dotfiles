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

ZSHRC_FILE="$HOME/.zshrc"
if [ -f "$ZSHRC_FILE" ] && ! [ -L "$ZSHRC_FILE" ] ; then
  ZSHRC_FILE_BAK="$ZSHRC_FILE.$(date -Iseconds)";
  echo "Creating backup before stow: $ZSHRC_FILE_BAK";
  mv "$ZSHRC_FILE" "$ZSHRC_FILE_BAK"
fi

stow --verbose --target="$HOME" --restow git p10k shell zsh

PYTHON_VERSION="3.11";
echo "PYTHON_VERSION = $PYTHON_VERSION";

if [ "$(pyenv global)" != "$PYTHON_VERSION" ]; then
  echo "installing global python: $PYTHON_VERSION...";
  pyenv install $PYTHON_VERSION;
  pyenv global $PYTHON_VERSION;
else
  echo "global python is already at $PYTHON_VERSION";
fi

if test ! "$(which nvm)"; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

# Set macOS preferences - we will run this last because this will reload the shell
. ./.macos
