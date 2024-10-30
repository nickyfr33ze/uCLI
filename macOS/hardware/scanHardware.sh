#!/bin/bash

# Scanning system information on a macOS system/terminal
echo "[*] Starting system information scan..."
sleep 1
echo "Please choose a detail level: mini, basic, or full"
read detail_level
sleep 1 
echo "[*] Scanning system information with detail level: $detail_level"
sleep 1
case $detail_level in
    mini|basic|full)
        system_profiler -detaillevel $detail_level
        ;;
    *)
        echo "Invalid detail level. Please choose mini, basic, or full."
        ;;
esac
sleep 1
echo "[*] System information scan completed."
