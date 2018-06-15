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

Set-Alias -Name d.restore -Value ~\Documents\WindowsPowerShell\aliases\d.restore.ps1
Set-Alias -Name d.build -Value ~\Documents\WindowsPowerShell\aliases\d.build.ps1
Set-Alias -Name d.run -Value ~\Documents\WindowsPowerShell\aliases\d.run.ps1

# Import-Module "Oh-My-Powershell" -DisableNameChecking -NoClobber

