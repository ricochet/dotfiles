# dotfiles

With stow powered symlinks, keep dotfiles always up-to-date in your repository.

```bash
git clone https://github.com/ricochet/dotfiles ~/.dotfiles
```

## dependencies

```bash
# pick your poison
sudo apt-get install stow
brew install stow

# antibody
curl -sfL git.io/antibody | sh -s - -b /usr/local/bin

# zsh
sudo apt-get install zsh
```

## install

### WSL

Run through installation [setup.ps1](./wsl/setup.ps1) first.
It's a pain to automate, so copy commands that you need in an
elevated powershell window.

Then follow the following steps: <https://docs.docker.com/docker-for-windows/wsl/>

#### GUI in WSL

- [Ubuntu wiki](https://wiki.ubuntu.com/WSL#Running_Graphical_Applications)
- Install an X-Server like [https://sourceforge.net/projects/vcxsrv/](vcxsrv).
- [Windows Defender firewall rules](https://github.com/cascadium/wsl-windows-toolbar-launcher#firewall-rules)

### *nix and macos

```bash
./install.sh
```

## References

Great blog on how to use stow to manage dotfile repositories.

<https://alexpearce.me/2016/02/managing-dotfiles-with-stow/>
