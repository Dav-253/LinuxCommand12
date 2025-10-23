#!/bin/bash


#Check for any updates
echo "Checking for updates..."
sudo apt update > /dev/null

# Get a count of upgradable packages.
# 'apt list --upgradable' includes a header, so we subtract 1.
upgradable_count=$(apt list --upgradable 2>/dev/null | wc -l)

# The apt list command always returns a header, so a result of '1' means no updates.
if [ "$upgradable_count" -gt 1 ]; then
  echo "Updates are available. Proceeding with upgrade..."
  sudo apt upgrade -y
  echo "Upgrade complete."
else
  echo "No updates available. System is up to date."
fi

