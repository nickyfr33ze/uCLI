echo "[*] Running updates..."
sleep 1
echo "[*] Running: 'sudo apt-get update && sudo apt-get upgrade -y'"
sleep 0.5
echo "[*] If you are not 'root' please input your password."
sudo apt-get update && sudo apt-get upgrade -y
sleep 0.5
echo "------------------------"
sleep 1
echo "[*] Updates complete."
echo "------------------------"
sleep 1
echo "[*] Running: 'sudo apt autoremove'"
sudo apt autoremove -y
sleep 0.5
echo "--------------------------------------------"
sleep 1
echo "[*] Applications autoremoved successfully."
echo "--------------------------------------------"
sleep 2
