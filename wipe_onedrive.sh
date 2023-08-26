#!/bin/bash

# This script assumes you've already synced your OneDrive locally
# Remove all local files first
rm -rf ~/OneDrive/*

# Use the OneDrive CLI to remove all files from the OneDrive server
onedrive --synchronize --remove-source-files --force

# Check if deletion was successful
if [ $? -eq 0 ]; then
    notify-send "All files deleted from OneDrive."
else
    notify-send "An error occurred during the deletion process."
    exit 1
fi

