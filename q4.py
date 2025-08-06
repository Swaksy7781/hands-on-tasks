#!/usr/bin/env python3

"""Q4: Loop Through Files and Filter by Extension Task: List only .txt files in the current directory."""

import os

def list_txt_files():

    try:
        current_directory = os.getcwd()
        print(f"Current Directory: {current_directory}")

        files = os.listdir(current_directory)
        txt_files = []
        for file in files:
            if file.endswith('.txt'):
                txt_files.append(file)

        if txt_files:
            print("Text files in the current directory:")
            for txt_file in txt_files:
                print(txt_file)
        else:
            print("No .txt files found in the current directory.")

    except Exception as e:
        print(f"An unexpected error occurred: {e}")

def main():
    list_txt_files()

if __name__ == "__main__":
    main()