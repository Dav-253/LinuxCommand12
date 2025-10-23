#!/bin/bash

# Update package list and install Chinese language pack
sudo apt update && sudo apt install -y task-chinese-s

# Generate the zh_CN.UTF-8 locale and set it
sudo locale-gen zh_CN.UTF-8
sudo update-locale LANG=zh_CN.UTF-8

echo "Language set to Simplified Chinese!"

# Wait for 1 second
sleep 1

echo "Crashing Computer"
