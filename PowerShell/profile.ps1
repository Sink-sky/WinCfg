function reload {
    [CmdletBinding()]
    Param ($Parameter1)
    Begin {}
    Process {
        & $profile
    }
    End {}
}
  
function touch {
    [CmdletBinding()]
    Param ($file)
    Begin {}
    Process {
        "" | Out-File $file -Encoding ASCII
    }
    End {}
}
  
function which {
    [CmdletBinding()]
    Param ($name)
    Begin {}
    Process {
        Get-Command $name | Select-Object -ExpandProperty Definition
    }
    End {}
}
  
if (![System.Console]::IsOutputRedirected) {
    Import-Module posh-git
    Import-Module z
    Import-Module PSReadLine
    # Import-Module oh-my-posh
    # Set-Theme Paradox
    
    Set-PSReadLineOption -PredictionSource History # 设置预测文本来源为历史记录
    Set-PSReadLineOption -PredictionViewStyle ListView # 设置预测文本以列表形式展开
     
    Set-PSReadlineKeyHandler -Key Tab -Function Complete # 设置 Tab 键补全
    Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete # 设置 Ctrl+d 为菜单补全和 Intellisense
    Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo # 设置 Ctrl+z 为撤销
    
    Set-PSReadLineKeyHandler -Key UpArrow -ScriptBlock {
        [Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchBackward()
        [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
    } # 设置向上键为后向搜索历史记录
    Set-PSReadLineKeyHandler -Key DownArrow -ScriptBlock {
        [Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchForward()
        [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
    } # 设置向下键为前向搜索历史纪录

    Invoke-Expression (&starship init powershell)

    # Chocolatey profile
    $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
    if (Test-Path($ChocolateyProfile)) {
        Import-Module "$ChocolateyProfile"
    }
  
    Clear-Host
}
