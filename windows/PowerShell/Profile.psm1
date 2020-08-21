Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Users\yjpark\scoop\shims")
Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Users\yjpark\Documents\WindowsPowerShell\bin")
Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Users\yjpark\Applications\flutter\bin")
Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Users\yjpark\AppData\Local\Android\Sdk\platform-tools")
Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Program Files\Android\Android Studio\gradle\gradle-4.10.1\bin")

# https://flutter.dev/community/china
Set-Item -Path Env:FLUTTER_STORAGE_BASE_URL -Value https://storage.flutter-io.cn
Set-Item -Path Env:PUB_HOSTED_URL -Value https://pub.flutter-io.cn

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

Set-Alias -Name which -Value Get-Command

Set-Alias -Name d.restore -Value ~\Documents\WindowsPowerShell\aliases\d.restore.ps1
Set-Alias -Name d.build -Value ~\Documents\WindowsPowerShell\aliases\d.build.ps1
Set-Alias -Name d.build.self -Value ~\Documents\WindowsPowerShell\aliases\d.build.self.ps1
Set-Alias -Name d.run -Value ~\Documents\WindowsPowerShell\aliases\d.run.ps1
Set-Alias -Name d.watch -Value ~\Documents\WindowsPowerShell\aliases\d.watch.ps1
Set-Alias -Name d.fable -Value ~\Documents\WindowsPowerShell\aliases\d.fable.ps1
Set-Alias -Name d.pack.release -Value ~\Documents\WindowsPowerShell\aliases\d.pack.release.ps1

Set-Alias -Name f -Value ~\Documents\WindowsPowerShell\aliases\f.ps1

Set-Alias -Name f.t -Value ~\Documents\WindowsPowerShell\aliases\f.t.ps1
Set-Alias -Name f.list -Value ~\Documents\WindowsPowerShell\aliases\f.list.ps1
Set-Alias -Name f.prepare -Value ~\Documents\WindowsPowerShell\aliases\f.prepare.ps1
Set-Alias -Name f.restore -Value ~\Documents\WindowsPowerShell\aliases\f.restore.ps1
Set-Alias -Name f.build -Value ~\Documents\WindowsPowerShell\aliases\f.build.ps1

Set-Alias -Name f.fetch -Value ~\Documents\WindowsPowerShell\aliases\f.fetch.ps1
Set-Alias -Name f.inject -Value ~\Documents\WindowsPowerShell\aliases\f.inject.ps1
Set-Alias -Name f.dist -Value ~\Documents\WindowsPowerShell\aliases\f.dist.ps1

Set-Alias -Name f.build-s -Value ~\Documents\WindowsPowerShell\aliases\f.build-s.ps1
Set-Alias -Name f.pack-s -Value ~\Documents\WindowsPowerShell\aliases\f.pack-s.ps1
Set-Alias -Name f.inject-s -Value ~\Documents\WindowsPowerShell\aliases\f.inject-s.ps1
Set-Alias -Name f.push-s -Value ~\Documents\WindowsPowerShell\aliases\f.push-s.ps1

Set-Alias -Name fsharpi -Value ~\Documents\WindowsPowerShell\aliases\fsharpi.ps1
Set-Alias -Name msbuild -Value ~\Documents\WindowsPowerShell\aliases\msbuild.ps1
Set-Alias -Name msbuild.restore -Value ~\Documents\WindowsPowerShell\aliases\msbuild.restore.ps1

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

Import-Module '~\Documents\WindowsPowerShell\Profile.private.psm1'
