@echo off
setlocal enabledelayedexpansion
color 0A
title System Integrity Checker and Repair Utility

:: Check for admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrative privileges.
    echo Please run this script as an administrator.
    pause
    exit /b 1
)

:main_menu
cls
echo ===================================
echo  SYSTEM INTEGRITY CHECKER AND REPAIR
echo ===================================
echo.
echo  1. Run CHKDSK (Check Disk)
echo  2. Run SFC (System File Checker)
echo  3. Run DISM (Deployment Image Servicing and Management)
echo  4. Run all checks in sequence
echo  5. Exit
echo.
set /p choice=Enter your choice (1-5): 

if "%choice%"=="1" goto chkdsk_menu
if "%choice%"=="2" goto sfc_scan
if "%choice%"=="3" goto dism_menu
if "%choice%"=="4" goto run_all
if "%choice%"=="5" goto end
goto main_menu

:chkdsk_menu
cls
echo ===================================
echo  CHKDSK OPTIONS
echo ===================================
echo.
echo  1. Basic check without fixing (chkdsk)
echo  2. Check and fix errors (chkdsk /f)
echo  3. Full scan with bad sector recovery (chkdsk /r)
echo  4. Return to main menu
echo.
set /p chkdsk_choice=Enter your choice (1-4): 

if "%chkdsk_choice%"=="1" goto chkdsk_basic
if "%chkdsk_choice%"=="2" goto chkdsk_fix
if "%chkdsk_choice%"=="3" goto chkdsk_full
if "%chkdsk_choice%"=="4" goto main_menu
goto chkdsk_menu

:chkdsk_basic
cls
echo Running basic CHKDSK scan...
echo.
chkdsk
echo.
echo Basic CHKDSK scan completed.
pause
goto main_menu

:chkdsk_fix
cls
echo Running CHKDSK with error fixing...
echo.
set /p drive=Enter drive letter (e.g., C): 
echo.
echo CHKDSK will check and fix errors on drive %drive%:
echo If this is your system drive, you'll need to restart your computer.
echo.
chkdsk %drive%: /f
echo.
echo CHKDSK /F completed or scheduled.
pause
goto main_menu

:chkdsk_full
cls
echo Running full CHKDSK with bad sector recovery...
echo.
set /p drive=Enter drive letter (e.g., C): 
echo.
echo CHKDSK will perform a full scan with bad sector recovery on drive %drive%:
echo This may take a long time. If this is your system drive, you'll need to restart your computer.
echo.
chkdsk %drive%: /r
echo.
echo CHKDSK /R completed or scheduled.
pause
goto main_menu

:sfc_scan
cls
echo ===================================
echo  SYSTEM FILE CHECKER
echo ===================================
echo.
echo Running SFC scan to check and repair system files...
echo This may take some time. Please wait...
echo.
sfc /scannow
echo.
echo SFC scan completed.
pause
goto main_menu

:dism_menu
cls
echo ===================================
echo  DISM OPTIONS
echo ===================================
echo.
echo  1. Check health (DISM /CheckHealth)
echo  2. Scan health (DISM /ScanHealth)
echo  3. Restore health (DISM /RestoreHealth)
echo  4. Return to main menu
echo.
set /p dism_choice=Enter your choice (1-4): 

if "%dism_choice%"=="1" goto dism_check
if "%dism_choice%"=="2" goto dism_scan
if "%dism_choice%"=="3" goto dism_restore
if "%dism_choice%"=="4" goto main_menu
goto dism_menu

:dism_check
cls
echo Running DISM check health...
echo.
DISM /Online /Cleanup-Image /CheckHealth
echo.
echo DISM check health completed.
pause
goto main_menu

:dism_scan
cls
echo Running DISM scan health...
echo This may take some time. Please wait...
echo.
DISM /Online /Cleanup-Image /ScanHealth
echo.
echo DISM scan health completed.
pause
goto main_menu

:dism_restore
cls
echo Running DISM restore health...
echo This may take some time. Please wait...
echo.
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo DISM restore health completed.
pause
goto main_menu

:run_all
cls
echo ===================================
echo  RUNNING ALL SYSTEM CHECKS
echo ===================================
echo.
echo This will run a comprehensive system check in the following order:
echo 1. DISM /CheckHealth, /ScanHealth and /RestoreHealth
echo 2. SFC /scannow
echo 3. CHKDSK basic check
echo.
echo This may take a long time to complete.
echo.
set /p confirm=Do you want to proceed? (Y/N): 
if /i "%confirm%"=="Y" goto run_all_confirmed
goto main_menu

:run_all_confirmed
cls
echo Step 1/3: Running DISM checks...
echo.
echo Running DISM check health...
DISM /Online /Cleanup-Image /CheckHealth
echo.
echo Running DISM scan health...
DISM /Online /Cleanup-Image /ScanHealth
echo.
echo Running DISM restore health...
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo DISM checks completed.
echo.
echo Step 2/3: Running SFC scan...
sfc /scannow
echo.
echo SFC scan completed.
echo.
echo Step 3/3: Running basic CHKDSK...
chkdsk
echo.
echo All system checks completed!
echo If issues were found, you may want to run more specific repairs.
echo.
pause
goto main_menu

:end
cls
echo Thank you for using the System Integrity Checker and Repair Utility.
echo Exiting...
timeout /t 2 >nul
exit /b 0