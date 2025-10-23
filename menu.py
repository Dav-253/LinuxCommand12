#!/usr/bin/env python3

import os
import subprocess

# Define the names of your Bash script files
DEBIAN_UPDATE_SCRIPT = "./update.sh"
GITHUB_UPDATE_SCRIPT = "./RepoUpdate.sh"

def clear_screen():
    """Clears the terminal screen."""
    os.system('cls' if os.name == 'nt' else 'clear')

def run_bash_script(script_path):
    """
    Runs an external Bash script.
    The script must have execute permissions (chmod +x).
    """
    print(f"Attempting to run script: {script_path}")
    try:
        # Use subprocess.run to execute the external script
        # check=True will raise an exception if the script fails
        subprocess.run(script_path, check=True)
    except FileNotFoundError:
        print(f"Error: The script '{script_path}' was not found. Please check the file path.")
    except subprocess.CalledProcessError as e:
        print(f"Error: The script '{script_path}' failed with exit code {e.returncode}.")
        print("Please check the script for errors.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

def main_menu():
    """Displays the main menu and handles user input."""
    while True:
        clear_screen()
        print("====== Main Menu ======")
        print("1. Check and update Debian system")
        print("2. Check and pull GitHub repository")
        print("3. Exit")
        print("=======================")

        choice = input("Enter your choice: ")

        if choice == '1':
            run_bash_script(DEBIAN_UPDATE_SCRIPT)
            input("\nPress Enter to continue...")
        elif choice == '2':
            run_bash_script(GITHUB_UPDATE_SCRIPT)
            input("\nPress Enter to continue...")
        elif choice == '3':
            print("Exiting...")
            break
        else:
            print("Invalid choice. Please enter a number from 1 to 3.")
            input("\nPress Enter to continue...")

if __name__ == "__main__":
    main_menu()
