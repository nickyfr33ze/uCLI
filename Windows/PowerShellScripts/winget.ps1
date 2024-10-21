echo "[*] Running updates..."
Start-Sleep -Seconds 1
echo "[*] Running: 'winget upgrade --all'"
Start-Sleep -Seconds 1
winget upgrade --all
echo "------------------------"
Start-Sleep -Seconds 1
echo "[*] Updates complete."
Start-Sleep -Seconds 1
echo "------------------------"
Start-Sleep -Seconds 1
echo "[*] Cleaning up..."
Start-Sleep -Seconds 1
echo "[*] Running: 'Clear-RecycleBin -Force'"
Clear-RecycleBin -Force
echo "------------------------"
echo "[*] Cleanup complete."
Start-Sleep -Seconds 1
echo "============================================"
echo "[!] UPDATES APPLIED AND SYSTEM CLEANED."
