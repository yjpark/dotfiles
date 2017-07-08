@echo off
if "%~1" == "-run" goto run
ConEmuC -c "%~0" -run "-new_console:C:%LOCALAPPDATA%\lxss\bash.ico" "-new_console:d:%~dp0" -new_console:np
goto :EOF
:run
call SetEscChar
echo %ESC%[9999H
conemu-cyg-32.exe ./wslbridge.exe -t ./wsl-boot.sh