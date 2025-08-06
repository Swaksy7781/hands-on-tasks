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