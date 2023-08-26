#!/bin/bash

# Define the path to the backup file
BACKUP_FILE="/home/cleve/OneDrive/backup.tar.gz.gpg"

# Define the path to the temporary chunk directory
CHUNK_DIR="/tmp/"

# Split the backup file into chunks of 1GB each
split -b 1G "$BACKUP_FILE" "$CHUNK_DIR/backup_chunk"

# Upload each chunk to OneDrive
for chunk_file in "$CHUNK_DIR/backup_chunk"*
do
    onedrive --upload "$chunk_file"
done

# Clean up temporary chunk files
rm "$CHUNK_DIR/backup_chunk"*

echo "Backup chunks uploaded to OneDrive successfully."

