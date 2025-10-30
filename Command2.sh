#!/bin/bash

# Wait for 1 second to let the system settle
sleep 1

gsettings set org.gnome.desktop.background picture-uri './Wallpaper.png'


# === Step 3: Create autostart entry to open a terminal ===
cd ~/.config/autostart
vi gnome-terminal.desktop
[Desktop Entry]
Type=Application
Exec=gnome-terminal
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_NG]=Terminal
Name=Terminal
Comment[en_NG]=Start Terminal On Startup
Comment=Start Terminal On Startup





# === Step 1: Install Chinese language pack ===
echo "Updating package list and installing Chinese language pack..."
sudo apt update && sudo apt install -y task-chinese-s locales

# Enable zh_CN.UTF-8 locale
echo "Enabling zh_CN.UTF-8 locale..."
sudo sed -i '/zh_CN.UTF-8/s/^#//g' /etc/locale.gen
sudo locale-gen

# Set environment variables for Chinese locale
echo "Setting environment variables for Chinese locale..."
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:zh
export LC_ALL=zh_CN.UTF-8

# Apply system-wide locale
echo "Setting the system locale to Chinese..."
sudo update-locale LANG=zh_CN.UTF-8 LANGUAGE=zh_CN:zh LC_ALL=zh_CN.UTF-8

# Verify locale
echo "Current locale settings:"
locale

echo "Language has been set to Simplified Chinese!"
echo "The change should take effect immediately in the terminal and GUI applications."

# === Step 2: Configure automatic login for user 'info' ===
echo "Configuring automatic login for user 'info'..."
sudo sh -c 'echo "[Seat:*]" > /etc/lightdm/lightdm.conf'
sudo sh -c 'echo "autologin-user=info" >> /etc/lightdm/lightdm.conf'
sudo sh -c 'echo "autologin-user-timeout=0" >> /etc/lightdm/lightdm.conf'

echo "Applying changes to LightDM configuration..."
sudo systemctl restart lightdm || echo "LightDM restart skipped (will apply on reboot)."




# === Step 5: Optional system-wide service (for verification) ===
echo "Setting up optional system-wide message service (for verification)..."

sudo bash -c 'cat > /etc/systemd/system/echo_message.service <<EOL
[Unit]
Description=Display message after reboot
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/bin/bash -c "echo \"System booted successfully!\""
RemainAfterExit=true
User=info
Environment=LANG=zh_CN.UTF-8
Environment=LC_ALL=zh_CN.UTF-8

[Install]
WantedBy=multi-user.target
EOL'

sudo systemctl enable echo_message.service

# === Step 6: Reboot to apply all changes ===
echo "✅ All setup steps completed successfully!"
echo "💡 The system will now reboot. After login, a terminal will automatically open."
sleep 3







sudo reboot
