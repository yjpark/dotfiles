# Note: can use ~ in alias, but not in path

Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Users\yjpark\Applications\bin")
Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Users\yjpark\Applications\python-bin")
# ~/AppData/Local/Packages/PythonSoftwareFoundation.Python.3.8_qbz5n2kfra8p0/LocalCache/local-packages/Python38/Scripts

Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Users\yjpark\scoop\shims")
Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Users\yjpark\Documents\PowerShell\bin")
Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Users\yjpark\Applications\flutter\bin")
Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Users\yjpark\AppData\Local\Android\Sdk\platform-tools")
Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Users\yjpark\AppData\Local\Android\Sdk\cmdline-tools\tools\bin")
Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Program Files\Android\Android Studio\gradle\gradle-4.10.1\bin")

Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Users\yjpark\.dapr\bin")

Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Users\yjpark\.deno\bin")

Set-Item -Path Env:ANDROID_HOME -Value ~\AppData\Local\Android\Sdk

Set-Item -Path Env:ENABLE_FLUTTER_DESKTOP -Value "true"

# https://flutter.dev/community/china
Set-Item -Path Env:FLUTTER_STORAGE_BASE_URL -Value https://storage.flutter-io.cn
Set-Item -Path Env:PUB_HOSTED_URL -Value https://pub.flutter-io.cn

Set-Alias -Name cb -Value clear

Set-Item -Path Env:GIT_SSH -Value C:\WINDOWS\System32\OpenSSH\ssh.exe

Set-Alias -Name ls -Value "C:\Program Files\Git\usr\bin\ls"
Set-Alias -Name ll -Value ~\Documents\PowerShell\aliases\ll.ps1

Set-Alias -Name git-bin -Value ~\Documents\PowerShell\aliases\add-git-bin.ps1

Set-Alias -Name .. -Value ~\Documents\PowerShell\aliases\cd.uu.ps1
Set-Alias -Name ... -Value ~\Documents\PowerShell\aliases\cd.uuu.ps1
Set-Alias -Name .... -Value ~\Documents\PowerShell\aliases\cd.uuuu.ps1
Set-Alias -Name ..... -Value ~\Documents\PowerShell\aliases\cd.uuuuu.ps1

Set-Alias -Name a -Value ~\Documents\PowerShell\aliases\a.ps1
Set-Alias -Name e -Value nvim

Set-Alias -Name g -Value git
Set-Alias -Name d -Value docker

# PSBookmark https://www.powershellmagazine.com/2016/05/06/powershell-location-bookmark-for-easy-and-faster-navigation/
Set-Alias -Name gg -Value Set-LocationBookmarkAsPWD
Set-Alias -Name bookmark-list -Value Get-LocationBookmark
Set-Alias -Name bookmark-save -Value Save-LocationBookmark
Set-Alias -Name bookmark-delete -Value Remove-LocationBookmark

Set-Alias -Name which -Value Get-Command

Set-Alias -Name d.restore -Value ~\Documents\PowerShell\aliases\d.restore.ps1
Set-Alias -Name d.build -Value ~\Documents\PowerShell\aliases\d.build.ps1
Set-Alias -Name d.build.self -Value ~\Documents\PowerShell\aliases\d.build.self.ps1
Set-Alias -Name d.run -Value ~\Documents\PowerShell\aliases\d.run.ps1
Set-Alias -Name d.watch -Value ~\Documents\PowerShell\aliases\d.watch.ps1
Set-Alias -Name d.fable -Value ~\Documents\PowerShell\aliases\d.fable.ps1
Set-Alias -Name d.pack.release -Value ~\Documents\PowerShell\aliases\d.pack.release.ps1

Set-Alias -Name f -Value ~\Documents\PowerShell\aliases\f.ps1

Set-Alias -Name f.t -Value ~\Documents\PowerShell\aliases\f.t.ps1
Set-Alias -Name f.list -Value ~\Documents\PowerShell\aliases\f.list.ps1
Set-Alias -Name f.prepare -Value ~\Documents\PowerShell\aliases\f.prepare.ps1
Set-Alias -Name f.restore -Value ~\Documents\PowerShell\aliases\f.restore.ps1
Set-Alias -Name f.build -Value ~\Documents\PowerShell\aliases\f.build.ps1

Set-Alias -Name f.fetch -Value ~\Documents\PowerShell\aliases\f.fetch.ps1
Set-Alias -Name f.inject -Value ~\Documents\PowerShell\aliases\f.inject.ps1
Set-Alias -Name f.dist -Value ~\Documents\PowerShell\aliases\f.dist.ps1

Set-Alias -Name f.build-s -Value ~\Documents\PowerShell\aliases\f.build-s.ps1
Set-Alias -Name f.pack-s -Value ~\Documents\PowerShell\aliases\f.pack-s.ps1
Set-Alias -Name f.inject-s -Value ~\Documents\PowerShell\aliases\f.inject-s.ps1
Set-Alias -Name f.push-s -Value ~\Documents\PowerShell\aliases\f.push-s.ps1

Set-Alias -Name fsharpi -Value ~\Documents\PowerShell\aliases\fsharpi.ps1
Set-Alias -Name msbuild -Value ~\Documents\PowerShell\aliases\msbuild.ps1
Set-Alias -Name msbuild.restore -Value ~\Documents\PowerShell\aliases\msbuild.restore.ps1

Set-Alias -Name c -Value ~\Documents\PowerShell\aliases\c.ps1
Set-Alias -Name cn -Value ~\Documents\PowerShell\aliases\cn.ps1
Set-Alias -Name c.run-example -Value ~\Documents\PowerShell\aliases\c.run-example.ps1

Set-Alias -Name gwp -Value ~\Documents\PowerShell\aliases\gwp.ps1

Set-Alias -Name set-proxy-trojan -Value ~\Documents\PowerShell\aliases\set-proxy-trojan.ps1
Set-Alias -Name set-proxy-off -Value ~\Documents\PowerShell\aliases\set-proxy-off.ps1

Set-Alias -Name set-git-proxy-trojan -Value ~\Documents\PowerShell\aliases\set-git-proxy-trojan.ps1
Set-Alias -Name set-git-proxy-off -Value ~\Documents\PowerShell\aliases\set-git-proxy-off.ps1

Import-Module '~\Documents\PowerShell\Profile.private.psm1'

if ($host.Name -eq 'ConsoleHost')
{
    # https://github.com/lzybkr/PSReadLine
    Import-Module PSReadLine
    Set-PSReadLineOption -EditMode Emacs
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
    Set-PSReadLineKeyHandler -Key Tab -Function Complete
    Set-PSReadLineOption -HistorySearchCursorMovesToEnd

    Import-Module DirColors

    # https://starship.rs/guide/
    # install with `scoop install starship`
    # -> used forked version in ~/Applications/bin
    Invoke-Expression (&starship init powershell)
}

