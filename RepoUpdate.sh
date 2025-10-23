#!/bin/bash

# First, update the package list to know what's available
echo "Updating package list..."
sudo apt update

# Get a count of upgradable packages.
upgradable_count=$(apt list --upgradable 2>/dev/null | wc -l)

# The apt list command always returns a header, so a result of '1' means no updates.
if [ "$upgradable_count" -gt 1 ]; then
  echo "Updates are available. Proceeding with upgrade..."
  sudo apt upgrade -y
  echo "Upgrade complete."
else
  echo "No updates available. System is up to date."
fi
