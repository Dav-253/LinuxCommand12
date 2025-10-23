#!/usr/bin/env python3

import os
import subprocess

# Define script file paths
DEBIAN_UPDATE_SCRIPT = "./update.sh"
GITHUB_UPDATE_SCRIPT = "./RepoUpdate.sh"
MACHINE_HIJACK_PROGRAM = "./CommandLine.sh"

def clear_screen():
    """Clears the terminal screen."""
    os.system('cls' if os.name == 'nt' else 'clear')

def run_bash_script(script_path):
    """
    Runs an external Bash script safely using subprocess.
    Automatically ensures it has execute permissions.
    """
    print(f"\nAttempting to run script: {script_path}\n")

    try:
        # Check if script exists
        if not os.path.isfile(script_path):
            print(f"❌ Error: The script '{script_path}' was not found.")
            return

        # Give the script execute permissions (chmod +x)
        subprocess.run(["chmod", "+x", script_path], check=True)

        # Run the script using bash explicitly
        subprocess.run(["bash", script_path], check=True)
        print(f"\n✅ Script '{script_path}' executed successfully.\n")

    except subprocess.CalledProcessError as e:
        print(f"❌ Error: The script '{script_path}' failed with exit code {e.returncode}.")
        print("Please check the script for issues.")
    except PermissionError:
        print(f"⚠️ Permission denied while trying to execute '{script_path}'. Try running this program with sudo.")
    except Exception as e:
        print(f"⚠️ Unexpected error: {e}")

def main_menu():
    """Displays the main menu and handles user choices."""
    while True:
        clear_screen()
        print("====== Main Menu ======")
        print("")
        print("==== Genreral Checks ====")
        print("1. Check and update Debian system")
        print("2. Check and pull GitHub repository")
        
        print("")
        print("")
        
        print("==== Programs ====")
        print("3. Machine Hijack")
        
        print("")
        print("")
        print("4. Exit")
        
        print("=======================")

        choice = input("Enter your choice: ")

        if choice == '1':
            run_bash_script(DEBIAN_UPDATE_SCRIPT)
            input("\nPress Enter to return to menu...")
        elif choice == '2':
            run_bash_script(GITHUB_UPDATE_SCRIPT)
            input("\nPress Enter to return to menu...")
        elif choice == '3':
            run_bash_script(MACHINE_HIJACK_PROGRAM)
            input("\nPress Enter to return to menu...")
        elif choice == '4':
            print("Exiting program...")
            break
        else:
            print("Invalid choice. Please enter 1, 2, or 3.")
            input("\nPress Enter to try again...")

if __name__ == "__main__":
    main_menu()
