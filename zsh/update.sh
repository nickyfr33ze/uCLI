echo "[*] Running updates..."
sleep 1
echo "[*] Running: 'sudo apt update'"
sleep 1
echo "[*] If you are not 'root' please input your password."
sudo apt update
sleep 1
echo "------------------------"
sleep 1
echo "[*] Updates complete."
sleep 1
echo "------------------------"
sleep 1
echo "[*] Running: sudo apt upgrade -y"
sleep 1
sudo apt upgrade -y
sleep 1
echo "------------------------"
echo "[*] Upgrades complete."
sleep 1
echo "------------------------"
sleep 1
echo "[*] Running: 'sudo apt autoremove -y'"
sudo apt autoremove -y
sleep 1
echo "--------------------------------------------"
sleep 1
echo "[*] Applications autoremoved successfully."
sleep 1
echo "--------------------------------------------"
sleep 2
echo "[*] Updates & Upgrades applied successfully. Terminiating program..."
sleep 2
echo "--------------------------------------------"

