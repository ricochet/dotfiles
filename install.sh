#!/usr/bin/env bash

set -eEuo pipefail

printf "Configuration:\n"
IGNORE_OMZ=${IGNORE_OMZ:-false}
IGNORE_BREW=${IGNORE_BREW:-true}
REMOTE_CONTAINERS=${REMOTE_CONTAINERS:-false}

if [[ ${REMOTE_CONTAINERS} ]]; then
    IGNORE_OMZ=true
    IGNORE_BREW=true
    IGNORE_CODE=true
fi

printf " - IGNORE_OMZ      = %s\n" "${IGNORE_OMZ}"
printf " - IGNORE_BREW     = %s\n" "${IGNORE_BREW}"

###
# Rust
###
if ! command -v 'rustc' &>/dev/null; then
    printf "\n🦀 Installing rust\n"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

###
# Antibody
###
if ! command -v 'antibody' &>/dev/null; then
    printf "\n🚀 Installing antibody\n"
    curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
fi

###
# Starship
###
if [[ -z "$(which starship)" ]] ; then
    printf "\n🚀 Installing starship\n"
    curl -fsSL https://starship.rs/install.sh | bash -s -- -y -b ${DOTFILES_BIN} >/dev/null
fi

###
# Essential Rust utilities
# For more utils, see rust-update.sh
###
cargo install bat fd-find git-delta exa

###
# Install oh my zsh
###
if ! ${IGNORE_OMZ}; then
    printf "\n🚀 Installing oh-my-zsh\n"
    if [ -d "${HOME}/.oh-my-zsh" ]; then
        printf "oh-my-zsh is already installed\n"
    else
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
fi

###
# Install brew to start with
###
if [[ ! ${IGNORE_BREW} && "$OSTYPE" == "darwin"* ]]; then
    printf "\n🚀 Installing brew\n"
    
    if [ "$(arch)" = "arm64" ]; then
        printf "\nRunning on arm64\n"
        if ! brew --version; then
            sudo mkdir -p /opt/homebrew
            sudo chown -R "$(whoami)":wheel /opt/homebrew
            curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C /opt/homebrew
        fi
    else
        printf "\nRunning on intel\n"
        if ! brew --version; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
        fi
    fi
    brew update
    brew upgrade

    ###
    # Install brew packages
    ###
    pushd ~/macos || exit
    brew bundle
    popd || exit

    # Some tidying up
    brew autoremove
    brew cleanup
fi
