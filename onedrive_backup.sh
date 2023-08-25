#!/bin/bash

# Define directories
BACKUP_DIR=~/backup_home
ENCRYPTED_DIR=~/encrypted_home_backup

# Create or clear directories
mkdir -p $BACKUP_DIR $ENCRYPTED_DIR
rm -rf $BACKUP_DIR/* $ENCRYPTED_DIR/*

# Use rsync to copy files to the local backup directory, excluding specific directories
rsync -av --exclude '.cache/' --exclude '.local/share/Trash/' --exclude '.flatpak/' ~/ $BACKUP_DIR/

# Encrypt the backup directory
tar czvf - $BACKUP_DIR | gpg -c --cipher-algo AES256 -o $ENCRYPTED_DIR/backup.tar.gz.gpg

# Sync the encrypted backup directory to OneDrive
onedrive --synchronize --upload-only --local-first --single-directory $ENCRYPTED_DIR

# Notify the user
if [ $? -eq 0 ]; then
    notify-send "Backup and upload to OneDrive completed."
else
    notify-send "An error occurred during the backup or upload to OneDrive."
fi

