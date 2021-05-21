#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#WinActivateForce
DetectHiddenWindows, On

SetKeyDelay , 30, 30 ; first is delay between keypresses, and second is press duration

Ctrl UP::Send {Escape}
Ctrl & F13::

^Tab::
    Send #{Tab}
return

^`::
    IfWinActive, ahk_exe WindowsTerminal.exe
        Send !{Tab}
    else
        WinActivate ahk_exe WindowsTerminal.exe
return

^!t::
    IfWinActive, ahk_exe alacritty.exe
        Send !{Tab}
    else
        WinActivate ahk_exe alacritty.exe
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

^!n::
    IfWinActive, ahk_exe MindMaster.exe
        Send !{Tab}
    else
        WinActivate ahk_exe MindMaster.exe
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

global ChineseLayout := 0

SetCapsLockState, AlwaysOff
+CapsLock::CapsLock

CapsLock::
    Send, {Alt Down}{Shift Down}{Shift Up}{Alt Up}
    ChineseLayout := !ChineseLayout
    If ChineseLayout = 1
        KeyboardLED(4, "on")
    Else
        KeyboardLED(4, "off")
return

/*

    Keyboard LED control for AutoHotkey_L
        http://www.autohotkey.com/forum/viewtopic.php?p=468000#468000

    KeyboardLED(LEDvalue, "Cmd", Kbd)
        LEDvalue  - ScrollLock=1, NumLock=2, CapsLock=4
        Cmd       - on/off/switch
        Kbd       - index of keyboard (probably 0 or 2)

*/

KeyboardLED(LEDvalue, Cmd, Kbd=0)
{
  SetUnicodeStr(fn,"\Device\KeyBoardClass" Kbd)
  h_device:=NtCreateFile(fn,0+0x00000100+0x00000080+0x00100000,1,1,0x00000040+0x00000020,0)

  If Cmd= switch  ;switches every LED according to LEDvalue
   KeyLED:= LEDvalue
  If Cmd= on  ;forces all choosen LED's to ON (LEDvalue= 0 ->LED's according to keystate)
   KeyLED:= LEDvalue | (GetKeyState("ScrollLock", "T") + 2*GetKeyState("NumLock", "T") + 4*GetKeyState("CapsLock", "T"))
  If Cmd= off  ;forces all choosen LED's to OFF (LEDvalue= 0 ->LED's according to keystate)
    {
    LEDvalue:= LEDvalue ^ 7
    KeyLED:= LEDvalue & (GetKeyState("ScrollLock", "T") + 2*GetKeyState("NumLock", "T") + 4*GetKeyState("CapsLock", "T"))
    }

  success := DllCall( "DeviceIoControl"
              ,  "ptr", h_device
              , "uint", CTL_CODE( 0x0000000b     ; FILE_DEVICE_KEYBOARD
                        , 2
                        , 0             ; METHOD_BUFFERED
                        , 0  )          ; FILE_ANY_ACCESS
              , "int*", KeyLED << 16
              , "uint", 4
              ,  "ptr", 0
              , "uint", 0
              ,  "ptr*", output_actual
              ,  "ptr", 0 )

  NtCloseFile(h_device)
  return success
}

CTL_CODE( p_device_type, p_function, p_method, p_access )
{
  Return, ( p_device_type << 16 ) | ( p_access << 14 ) | ( p_function << 2 ) | p_method
}


NtCreateFile(ByRef wfilename,desiredaccess,sharemode,createdist,flags,fattribs)
{
  VarSetCapacity(objattrib,6*A_PtrSize,0)
  VarSetCapacity(io,2*A_PtrSize,0)
  VarSetCapacity(pus,2*A_PtrSize)
  DllCall("ntdll\RtlInitUnicodeString","ptr",&pus,"ptr",&wfilename)
  NumPut(6*A_PtrSize,objattrib,0)
  NumPut(&pus,objattrib,2*A_PtrSize)
  status:=DllCall("ntdll\ZwCreateFile","ptr*",fh,"UInt",desiredaccess,"ptr",&objattrib
                  ,"ptr",&io,"ptr",0,"UInt",fattribs,"UInt",sharemode,"UInt",createdist
                  ,"UInt",flags,"ptr",0,"UInt",0, "UInt")
  return % fh
}

NtCloseFile(handle)
{
  return DllCall("ntdll\ZwClose","ptr",handle)
}

SetUnicodeStr(ByRef out, str_)
{
  VarSetCapacity(out,2*StrPut(str_,"utf-16"))
  StrPut(str_,&out,"utf-16")
}