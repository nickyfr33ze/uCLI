#!/bin/bash

# Function to handle keyboard interruption
interrupt_handler() {
    echo "Script interrupted. Exiting..."
    break
}

# Set the interrupt_handler function to be executed on SIGINT
trap interrupt_handler SIGINT

# Ask the user to input the IP address
read -p "Enter the IP address to ping: " IP_ADDRESS
echo "----------------------------------------"

# Run the ping command indefinitely until interrupted
while true; do
    # Ping the IP address with a timeout of 1 second and 4 attempts, and make it verbose
    ping $IP_ADDRESS

    # Check the exit status of the ping command
    if [[ $ping_output == *"Request timeout for "* ]]; then
        echo "Failed to connect to $IP_ADDRESS"
        break
    fi

done