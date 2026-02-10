#!/bin/bash

echo "String Obfuscator"
echo "================="
echo "This script helps obfuscate strings using various methods."
echo ""

# Choose input method
echo "How would you like to provide input?"
echo "1. Single line  (type or paste a one-liner)"
echo "2. Multi-line   (type/paste freely, then press Ctrl+D when done)"
echo "3. Delimiter    (type lines, enter 'END' on its own line to finish)"
echo "4. From file    (provide a file path to read from)"
echo ""

read -p "Input method (1-4): " input_method

case $input_method in
    1)
        read -p "Enter the string to obfuscate: " input_string
        ;;
    2)
        echo "Paste or type your text below. Press Ctrl+D when finished:"
        input_string=$(cat)
        ;;
    3)
        echo "Type your text below. Enter 'END' on its own line when finished:"
        input_string=""
        while IFS= read -r line; do
            [[ "$line" == "END" ]] && break
            if [[ -z "$input_string" ]]; then
                input_string="$line"
            else
                input_string="$input_string"$'\n'"$line"
            fi
        done
        ;;
    4)
        read -p "Enter the file path: " filepath
        if [[ -f "$filepath" ]]; then
            input_string=$(cat "$filepath")
        else
            echo "Error: File not found — $filepath"
            exit 1
        fi
        ;;
    *)
        echo "Invalid input method."
        exit 1
        ;;
esac

echo ""
echo "Input captured ($(echo "$input_string" | wc -l | tr -d ' ') line(s), $(echo -n "$input_string" | wc -c | tr -d ' ') bytes)"

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