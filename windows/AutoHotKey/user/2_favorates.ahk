^Tab::
    Send #{Tab}
return()

^!o::
IfWinActive, ahk_exe Obsidian.exe
    sleep 10
else
    WinShow ahk_exe Obsidian.exe
    WinActivate ahk_exe Obsidian.exe
    sleep 10
    WinSet Top
return()

^!g::
IfWinActive, ahk_exe msedge.exe
    sleep 10
else
    ; WinShow will cause the search bar in Edge shown
    ; in about://flags, enable `Use Aura for Find on page`
    ; can make it better, but still a bit messy, some time not
    ; getting focus
    WinShow ahk_exe msedge.exe
    WinActivate ahk_exe msedge.exe
    sleep 10
    WinSet Top
return()

^!m::
IfWinActive, ahk_exe chrome.exe
    sleep 10
else
    WinShow ahk_exe chrome.exe
    WinActivate ahk_exe chrome.exe
    sleep 10
    WinSet Top
return()

^!Space::
Process,close,explorer.exe
sleep 50 ;This sleep 5000 is to let you see what actually happens. Decrease it later
run, explorer.exe
WinWait, ahk_class CabinetWClass
WinClose ;close the new explorer window
return()

