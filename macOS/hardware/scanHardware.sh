#!/bin/bash

# Scanning system information on a macOS system/terminal
echo "[*] Starting system information scan..."
sleep 1
echo "Please choose a detail level: mini, basic, or full"
read detail_level
sleep 1 
echo "[*] Scanning system information with detail level: $detail_level"
sleep 1
echo "Do you want to save the output to a file? (y/n)"
read save_to_file
sleep 1
case $detail_level in
    mini|basic|full)
        if [[ $save_to_file == "y" || $save_to_file == "Y" ]]; then
            echo "Enter the filename (e.g., system_info.txt):"
            read filename
            echo "[*] Saving output to $filename..."
            system_profiler -detaillevel $detail_level > "$filename"
            echo "[*] Output saved to $filename"
        else
            system_profiler -detaillevel $detail_level
        fi
        ;;
    *)
        echo "Invalid detail level. Please choose mini, basic, or full."
        ;;
esac
sleep 1
echo "[*] System information scan completed."
