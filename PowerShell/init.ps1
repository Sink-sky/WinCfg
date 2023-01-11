# First
# winget install Microsoft.PowerShell

Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser -RequiredVersion 2.0.496
Install-Module z -Scope CurrentUser
Install-Module -Name PSReadLine -Force

$script_path = Split-Path -Parent $MyInvocation.MyCommand.Definition
cp $script_path/profile.ps1 $PROFILE