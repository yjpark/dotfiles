$env:Path += "$env:Path;C:\Users\yjpark\Documents\WindowsPowerShell\bin"

Set-Alias -Name l -Value ls
Set-Alias -Name ll -Value ls

Set-Alias -Name .. -Value ~\Documents\WindowsPowerShell\aliases\cd.uu.ps1
Set-Alias -Name ... -Value ~\Documents\WindowsPowerShell\aliases\cd.uuu.ps1
Set-Alias -Name .... -Value ~\Documents\WindowsPowerShell\aliases\cd.uuuu.ps1
Set-Alias -Name ..... -Value ~\Documents\WindowsPowerShell\aliases\cd.uuuuu.ps1

Set-Alias -Name g -Value git
Set-Alias -Name d -Value docker

Set-Alias -Name gg.bit -Value ~\Documents\WindowsPowerShell\aliases\gg.bit.ps1
Set-Alias -Name gg.core -Value ~\Documents\WindowsPowerShell\aliases\gg.core.ps1
Set-Alias -Name gg.lib -Value ~\Documents\WindowsPowerShell\aliases\gg.lib.ps1
Set-Alias -Name gg.gui -Value ~\Documents\WindowsPowerShell\aliases\gg.gui.ps1

Set-Alias -Name paket -Value .paket\paket.exe

Set-Alias -Name d.restore -Value ~\Documents\WindowsPowerShell\aliases\d.restore.ps1
Set-Alias -Name d.build -Value ~\Documents\WindowsPowerShell\aliases\d.build.ps1
Set-Alias -Name d.run -Value ~\Documents\WindowsPowerShell\aliases\d.run.ps1

if ($host.Name -eq 'ConsoleHost')
{
    # https://github.com/lzybkr/PSReadLine
    Import-Module PSReadLine
    Set-PSReadLineOption -EditMode Emacs
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
    Set-PSReadLineKeyHandler -Key Tab -Function Complete

    # Import-Module "Oh-My-Powershell" -DisableNameChecking -NoClobber
}
