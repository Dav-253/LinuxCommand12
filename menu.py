#!/usr/bin/env python3

import os
import subprocess

def clear_screen():
    """Clears the terminal screen."""
    # os.system is fine for simple terminal commands
    os.system('cls' if os.name == 'nt' else 'clear')

def check_debian_updates():
    """Calls the bash script to check and perform Debian updates."""
    print("Checking for Debian system updates...")
    subprocess.run(["./update.sh"])

def check_and_pull_github_repo():
    """Calls the bash script to update the GitHub repository."""
    print("Checking for GitHub repository updates...")
    subprocess.run(["./check-and-pull-github.sh"])

def main_menu():
    """Displays the main menu and handles user input."""
    while True:
        clear_screen()
        print("====== Main Menu ======")
        print("1. Check for Debian updates")
        print("2. Update GitHub repository")
        print("3. Exit")
        print("=======================")

        choice = input("Enter your choice: ")

        if choice == '1':
            check_debian_updates()
            input("Press Enter to continue...")
        elif choice == '2':
            check_and_pull_github_repo()
            input("Press Enter to continue...")
        elif choice == '3':
            print("Exiting...")
            break
        else:
            print("Invalid choice. Please enter a number from 1 to 3.")
            input("Press Enter to continue...")

if __name__ == "__main__":
    main_menu()

