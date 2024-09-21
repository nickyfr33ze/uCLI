REM This script will be designed to update a Windows system from a CLI.
echo [*] Running 'winget update' script...
echo [*] executing 'winget upgrade --all'
winget upgrade --all
echo ---------------------------------------------
echo [*] All programs updated.
REM wait 2 seconds
timeout /t 2
echo [*] Terminating program.
echo ---------------------------------------------
