#!/bin/bash
rust/update.sh

stow git bat neovim personal-git ssh vim zsh topgrade

# wsl
if grep -q microsoft /proc/version &> /dev/null; then
  stow wsl
fi

# use static loading for perf
# https://getantibody.github.io/
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
antibody update

# update all-the-things
topgrade
