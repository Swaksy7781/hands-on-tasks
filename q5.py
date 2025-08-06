#!/usr/bin/env python3
"""Q5: Write a Python script that does the following:
Checks if a directory called reports exists in the current working directory.
If it doesn't, create it.
List all .txt files in the current working directory (not subdirectories).
For each .txt file found:
Print the filename.
Move it into the reports directory."""

import os
import shutil

def manage_reports():
    
    try:
        reports_dir = "reports"
        current_dir = os.getcwd()

        if not os.path.exists(reports_dir):
            os.mkdir(reports_dir)
            print(f"Created a new directory: '{os.path.join(current_dir, reports_dir)}'")
        else:
            print(f"Directory '{os.path.join(current_dir, reports_dir)}' already exists.")

        print("\nSearching for .txt files to move...")
        files = os.listdir(current_dir)
        txt_files_found = False

        for file in files:
            if file.endswith('.txt'):
                txt_files_found = True
                source_path = os.path.join(current_dir, file)
                destination_path = os.path.join(current_dir, reports_dir, file)

                print(f"Moving '{file}' to '{reports_dir}'...")
                shutil.move(source_path, destination_path)

        if not txt_files_found:
            print("No .txt files were found in the current directory.")

    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    manage_reports()



