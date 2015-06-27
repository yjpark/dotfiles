
^`::
IfWinActive, ahk_exe VirtualBox.exe
    Send !{Tab}
else
    WinActivate, ahk_exe VirtualBox.exe
return


