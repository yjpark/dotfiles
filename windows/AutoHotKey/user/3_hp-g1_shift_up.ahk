Up::Down
#MaxThreadsPerHotkey 10
$RShift::
  Send {Up}
  Sleep, 450
  While GetKeyState("RShift","P")
  {
    Send {Up}
    Sleep, 25
  }
Return
