#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.

; Some one said without this input mode change, control key stuck issue are gone
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay , 30, 30 ; first is delay between keypresses, and second is press duration

#WinActivateForce
DetectHiddenWindows, On

;#MaxHotkeysPerInterval 200

; https://stackoverflow.com/questions/49009176/autohotkey-causing-control-key-to-get-stuck
; https://www.autohotkey.com/docs/commands/_MenuMaskKey.htm
#MenuMaskKey vkFF

return() {
    For Each, Modifier in ["Shift","LWin","RWin","Alt","LControl", "RControl"]
        ; If GetKeyState(Modifier) And !GetKeyState(Modifier,"P")
        If GetKeyState(Modifier)
            Send, {%Modifier% Up}
    Exit
}
