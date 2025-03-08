## Scripts to check
chkdsk /f /r 
sfc /scannow
DISM.exe /Cleanup-Image /Online /CheckHealth
/ScanHealth /RestoreHealth
