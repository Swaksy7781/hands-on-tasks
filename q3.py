#!/usr/bin/env python3

"""#Q3: Create a Directory (if not exists) Task: 
Write a script that creates a new folder called test_folder in the current working directory if it doesn't already exist."""

import os

def new_directory():
    print(f"Current working directory is: {os.getcwd()}")

    try:
        if (not os.path.exists("test_folder")):
            os.mkdir("test_folder")
            print(f"New directory named as 'test_folder' is created at {os.getcwd()}")
        else:
            print("directory already exists")

    except Exception as e:
        # Handle any other unexpected errors
        print(f"An unexpected error occurred: {e}")

def main():
    new_directory()

if __name__ == "__main__":
    main()

