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


#function for data_input folder
def folder_check():

    try:
        if not os.path.exists("data_input"):
            print("No folder named as 'data_input' exists.\nCreating new folder named 'data_input'.")
            os.mkdir("data_input")
            print("Folder has been created.\nPlease add .txt files in 'data_input' folder.")
        else:
            print("Folder named as 'data_input' already exists.\nPlease add .txt files in 'data_input' folder.")
    
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

#function for handling and reading .txt files
def text_files_reader():

    #declaring input path
    source_folder = os.path.join(os.getcwd(), "data_input")

    files_in_source_folder = []
    
    #checking for .txt files in data_input folder
    for file in os.listdir(source_folder):
        if file.endswith(".txt"):
            files_in_source_folder.append(file)

    #terminate if no .txt files found
    if not files_in_source_folder:
        print("No .txt files were found in 'data_input' folder.\n")
        return None

    #check for data_output folder
    try:
        if not os.path.exists("data_output"):
            os.mkdir("data_output")
    except Exception as e:
        print(f"An error occured while creating 'data_output' folder: {e}")
    result_folder = os.path.join(os.getcwd(), "data_output")

    #empty list to store summary data
    summary_data = []

    print("Starting to read files!\n")
    for file in files_in_source_folder:
        try:
            output_file_path = os.path.join(result_folder, file)
            file_path = os.path.join(source_folder, file)

            line_count = 0
            word_count = 0
            modified_lines = []

            with open(file_path, 'r') as f:
                print("Reading file:", file)

                for line in f:
                    if not line.strip().startswith("#"):
                        line_count += 1
                        word_count += len(line.split())

                    #replacing "temp" with "permanent"
                    modified_line = line.replace("temp", "permanent")
                    modified_lines.append(modified_line)               

            #create modified file and stor in data_output folder
            with open(output_file_path, 'w') as new_file:
                new_file.writelines(modified_lines)
            print(f"Modified file is saved in {os.path.join(os.getcwd(), 'data_output')} as {file}\n")


            #save summary data
            summary_data.append({
                "filename": file,
                "line_count": line_count,
                "word_count": word_count
            })

        except Exception as e:
            print(f"An error occurred while processing file {file}: {e}")
            continue

    return summary_data

#Function to create summary file
def summary(summary_data):
        
    try:
        with open("data_output/summary.txt", 'w') as summary_file:
            summary_file.write("SUMMARY OF FILES\n")
            summary_file.write(f"{'-' * 50}\n")

            #format to save summary data in summary file
            for file in summary_data:
                summary_file.write(f"Filename: {file['filename']}\n")
                summary_file.write(f"Line count (excluding comments): {file['line_count']}\n")
                summary_file.write(f"Word count (excluding comments): {file['word_count']}\n")
                summary_file.write(f"{'-' * 50}\n")

    except Exception as e:
        print(f"An unexcepted error occured while creating summary file: {e}")

#main function to execute the script
def main():
    print("Checking for 'data_input' folder...\n")
    folder_check()

    print("Proceeding to read all .txt files...\n")
    files_to_summarize = text_files_reader()

    if files_to_summarize is not None:
        print("Creating summary file...\n")
        summary(files_to_summarize)
        print(f"Summary file has been created at {os.path.join(os.getcwd(), 'data_output', 'summary.txt')}\n")


if __name__ == "__main__":
    main()