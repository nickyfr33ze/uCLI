#!/bin/bash

# Ask the user to input the IP address
read -p "Enter the IP address to ping: " IP_ADDRESS

# Ping the IP address with a timeout of 1 second and 4 attempts, and make it verbose
ping -c 6 -W 1 -v $IP_ADDRESS

# Check the exit status of the ping command
if [ $? -ne 0 ]; then
    echo "Failed to connect to $IP_ADDRESS after 4 attempts."
    exit 1
fi

echo "Successfully connected to $IP_ADDRESS."