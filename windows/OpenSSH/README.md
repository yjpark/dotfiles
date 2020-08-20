Easiest way is to use scoop to install openssh

https://github.com/PowerShell/Win32-OpenSSH/issues/1263#issuecomment-634415928

```
sudo scoop install -g win32-openssh
sudo C:\ProgramData\scoop\apps\win32-openssh\current\install-sshd.ps1
```

Get the files from

- https://github.com/PowerShell/Win32-OpenSSH/releases

To run this, need to change policy before

```
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
```

- https://my.oschina.net/u/4319036/blog/3248732

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

import-Module .\\OpenSSHUtils.psm1

Repair-UserSshConfigPermission ~/.ssh/config
Get-ChildItem ~\.ssh\* -Include "id_rsa","id_dsa" -ErrorAction SilentlyContinue | % {
    Repair-UserKeyPermission -FilePath $_.FullName @psBoundParameters
}
```

### Note

Seems can't have the PC's name same as the user's name

- https://github.com/PowerShell/openssh-portable/pull/418
