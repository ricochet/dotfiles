<# 
    automate installing git? 
    https://www.powershellgallery.com/packages/Install-Git/1.0/Content/Install-Git.ps1
#>

<# 
    bling powershell
    https://rnelson0.com/2018/05/17/powershell-in-a-post-tls1-1-world/
    https://docs.microsoft.com/en-us/powershell/scripting/gallery/installing-psget?view=powershell-7
    https://github.com/JanDeDobbeleer/oh-my-posh
    https://github.com/dahlbyk/posh-git
    https://docs.microsoft.com/en-us/windows/terminal/tutorials/powerline-setup
#>
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Install-PackageProvider -Name NuGet -Force -Scope CurrentUser
Install-Module -Name PowerShellGet -Force -Scope CurrentUser -AllowClobber

Install-Module PANSIES -Scope CurrentUser -Force -AllowClobber
Install-Module PowerLine -Scope CurrentUser -Force  -AllowClobber
Install-Module posh-git -Scope CurrentUser -Force  -AllowClobber
Install-Module oh-my-posh -Scope CurrentUser -Force  -AllowClobber

<#
    winget
#>
Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/download/v0.1.4331-preview/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle -OutFile winget-cli.appxbundle -UseBasicParsing
Add-AppxPackage .\winget-cli.appxbundle

Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform, Microsoft-Windows-Subsystem-Linux

Install-Script Install-VSCode -Scope CurrentUser
Install-VSCode.ps1 -LaunchWhenDone -AdditionalExtensions 'eamodio.gitlens', 'ms-vscode-remote.vscode-remote-extensionpack'
# opting to use powershell script to add in initial plugins like remote extenstions
# but the winget command below also works
# winget install --name "Visual Studio Code" --id "Microsoft.VisualStudioCode" -e

<#
    WSL
#>
winget install --name "Windows Terminal" --id "Microsoft.WindowsTerminal" -e
winget install --id "Canonical.Ubuntu" -e
wsl --set-default-version 2
wslconfig /setdefault Ubuntu
