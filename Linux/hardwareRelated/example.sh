#!/bin/bash

# Save hardware information to a file with a timestamp
output_file="system_info_$(date +%Y%m%d_%H%M%S).txt"

# Run the lshw command and redirect output
sudo lshw -short > $output_file

# Optional: Display a message
echo "Hardware information saved to $output_file"

# This was generated from Chat Gippity by Nick Friesen on Sep 21st
# The purpose of this script is to help us craft our own script to showcase the hardware results in real time.
