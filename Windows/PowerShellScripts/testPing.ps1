echo "--------------------------"
Start-Sleep -Seconds 1
echo "[*] Testing Connectivity."
Start-Sleep -Seconds 1
$value = Read-Host "How many ping(s) would you like to send?"
echo "--------------------------"
Start-Sleep -Seconds 1
echo "[*] Executing 'ping -c $value google.com'"
echo ""
Start-Sleep -Seconds 1
ping -c $value google.com