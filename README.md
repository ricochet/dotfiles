# dotfiles

With stow powered symlinks, keep dotfiles always up-to-date in your repository.

```bash
git clone https://github.com/ricochet/dotfiles ~/.dotfiles
```

## Dependencies

```bash
# pick your poison
sudo pacman -S stow
sudo apt-get install stow
brew install stow

# antibody
curl -sfL git.io/antibody | sh -s - -b /usr/local/bin

# zsh
sudo apt-get install zsh
```

## Install

### WSL

Run through installation setup.ps1 first. It's a pain to automate, so copy commands that you
need in an elevated powershell window.

Then setup docker following: <https://docs.docker.com/docker-for-windows/wsl/>

Once you have WSL setup with a distro, run install.sh in that distro.

### *nix and macos

```bash
./install.sh
```

## References

Great blog on how to use stow to manage dotfile repositories.

<https://alexpearce.me/2016/02/managing-dotfiles-with-stow/>
