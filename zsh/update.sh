echo "[*] Running updates..."
sleep 1
echo "[*] Running: 'sudo apt update'"
sleep 0.5
echo "[*] If you are not 'root' please input your password."
sudo apt update
sleep 0.5
echo "------------------------"
sleep 1
echo "[*] Updates complete."
echo "------------------------"
sleep 1
echo "[*] Running: sudo apt upgrade -y"
sleep 0.5
sudo apt upgrade -y
sleep 1
echo "------------------------"
echo "[*] Upgrades complete."
echo "------------------------"
sleep 1
echo "[*] Running: 'sudo apt autoremove -y'"
sudo apt autoremove -y
sleep 0.5
echo "--------------------------------------------"
sleep 1
echo "[*] Applications autoremoved successfully."
echo "--------------------------------------------"
sleep 2
