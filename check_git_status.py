#!/usr/bin/env python3
import os
import subprocess

def is_git_repository(path):
    return os.path.isdir(os.path.join(path, '.git'))

def get_git_status(path):
    try:
        output = subprocess.check_output(['git', 'status'], cwd=path, universal_newlines=True)
    except subprocess.CalledProcessError as e:
        return f"Error: {e}"
    return output

if __name__ == "__main__":
    base_directory = "/home/cleve"  # Replace this with the path to your home directory
    for root, dirs, files in os.walk(base_directory):
        if is_git_repository(root):
            print(f"Git Status for {root}:")
            print(get_git_status(root))
            print("=" * 60)
            # Don't descend into any more subdirectories
            del dirs[:]

