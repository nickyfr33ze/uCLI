#!/bin/bash

# IP address to ping
IP_ADDRESS="192.168.1.1"

# Ping the IP address with a timeout of 1 second and 4 attempts, and make it verbose
ping -c 6 -W 1 -v $IP_ADDRESS
# > /dev/null 2>&1
# Check the exit status of the ping command
if [ $? -ne 0 ]; then
    echo "Failed to connect to $IP_ADDRESS after 4 attempts."
    exit 1
fi

echo "Successfully connected to $IP_ADDRESS."