#!/bin/bash

stow git bat neovim personal-git ssh vim zsh

# wsl
if grep -q microsoft /proc/version &> /dev/null; then
  stow wsl
fi

# use static loading for perf
# https://getantibody.github.io/
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
antibody update
