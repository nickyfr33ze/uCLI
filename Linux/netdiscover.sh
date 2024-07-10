#!/bin/bash

# Created by Nick Friesen on 2024-05-16 @ 19:05
# This script is to scan the network the linux machine is connected to currently.
# This should be a quicker snapshot of the network.
# Another option is to include flags within the script that makes it go on longer.

import subprocess
import sys

def is_netdiscover_installed():
    """Check if netdiscover is installed."""
    result = subprocess.run(['which', 'netdiscover'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return result.returncode == 0

def install_netdiscover():
    """Install netdiscover using apt."""
    print("Netdiscover is not installed. Installing...")
    subprocess.run(['sudo', 'apt', 'update'])
    subprocess.run(['sudo', 'apt', 'install', '-y', 'netdiscover'])

def run_netdiscover():
    """Run netdiscover."""
    print("Running netdiscover...")
    subprocess.run(['netdiscover'])

def main():
    if not is_netdiscover_installed():
        install_netdiscover()
        if not is_netdiscover_installed():
            print("Failed to install netdiscover. Exiting.")
            sys.exit(1)
        response = input("Netdiscover installed. Would you like to run it now? (y/n): ")
        if response.lower() == 'y':
            run_netdiscover()
        else:
            print("Exiting without running netdiscover.")
    else:
        run_netdiscover()

if __name__ == "__main__":
    main()
