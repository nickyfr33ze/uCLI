# AGENTS.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Overview

uCLI is a collection of standalone utility scripts for system administration and productivity automation across Linux, macOS, Windows, and Python. Scripts are designed to be run directly without a build system.

## Repository Structure

- `Linux/` - Bash scripts for Debian/Ubuntu systems (apt package management, network tools, drive shredding, Kali setup)
- `macOS/` - Shell scripts for macOS (Homebrew management, system utilities)
- `Windows/` - PowerShell (`.ps1`) and batch (`.bat`) scripts for Windows administration
- `Python/` - Python utilities for network/IP lookup and text processing
- `scripts/` - Cross-platform utilities like string obfuscation/deobfuscation

## Running Scripts

Scripts are standalone and run directly:
```bash
# Bash/shell scripts
bash Linux/update.sh
./scripts/obfuscate.sh

# Python scripts
python3 Python/ip_info.py

# PowerShell (Windows)
.\Windows\PowerShellScripts\hardwareInfo.ps1
```

Many scripts require elevated privileges (`sudo` on Linux/macOS, Administrator on Windows).

## Script Conventions

- Status messages use bracketed prefixes: `[*]` for info, `[!]` for warnings/important
- Interactive scripts use `read -p` for user prompts
- Dangerous operations (like `Linux/Shredding/`) include multiple confirmation prompts
- Kali-related scripts in `Linux/Kali/` should include the disclaimer template from `Linux/Kali/disclaimer.md`

## When Adding New Scripts

- Place scripts in the appropriate OS directory
- Use shebang (`#!/bin/bash`) for shell scripts
- Follow existing echo/sleep patterns for user feedback
- For destructive operations, implement confirmation prompts similar to `Linux/Shredding/shred.sh`
