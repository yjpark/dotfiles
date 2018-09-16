$env:Path += "$env:Path;C:\Users\yjpark\Documents\WindowsPowerShell\bin"

Set-Alias -Name cb -Value clear

Set-Alias -Name l -Value ls
Set-Alias -Name ll -Value ls

Set-Alias -Name .. -Value ~\Documents\WindowsPowerShell\aliases\cd.uu.ps1
Set-Alias -Name ... -Value ~\Documents\WindowsPowerShell\aliases\cd.uuu.ps1
Set-Alias -Name .... -Value ~\Documents\WindowsPowerShell\aliases\cd.uuuu.ps1
Set-Alias -Name ..... -Value ~\Documents\WindowsPowerShell\aliases\cd.uuuuu.ps1

Set-Alias -Name a -Value ~\Documents\WindowsPowerShell\aliases\a.ps1

Set-Alias -Name g -Value git
Set-Alias -Name d -Value docker

Set-Alias -Name gg -Value ~\Documents\WindowsPowerShell\aliases\gg.ps1

Set-Alias -Name paket -Value .paket\paket.exe

Set-Alias -Name d.restore -Value ~\Documents\WindowsPowerShell\aliases\d.restore.ps1
Set-Alias -Name d.build -Value ~\Documents\WindowsPowerShell\aliases\d.build.ps1
Set-Alias -Name d.build.self -Value ~\Documents\WindowsPowerShell\aliases\d.build.self.ps1
Set-Alias -Name d.run -Value ~\Documents\WindowsPowerShell\aliases\d.run.ps1
Set-Alias -Name d.watch -Value ~\Documents\WindowsPowerShell\aliases\d.watch.ps1
Set-Alias -Name d.fable -Value ~\Documents\WindowsPowerShell\aliases\d.fable.ps1
Set-Alias -Name d.pack.release -Value ~\Documents\WindowsPowerShell\aliases\d.pack.release.ps1

Set-Alias -Name f.build -Value ~\Documents\WindowsPowerShell\aliases\f.build.ps1
Set-Alias -Name f.task -Value ~\Documents\WindowsPowerShell\aliases\f.task.ps1
Set-Alias -Name f.list -Value ~\Documents\WindowsPowerShell\aliases\f.list.ps1

Set-Alias -Name fsi -Value ~\Documents\WindowsPowerShell\aliases\fsi.ps1

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
