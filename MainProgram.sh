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


# Navigate to your Git repository directory.
# Replace '/path/to/your/repo' with the actual path.
cd ~/LinuxCommand12 || exit

# Fetch the latest information from the remote
echo "Fetching latest changes from remote..."
git fetch origin

# Get the name of the current branch
branch_name=$(git symbolic-ref --short HEAD)

# Check the status against the remote branch
status=$(git status -uno)

if echo "$status" | grep -q "up to date"; then
  echo "Your local branch '$branch_name' is up to date with the remote."
elif echo "$status" | grep -q "behind"; then
  echo "Your local branch '$branch_name' is behind the remote. A 'git pull' is needed."
elif echo "$status" | grep -q "ahead"; then
  echo "Your local branch '$branch_name' is ahead of the remote. A 'git push' is needed."
else
  echo "Something is not right, or there are uncommitted changes. Run 'git status' manually to investigate."
fi



echo "Finished"
