#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay , 30, 30 ; first is delay between keypresses, and second is press duration

#WinActivateForce
DetectHiddenWindows, On

;#MaxHotkeysPerInterval 200

; https://stackoverflow.com/questions/49009176/autohotkey-causing-control-key-to-get-stuck
; https://www.autohotkey.com/docs/commands/_MenuMaskKey.htm
#MenuMaskKey vkFF

Return() {
    For Each, Modifier in ["Shift","Control","LWin","RWin","Alt"]
        If GetKeyState(Modifier) And !GetKeyState(Modifier,"P")
            Send, {%Modifier% Up}
    Exit
}
