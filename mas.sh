#!/bin/sh

echo "Mac App Store..."

# Check for mas installation
if test ! "$(which mas)"; then
  . brew.sh
fi

brew bundle --file ./Masfile

