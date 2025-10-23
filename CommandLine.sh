#!/bin/bash

# Wait for 1 second to let the system settle
sleep 1

# Update package list and install Chinese language pack
echo "Updating package list and installing Chinese language pack..."
sudo apt update && sudo apt install -y task-chinese-s locales

# Enable the zh_CN.UTF-8 locale by adding it to /etc/locale.gen
echo "Enabling zh_CN.UTF-8 locale..."
sudo sed -i '/zh_CN.UTF-8/s/^#//g' /etc/locale.gen

# Generate the zh_CN.UTF-8 locale (non-interactive)
echo "Generating zh_CN.UTF-8 locale..."
sudo locale-gen

# Set environment variables to use Chinese locale
echo "Setting environment variables for Chinese locale..."
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:zh
export LC_ALL=zh_CN.UTF-8
export LC_CTYPE=zh_CN.UTF-8
export LC_NUMERIC=zh_CN.UTF-8
export LC_TIME=zh_CN.UTF-8
export LC_COLLATE=zh_CN.UTF-8
export LC_MONETARY=zh_CN.UTF-8
export LC_MESSAGES=zh_CN.UTF-8
export LC_PAPER=zh_CN.UTF-8
export LC_NAME=zh_CN.UTF-8
export LC_ADDRESS=zh_CN.UTF-8
export LC_TELEPHONE=zh_CN.UTF-8
export LC_MEASUREMENT=zh_CN.UTF-8
export LC_IDENTIFICATION=zh_CN.UTF-8

# Update the system locale to use the Chinese locale
echo "Setting the system locale to Chinese..."
sudo update-locale LANG=zh_CN.UTF-8 LANGUAGE=zh_CN:zh LC_ALL=zh_CN.UTF-8

# Verify the locale settings
echo "Current locale settings:"
locale

# Output success message
echo "Language has been set to Simplified Chinese!"
echo "Please log out and log back in for the display language to take effect in the GUI."

# Optional: Set the terminal to use Chinese (this will apply to the current session)
echo "Setting language for the current terminal session..."
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:zh
export LC_ALL=zh_CN.UTF-8

# Check if everything is correctly set
echo "Locale settings after applying changes:"
locale
