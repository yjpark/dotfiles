^Tab::
Send #{Tab}
return

^!o::
IfWinActive, ahk_exe Obsidian.exe
    sleep, 10
else
    WinActivate ahk_exe Obsidian.exe
return

^!g::
IfWinActive, ahk_exe msedge.exe
    sleep, 10
else
    WinShow ahk_exe msedge.exe
    WinActivate ahk_exe msedge.exe
    MouseClick
return

^!m::
IfWinActive, ahk_exe chrome.exe
    sleep, 10
else
    WinShow ahk_exe chrome.exe
    WinActivate ahk_exe chrome.exe
    MouseClick
return

^`::
IfWinActive, ahk_exe WindowsTerminal.exe
    sleep, 10
else
    WinActivate ahk_exe WindowsTerminal.exe
    MouseClick
return

^!Space::
Process,close,explorer.exe
sleep, 50 ;This sleep 5000 is to let you see what actually happens. Decrease it later
run, explorer.exe
WinWait, ahk_class CabinetWClass
WinClose ;close the new explorer window
return

