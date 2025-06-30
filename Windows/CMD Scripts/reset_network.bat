@echo off
setlocal enabledelayedexpansion

echo.
echo ================================
echo Network Reset Script Starting...
echo ================================
echo.

REM Show current IP configuration
echo Displaying current IP configuration:
ipconfig /all
echo.

REM Release current IP addresses
echo Releasing current IP addresses...
ipconfig /release
echo.

REM Flush DNS resolver cache
echo Flushing DNS resolver cache...
ipconfig /flushdns
echo.

REM Reset TCP/IP stack
echo Resetting TCP/IP stack...
netsh int ip reset resetlog.txt
echo.

REM Reset Winsock catalog
echo Resetting Winsock catalog...
netsh winsock reset
echo.

REM Show updated IP configuration
echo Displaying updated IP configuration:
ipconfig /all
echo.

echo.
echo ================================
echo Network Reset Completed.
echo Please restart your computer to apply all changes.
echo ================================
pause
exit /b

