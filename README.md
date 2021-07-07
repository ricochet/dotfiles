# dotfiles

With stow powered symlinks, keep dotfiles always up-to-date in your repository.

```bash
git clone https://github.com/ricochet/dotfiles ~/.dotfiles
```

- OS: Debian/Ubuntu, MacOS, Windows with WSL
- Shell: `zsh` wih [oh-my-zsh](https://ohmyz.sh) plugins managed by [antibody](https://getantibody.github.io/) and [starship](https://starship.rs) prompt
- Theme: Dracula
- Text font: `Fira Code Mono`

## Screenshots

![git diff with delta](img/diff.png)

## install

### *nix and macos

```bash
./install.sh
```

### WSL

Run through installation [setup.ps1](./wsl/setup.ps1) first.
It's a pain to automate, so copy commands that you need in an
elevated powershell window.

Then follow the following steps: <https://docs.docker.com/docker-for-windows/wsl/>

#### GUI in WSL

- [Ubuntu wiki](https://wiki.ubuntu.com/WSL#Running_Graphical_Applications)
- Install an X-Server like [https://sourceforge.net/projects/vcxsrv/](vcxsrv).
- [Windows Defender firewall rules](https://github.com/cascadium/wsl-windows-toolbar-launcher#firewall-rules)

## Better commands

See [rust/update.sh](./rust/update.sh) for installed cargo packages. Many are drop-in replacements for common linux commands and sourced from this blog post: <https://zaiste.net/posts/shell-commands-rust/>

- `ls`: `exa` supports icons with the --icons flag.
- `cat`: `bat` is a cat clone with syntax highlighting and Git integration that works on Windows, MacOS and Linux. It provides syntax highlighting for many file extensions by default.
- `man`: `tealdeer`
- `find`: `fd` is a fast and user-friendly alternative to find, the built-in command-line program in Unix/Linux for walking a file hierarchy. fd provides opinionated defaults for the most common use cases. To find a specific file by name, you write fd PATTERN instead of find -iname ‘*PATTERN*’. fd is also extremely fast and it comes with a ton of options like ignoring hidden directories, files and patterns from .gitignore by default. https://github.com/sharkdp/fd
- `ps`: `procs` is a modern replacement for ps, the default command-line program in Unix/Linux for getting information about processes. It provides convenient, human-readable (and colored) output format by default.
- `sed`: `sd` is an intuitive find & replace command-line tool, it is an alternative to sed, the built-in command-line program in Unix/Linux for parsing and transforming text. sd has simpler syntax for replacing all occurrences and it uses the convenient regex syntax that you already know from JavaScript and Python. sd is also 2x-11x faster than sed.
- `du`: `dust` is a more intuitive version of du, the built-in command-line program in Unix/Linux for displaying disk usage statistics. By default dust sorts the directories by size.
- `grep`: `rg`,  is an extremely fast alternative to grep, the built-in command-line program in Unix/Linux for searching files by pattern. ripgrep is a line-oriented search tool that recursively searches your current directory for a regex pattern. By default, ripgrep respects .gitignore and automatically skips hidden files, directories and binary files.
- `tokei` tokei is a program that displays statistics about your code. It shows the number of files, total lines within those files and code, comments, and blanks grouped by language.
- `top`: `ytop` is an alternative to top, the built-in command-line program in Unix/Linux for displaying information about processes.
- `bandwhich` is a CLI utility for displaying current network utilization by process, connection and remote IP or hostname.
- `diff`: `delta` is a viewer for git and diff output. It allows you to make extensive changes to the layout and styling of diffs, as well as allowing you to stay arbitrarily close to the default git/diff output.

## References

- Great [blog](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/) on how to use stow to manage dotfile repositories
- [replacement shell commands](https://zaiste.net/posts/shell-commands-rust/)
