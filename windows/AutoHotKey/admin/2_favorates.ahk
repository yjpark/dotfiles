^`::
IfWinActive, ahk_exe VirtualBox.exe
    Send !{Tab}
else
    WinActivate, ahk_exe VirtualBox.exe
return

^!c::
IfWinActive, ahk_exe chrome.exe
    Send !{Tab}
else
    WinActivate ahk_exe chrome.exe
return

^!f::
IfWinActive, ahk_exe firefox.exe
    Send !{Tab}
else
    WinActivate ahk_exe firefox.exe
return

^!u::
IfWinActive, ahk_exe Unity.exe
    Send !{Tab}
else
    WinActivate ahk_exe Unity.exe
return

^!v::
IfWinActive, ahk_exe gvim.exe
    Send !{Tab}
else
    WinActivate ahk_exe gvim.exe
return

^!s::
IfWinActive, ahk_exe WDExpress.exe
    Send !{Tab}
else
    WinActivate ahk_exe WDExpress.exe
return

^!i::
IfWinActive, ahk_exe idea.exe
    Send !{Tab}
else
    WinActivate ahk_exe idea.exe
return

^!t::
IfWinActive, ahk_exe Telegram.exe
    Send !{Tab}
else
    WinActivate ahk_exe Telegram.exe
return

^!h::
IfWinActive, ahk_exe zeal.exe
    Send !{Tab}
else
    WinActivate ahk_exe zeal.exe
return




