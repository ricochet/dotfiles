#!/bin/bash

# install deps
if [[ "$OSTYPE" == "darwin"* ]]; then
  pushd macos || exit
  brew bundle
  popd || exit
elif  ! command -v "apt-get" &> /dev/null; then
  # software-properties-common for add-apt-repository
  sudo apt install software-properties-common
  sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

  xargs -a packages.txt sudo apt-get install -y
fi

chsh -s $(which zsh)

# antibody
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin

# emsdk
mkdir -p "$(dirname "$EMSDK_HOME")"
git clone https://github.com/emscripten-core/emsdk.git "$EMSDK_HOME"

sh ./update.sh
