#!/usr/bin/env python3

"""Q2: Check if a Path is a File or Directory Task: Given a path, determine if it is a file or a directory."""


import os

def path_type(path):

    if os.path.isfile(path):
        return "The given path is a file."
    elif os.path.isdir(path):
        return "The given path is a directory."
    else:
        return "The given path is neither a file nor a directory."
    
def main():

    path = path_type(input("Enter path: "))
    print(path)

if __name__ == "__main__":
    main()