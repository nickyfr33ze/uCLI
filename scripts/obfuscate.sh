#!/bin/bash

echo "String Obfuscator"
echo "================="
echo "This script helps obfuscate strings using various methods."
echo ""

# Get the input string
read -p "Enter the string to obfuscate: " input_string

# Show menu of obfuscation options
echo ""
echo "Choose an obfuscation method:"
echo "1. Base64 encode"
echo "2. URL encode"
echo "3. Hex encode"
echo "4. Reverse string"
echo "5. ROT13"
echo ""

read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        # Base64 encode
        result=$(echo -n "$input_string" | base64)
        method="Base64 encode"
        ;;
    2)
        # URL encode
        result=$(echo -n "$input_string" | xxd -plain | sed 's/\(..\)/%\1/g')
        method="URL encode"
        ;;
    3)
        # Hex encode
        result=$(echo -n "$input_string" | xxd -p | tr -d '\n')
        method="Hex encode"
        ;;
    4)
        # Reverse string
        result=$(echo -n "$input_string" | rev)
        method="Reverse string"
        ;;
    5)
        # ROT13
        result=$(echo "$input_string" | tr 'A-Za-z' 'N-ZA-Mn-za-m')
        method="ROT13"
        ;;
    *)
        echo "Invalid choice."
        exit 1
        ;;
esac

echo ""
echo "Obfuscation Result ($method):"
echo "-----------------------------"
echo "$result"
echo ""

# Ask if they want to save the result
read -p "Save result to file? (y/n): " save_choice
if [[ $save_choice == "y" || $save_choice == "Y" ]]; then
    read -p "Enter filename: " filename
    echo "$result" > "$filename"
    echo "Result saved to $filename"
else
    echo "Result not saved."
fi