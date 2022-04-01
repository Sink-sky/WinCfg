Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Install-Module z -Scope CurrentUser
Install-Module PSReadLine -Scope CurrentUser

$script_path = Split-Path -Parent $MyInvocation.MyCommand.Definition
cp $script_path/../profile.ps1 $PROFILE