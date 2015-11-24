^Tab::
Send #{Tab}
return

^`::
IfWinActive, ahk_exe VirtualBox.exe
    Send !{Tab}
else
    WinActivate, ahk_exe VirtualBox.exe
return

^!`::
IfWinActive, ahk_exe mintty.exe
    Send !{Tab}
else
    WinActivate ahk_exe mintty.exe
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

^!a::
IfWinActive, ahk_exe atom.exe
    Send !{Tab}
else
    WinActivate ahk_exe atom.exe
return

^!v::
IfWinActive, ahk_exe gvim.exe
    Send !{Tab}
else
    WinActivate ahk_exe gvim.exe
return

^!s::
IfWinActive, ahk_exe devenv.exe
    Send !{Tab}
else
    WinActivate ahk_exe devenv.exe
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

^!m::
IfWinActive, ahk_exe cloudmusic.exe
    Send !{Tab}
else
    WinActivate ahk_exe cloudmusic.exe
return

^!e::
IfWinActive, ahk_exe Evernote.exe
    Send !{Tab}
else
    WinActivate ahk_exe Evernote.exe
return

^!p::
IfWinActive, ahk_exe xmind.exe
    Send !{Tab}
else
    WinActivate ahk_exe xmind.exe
return

^!Space::
Process,close,explorer.exe
sleep, 50 ;This sleep 5000 is to let you see what actually happens. Decrease it later
run, explorer.exe
WinWait, ahk_class CabinetWClass
WinClose ;close the new explorer window
return

