#!/usr/bin/env python3

"""Task: Build a Python script that:
1. Checks if a folder named data_input exists in the current directory. If not, create it and inform the user to add .txt files to it.
2. Reads all .txt files from the data_input folder.
3. For each .txt file:
    a) Count the number of lines and number of words
    b) Ignore lines that start with # (comments)
    c) Replace all instances of the word "temp" with "permanent"
    d) Save the modified version into a new folder called data_output with the same filename.

4. At the end, create a summary file called summary.txt inside data_output, showing:
    a) Filename
    b) Line count (excluding comment lines)
    c) Word count (excluding comment lines)"""

import os

def folder_check():

    try:
        if not os.path.exists("data_input"):
            print("No fodler named as 'data_input' exists.\nCreating new folder named 'data_input'.")
            os.mkdir("data_input")
            print("Folder has been creaed.\nPlease add .txt files in 'data_input' folder.")
        else:
            print("Folder named as 'data_input' already exisssts.\nPlease add .txt files in 'data_input' folder.")
    
    except Exception as e:
        print(f"An unexpected error occurred: {e}")


def text_files_reader():

    source_folder = os.path.join(os.getcwd(), "data_input")

    if not os.path.exists("data_output"):
        os.mkdir("data_output")

    result_folder = os.path.join(os.getcwd(), "data_output")

    summary_data = []

    for file in os.listdir(source_folder):

        output_file_path = os.path.join(result_folder, file)

        if file.endswith(".txt"):
            file_path = os.path.join(source_folder, file)
            with open(file_path, 'r') as f:
                print("Reading file: ", file)
                lines = f.readlines()

                line_count = 0
                word_count = 0
                modified_lines = []

                for line in lines:
                    if not line.strip().startswith("#"):
                        line_count += 1

                        word_count += len(line.split())

                        modified_line = line.replace("temp", "permanent")
                        modified_lines.append(modified_line)

            with open(output_file_path, 'w') as new_file:
                new_file.writelines(modified_lines)
                print(f"Modified file is saved as: {output_file_path}")

            summary_data.append({
                "filename": file,
                "line_count": line_count,
                "word_count": word_count
            })
    return summary_data

def summary(summary_data):
        
    try:
        with open("data_output/summary.txt", 'w') as summary_file:
            summary_file.write("Summary of files\n")

            for file in summary_data:
                summary_file.write(f"Filename: {file['filename']}\n")
                summary_file.write(f"Line count (excluding comments): {file['line_count']}\n")
                summary_file.write(f"Word count (excluding comments): {file['word_count']}\n")
    except Exception as e:
        print(f"An unexcepted error occured while creating summary file: {e}")

def main():
    print("Checking for 'data_input' folder...\n")
    folder_check()

    print("Proceeding to read all .txt files...\n")
    files_to_summarize = text_files_reader()

    if files_to_summarize is not None:
        print("Creating summary file...\n")
        summary(files_to_summarize)

if __name__ == "__main__":
    main()