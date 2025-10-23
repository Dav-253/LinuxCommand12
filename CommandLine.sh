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

# Set environment variables to use Chinese locale for the current session
echo "Setting environment variables for Chinese locale (for current session)..."
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
echo "The change should take effect immediately in the terminal and GUI applications."

# Optional: Run GNOME Language Selector (for GNOME desktop environments)
# This command will help in applying language changes to the graphical interface without a reboot.
echo "Running GNOME language selector (if using GNOME)..."
gnome-language-selector &

# Optional: Set the terminal to use Chinese (this will apply to the current session)
echo "Setting language for the current terminal session..."
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:zh
export LC_ALL=zh_CN.UTF-8

# Reload the terminal configuration to apply the language settings
echo "Reloading terminal settings..."
source ~/.bashrc  # Or `source ~/.zshrc` if you're using Zsh

# Check if everything is correctly set
echo "Locale settings after applying changes:"
locale

# Step 1: Configure automatic login for user 'info'

# Ensure the LightDM configuration file exists
echo "Configuring automatic login for user 'info'..."
sudo sh -c 'echo "[Seat:*]" >> /etc/lightdm/lightdm.conf'
sudo sh -c 'echo "autologin-user=info" >> /etc/lightdm/lightdm.conf'
sudo sh -c 'echo "autologin-user-timeout=0" >> /etc/lightdm/lightdm.conf'

# Step 2: Apply system-wide changes
echo "Applying changes to LightDM configuration..."
sudo systemctl restart lightdm

# Step 3: Reboot the system to apply all changes
echo "Rebooting the system..."
sudo reboot

# After reboot, the script should automatically continue running
# Step 4: Ensure the terminal reopens and runs the desired command after login

# Create a systemd service to run the 'echo' command after reboot
echo "Setting up systemd service to run 'echo Hello this is a message' after reboot..."

# Create the systemd service file
sudo bash -c 'cat > /etc/systemd/system/echo_message.service <<EOL
[Unit]
Description=Run Echo Command After Reboot
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/bin/bash -c "echo \"Hello this is a message\""
RemainAfterExit=true
User=info
Environment=LANG=zh_CN.UTF-8
Environment=LC_ALL=zh_CN.UTF-8

[Install]
WantedBy=multi-user.target
EOL'

# Enable the systemd service so it runs after reboot
sudo systemctl enable echo_message.service

# Exit gracefully (the script will keep running after login due to systemd service)
echo "Systemd service set up successfully. The command will run after reboot."
exit 0
