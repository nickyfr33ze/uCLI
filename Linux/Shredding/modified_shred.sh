#!/bin/bash

# Usage: ./shred.sh <drive>
# Example: ./shred.sh sda

drive=$1
log_file="shred_log.txt"

if [ -z "$drive" ]; then
    echo "Usage: $0 <drive>" | tee -a "$log_file"
    exit 1
fi

# Detect if the drive is rotational (HDD) or non-rotational (SSD)
rota=$(lsblk -d -o NAME,ROTA | grep "^$drive" | awk '{print $2}')

if [ "$rota" == "1" ]; then
    echo "Drive /dev/$drive is an HDD. Proceeding with shred..." | tee -a "$log_file"
    sudo shred -v -n 5 -z /dev/$drive | tee -a "$log_file"
    echo "Shredding completed for /dev/$drive." | tee -a "$log_file"
elif [ "$rota" == "0" ]; then
    echo "Drive /dev/$drive is an SSD. shred is not recommended for SSDs." | tee -a "$log_file"
    echo "Please use manufacturer-specific secure erase tools or cryptographic erase methods." | tee -a "$log_file"
else
    echo "Unable to determine drive type for /dev/$drive." | tee -a "$log_file"
fi
