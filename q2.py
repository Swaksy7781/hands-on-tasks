#!/usr/bin/env python3

"""Q2: Check if a Path is a File or Directory
Task: Given a path, determine if it is a file or a directory."""

import os


def path_type(path):

    try:
        if os.path.isfile(path):
            return f"'{path}' is a file."
        elif os.path.isdir(path):
            return f"'{path}' is a directory."
        else:
            return f"'{path}' is neither a file nor a directory."
    
    except Exception as e:
        # Catch any other unexpected errors during path checking
        return f"An unexpected error occurred while checking path '{path}': {e}"

def main():
    try:
        user_input_path = input("Enter path: ")
        print(path_type(user_input_path))

    except Exception as e:
        # Catch any other unexpected errors during main execution
        print(f"An unexpected error occurred in main: {e}")

if __name__ == "__main__":
    main()
