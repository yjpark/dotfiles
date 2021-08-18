global ShiftDownTicks := 0
global ShiftPressed := 0

Loop
{
    if (ShiftPressed = 0) && GetKeyState("Shift")
    {
        ShiftPressed := 1
        ShiftDownTicks := A_TickCount
    }
    Sleep, 50
}

Shift UP::
    sleep 10
    ElapsedTime := A_TickCount - ShiftDownTicks
    MsgBox %ShiftDownTicks% DOWN %ElapsedTime% Up
    If ElapsedTime < 250
    {
        Send {Escape}
    }
    ShiftPressed := 0
return()

Shift & F13::

