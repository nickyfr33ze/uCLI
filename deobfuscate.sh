#!/bin/bash

echo "String Deobfuscator"
echo "==================="
echo "This script helps deobfuscate strings using various methods."
echo ""

# Get the input string
read -p "Enter the obfuscated string: " input_string

# Show menu of deobfuscation options
echo ""
echo "Choose a deobfuscation method:"
echo "1. Base64 decode"
echo "2. URL decode"
echo "3. Hex decode"
echo "4. Reverse string"
echo "5. ROT13"
echo ""

read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        # Base64 decode
        result=$(echo "$input_string" | base64 -d 2>/dev/null)
        method="Base64 decode"
        ;;
    2)
        # URL decode
        result=$(printf '%b' "${input_string//%/\\x}")
        method="URL decode"
        ;;
    3)
        # Hex decode
        result=$(echo "$input_string" | xxd -r -p 2>/dev/null)
        method="Hex decode"
        ;;
    4)
        # Reverse string
        result=$(echo "$input_string" | rev)
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
echo "Deobfuscation Result ($method):"
echo "------------------------------"
echo "$result"
echo ""

# Ask if they want to save the result
read -p "Save result to file? (y/n): " save_choice
if [[ $save_choice == "y" || $save_choice == "Y" ]]; then
    read -p "Enter filename: " filename
    echo "$result" > "$filename"
    echo "Result saved to $filename"
fi