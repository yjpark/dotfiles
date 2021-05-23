#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay , 30, 30 ; first is delay between keypresses, and second is press duration

#WinActivateForce
DetectHiddenWindows, On

; #MaxHotkeysPerInterval 200
; #UseHook

#SingleInstance, force

