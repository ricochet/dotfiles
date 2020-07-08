#!/bin/bash
stow bin git neovim personal-git ssh vim zsh

# wsl
if grep -q Microsft /proc/version; then
  stow wsl-git
fi

# install antibody
if [[ "$OSTYPE" == "darwin"* ]]; then
  brew bundle
else
  curl -sfL git.io/antibody | sh -s - -b /usr/local/bin
fi 

# use static loading for perf
# https://getantibody.github.io/
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
antibody update
