^Tab::
Send #{Tab}
return

^`::
IfWinActive, ahk_exe WindowsTerminal.exe
    Send !{Tab}
else
    WinActivate ahk_exe WindowsTerminal.exe
return

^!g::
IfWinActive, ahk_exe msedge.exe
    Send !{Tab}
else
    WinActivate ahk_exe msedge.exe
return

^!m::
IfWinActive, ahk_exe chrome.exe
    Send !{Tab}
else
    WinActivate ahk_exe chrome.exe
return

^!r::
IfWinActive, ahk_exe firefox.exe
    Send !{Tab}
else
    WinActivate ahk_exe firefox.exe
return

^!w::
IfWinActive, ahk_exe iridium.exe
    Send !{Tab}
else
    WinActivate ahk_exe iridium.exe
return

^!u::
IfWinActive, ahk_exe Unity.exe
    Send !{Tab}
else
    WinActivate ahk_exe Unity.exe
return

^!a::
IfWinActive, ahk_exe VsCodium.exe
    Send !{Tab}
else
    WinActivate ahk_exe VsCodium.exe
return

^!v::
IfWinActive, ahk_exe devenv.exe
    Send !{Tab}
else
    WinActivate ahk_exe devenv.exe
return

^!x::
IfWinActive, ahk_exe devenv.exe
    Send !{Tab}
else
    WinActivate ahk_exe devenv.exe
return

^!s::
IfWinActive, ahk_exe ApplicationFrameHost.exe
    Send !{Tab}
else
    WinActivate ahk_exe ApplicationFrameHost.exe
return

^!i::
IfWinActive, ahk_exe idea.exe
    Send !{Tab}
else
    WinActivate ahk_exe idea.exe
return

^!h::
IfWinActive, ahk_exe zeal.exe
    Send !{Tab}
else
    WinActivate ahk_exe zeal.exe
return

^!o::
IfWinActive, ahk_exe Obsidian.exe
    Send !{Tab}
else
    WinActivate ahk_exe Obsidian.exe
return

^!d::
IfWinActive, ahk_exe code.exe
    Send !{Tab}
else
    WinActivate ahk_exe code.exe
return

^!Space::
Process,close,explorer.exe
sleep, 50 ;This sleep 5000 is to let you see what actually happens. Decrease it later
run, explorer.exe
WinWait, ahk_class CabinetWClass
WinClose ;close the new explorer window
return

