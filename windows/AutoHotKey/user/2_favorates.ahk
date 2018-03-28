^Tab::
Send #{Tab}
return

^`::
IfWinActive, ahk_exe mintty.exe
    Send !{Tab}
else
    WinActivate ahk_exe mintty.exe
return

^!`::
IfWinActive, ahk_exe ubuntu.exe
    Send !{Tab}
else
    WinActivate ahk_exe ubuntu.exe
return

^!m::
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

^!e::
IfWinActive, ahk_exe Evernote.exe
    Send !{Tab}
else
    WinActivate ahk_exe Evernote.exe
return

^!n::
IfWinActive, ahk_exe xmind.exe
    Send !{Tab}
else
    WinActivate ahk_exe xmind.exe
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

