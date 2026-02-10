#!/bin/bash

LOGFILE="shred_log.txt"
echo "Starting data disposal process..." | tee -a $LOGFILE

read -p "Enter the target drive (e.g., sda, nvme0n1): " drive
DEVICE="/dev/$drive"

if [ ! -b "$DEVICE" ]; then
    echo "Error: $DEVICE is not a valid block device." | tee -a $LOGFILE
    exit 1
fi

echo "Checking drive type for $DEVICE..." | tee -a $LOGFILE
ROTA=$(lsblk -d -o NAME,ROTA | grep "$drive" | awk '{print $2}')

if [ "$ROTA" == "1" ]; then
    echo "$DEVICE is detected as HDD (rotational)." | tee -a $LOGFILE
    echo "Proceeding with shredding using 5 overwrite passes and final zero pass..." | tee -a $LOGFILE
    sudo shred -v -n 5 -z "$DEVICE" | tee -a $LOGFILE
    echo "Shredding completed for $DEVICE." | tee -a $LOGFILE
elif [ "$ROTA" == "0" ]; then
    echo "$DEVICE is detected as SSD (non-rotational)." | tee -a $LOGFILE
    echo "WARNING: shred is not recommended for SSDs due to wear leveling." | tee -a $LOGFILE
    echo "Please use manufacturer-specific secure erase tools or cryptographic erase methods." | tee -a $LOGFILE
else
    echo "Unable to determine drive type. Please verify manually." | tee -a $LOGFILE
fi

echo "Data disposal process completed." | tee -a $LOGFILE
