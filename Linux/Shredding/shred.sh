#!/bin/bash

# Interactive script to securely shred a drive

echo "Secure Drive Shredder"
echo "WARNING: This will irreversibly delete all data on the selected drive."
echo "Please ensure you have selected the correct drive."

# List available drives
echo "Available drives:"
lsblk -d -o NAME,SIZE,MODEL | grep -v "loop"

# Prompt user for drive
read -p "Enter the drive to shred (e.g., sda): " drive

# Confirm the drive
read -p "Are you sure you want to shred /dev/$drive? This action cannot be undone. (yes/no): " confirmation

if [[ "$confirmation" == "yes" ]]; then
    # Additional confirmation prompt
    read -p "The command about to be ran is the following: sudo shred -v -n 5 -z /dev/$drive. 
    Are you absolutely sure you want to shred /dev/$drive? Type 'I am sure' to proceed: " final_confirmation

    if [[ "$final_confirmation" == "I am sure" ]]; then
        echo "Shredding /dev/$drive..."
        sudo shred -v -n 5 -z /dev/$drive
        echo "Shredding completed."
    else
        echo "Operation canceled."
    fi
else
    echo "Operation canceled."
fi