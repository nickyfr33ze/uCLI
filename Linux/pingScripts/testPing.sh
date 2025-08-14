echo "--------------------------"
sleep 1
echo "[*] Testing Connectivity."
sleep 1
echo "How many ping(s) would you like to send?"
read value
echo "--------------------------"
sleep 1
ping -c $value google.com

