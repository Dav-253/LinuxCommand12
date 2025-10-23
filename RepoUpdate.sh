#!/bin/bash

# Find the root directory of the current Git repository
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)

# Exit if not in a Git repository
if [ -z "$REPO_ROOT" ]; then
    echo "Error: Not a Git repository."
    exit 1
fi

# Change to the repository's root directory
cd "$REPO_ROOT"

echo "Checking for updates in repository: $(basename "$REPO_ROOT")"

# Fetch the latest information from the remote without merging
git fetch origin

# Get the name of the current branch
branch_name=$(git symbolic-ref --short HEAD)

# Get the number of commits the local branch is behind the remote branch
commits_behind=$(git rev-list --count HEAD..origin/"$branch_name" 2>/dev/null)

if [ "$commits_behind" -gt 0 ]; then
    echo "Your local branch '$branch_name' is behind origin/$branch_name by $commits_behind commits."
    echo "Pulling latest changes..."
    git pull origin "$branch_name"
    echo "Pull complete."
else
    echo "Your local branch '$branch_name' is up to date with the remote."
fi
