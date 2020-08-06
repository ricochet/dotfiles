#!/bin/bash
stow git neovim personal-git ssh vim zsh

# wsl
if grep -q microsoft /proc/version; then
  stow wsl-git
fi

# use static loading for perf
# https://getantibody.github.io/
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
antibody update
