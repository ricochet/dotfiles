# Scratchpad of notes

## WSL

Access WSL filesystem from the files explorer: `\\wsl$\Ubuntu`

<https://docs.microsoft.com/en-us/windows/wsl/compare-versions#accessing-network-applications>

```bash
# Obtain the IP address of your host machine by running this command from your Linux distribution: cat /etc/resolv.conf - Copy the IP address following the term: nameserver. - Connect to any Windows server using the copied IP address.
# You may need to bind your application to 0.0.0.0 instead of 127.0.0.1
ip addr | grep eth0
```

## Powerline-go in Powershell

```bash
go get -u github.com/justjanne/powerline-go

GOPATH=$HOME/go
function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $?)"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
```

## TODO

https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync
http://shanalikhan.github.io/2015/12/15/Visual-Studio-Code-Sync-Settings.html
https://code.visualstudio.com/docs/editor/settings-sync

https://github.com/microsoft/vscode-remote-try-go/blob/master/.devcontainer/devcontainer.json

add unit tests: https://github.com/techthoughts2/Catesta/blob/master/docs/Catesta-GHActions.md

https://github.com/techthoughts2/Catesta/blob/master/docs/Catesta-GHActions.md

automate installing git: https://www.powershellgallery.com/packages/Install-Git/1.0/Content/Install-Git.ps1
