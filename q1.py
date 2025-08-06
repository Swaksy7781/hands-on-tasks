#!/usr/bin/env python3
"""Q1: Import and Use os Module 
Task: Write a script to print the current working directory using the os module."""

import os


def get_current_directory():
    
    try:
        # Get the current working directory
        current_directory = os.getcwd()
        print(f"The current working directory is: {current_directory}")
        return current_directory
    except OSError as e:
        # Handle cases where the directory cannot be accessed
        print(f"Error: Could not retrieve current working directory. {e}")
        return None
    except Exception as e:
        # Handle any other unexpected errors
        print(f"An unexpected error occurred: {e}")
        return None

# Call the function to execute the code
if __name__ == "__main__":
    get_current_directory()