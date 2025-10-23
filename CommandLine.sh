#!/bin/bash

# Wait for 1 second
sleep 1

# Update package list
echo "Updating package list..."
sudo apt update

# Install Chinese language pack
echo "Installing Chinese language pack..."
sudo apt install -y task-chinese-s

# Generate the zh_CN.UTF-8 locale
echo "Generating zh_CN.UTF-8 locale..."
sudo locale-gen zh_CN.UTF-8

# Update the system locale to Chinese (Simplified)
echo "Setting the system locale to Chinese..."
sudo update-locale LANG=zh_CN.UTF-8 LANGUAGE=zh_CN:zh LC_ALL=zh_CN.UTF-8

# Confirm the locale settings
echo "Locale settings after update:"
locale

# Output success message
echo "Language has been set to Simplified Chinese!"
echo "Please log out and log back in for the display language to take effect in the GUI."

# Optional: Set locale settings for terminal session
echo "Setting language for the terminal session..."
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:zh
export LC_ALL=zh_CN.UTF-8
