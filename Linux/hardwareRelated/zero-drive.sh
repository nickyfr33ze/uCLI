#!/bin/bash
# zero-drive.sh - Securely wipe/shred a drive with verification steps
# Usage: ./zero-drive.sh

set -e

echo "===== SECURE DRIVE SHREDDING UTILITY ====="
echo "This script will completely and irrecoverably destroy all data on the specified drive."
echo "The process uses 'shred' with 3 random overwrite passes, followed by a zero-fill pass."
echo

# Request drive path
read -p "Enter the path of the drive to shred (e.g., /dev/sdb): " DRIVE_PATH

# Verify drive exists
if [ ! -e "$DRIVE_PATH" ]; then
    echo "ERROR: The specified drive path '$DRIVE_PATH' does not exist!"
    exit 1
fi

# Display drive info
echo
echo "Drive information:"
echo "-----------------"
lsblk "$DRIVE_PATH" || fdisk -l "$DRIVE_PATH" || echo "Unable to display drive details"
echo

# First confirmation
read -p "Is this the correct drive you want to PERMANENTLY ERASE? (yes/no): " CONFIRM1
if [[ ! "$CONFIRM1" =~ ^[Yy][Ee][Ss]$ ]]; then
    echo "Operation aborted by user."
    exit 0
fi

# Show the exact command
SHRED_CMD="sudo shred -v -n 3 -z $DRIVE_PATH"
echo
echo "The following command will be executed:"
echo "----------------------------------------"
echo "$SHRED_CMD"
echo "----------------------------------------"
echo "This will:"
echo "  1. Overwrite the drive with random data (3 passes)"
echo "  2. Perform a final zero-fill pass"
echo "  3. Completely destroy ALL data on $DRIVE_PATH"
echo

# Final confirmation with capitals for emphasis
read -p "Are you ABSOLUTELY SURE you want to proceed? This CANNOT be undone! (YES/NO): " CONFIRM2
if [ "$CONFIRM2" != "YES" ]; then
    echo "Operation aborted by user. The drive has NOT been modified."
    exit 0
fi

# Execute the shred command
echo
echo "Starting secure drive shredding process..."
echo "This will take a significant amount of time depending on drive size."
echo "Started at: $(date)"
echo

eval "$SHRED_CMD"

echo
echo "Drive shredding completed at: $(date)"
echo "The drive has been securely zero'd."