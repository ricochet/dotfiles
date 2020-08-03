#!/bin/bash

# install deps
# If !macos, follow README.md for deps like stow
if [[ "$OSTYPE" == "darwin"* ]]; then
  brew bundle
fi 

stow bin git neovim personal-git ssh vim zsh

# wsl
if grep -q Microsft /proc/version; then
  stow wsl-git
fi

# use static loading for perf
# https://getantibody.github.io/
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
antibody update
