#!/bin/bash

# Exit on any error
set -e

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo "Error: This script must be run as root (use sudo)." 
   exit 1
fi

# Check if required tools are installed
if ! command -v wget &> /dev/null; then
    echo "Installing wget..."
    apt update
    apt install -y wget
fi

if ! command -v gpg &> /dev/null; then
    echo "Installing gpg..."
    apt update
    apt install -y gnupg
fi

# Create directory for keyring
mkdir -p -m 755 /etc/apt/keyrings

# Download and install the ACLI GPG key
echo "Downloading ACLI GPG key..."
wget -nv -O- https://acli.atlassian.com/gpg/public-key.asc | gpg --dearmor -o /etc/apt/keyrings/acli-archive-keyring.gpg

# Set permissions for the keyring
chmod go+r /etc/apt/keyrings/acli-archive-keyring.gpg

# Add ACLI repository to sources list
echo "Adding ACLI repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/acli-archive-keyring.gpg] https://acli.atlassian.com/linux/deb stable main" | tee /etc/apt/sources.list.d/acli.list > /dev/null

# Update package lists
echo "Updating package lists..."
apt update

# Install ACLI
echo "Installing Atlassian CLI..."
apt install -y acli

# Verify installation
if command -v acli &> /dev/null; then
    echo "Atlassian CLI installed successfully!"
    acli --version
else
    echo "Error: Installation failed. Please check the script and try again."
    exit 1
fi

echo "To upgrade ACLI in the future, run: sudo apt update && sudo apt upgrade acli"
