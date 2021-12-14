; https://www.autohotkey.com/board/topic/15919-ahk-script-for-pointermouse-focus/

#Persistent
SetTimer, WatchCursor, 100
return

WatchCursor:
MouseGetPos, , , id
WinActivate,ahk_id %id%
return
