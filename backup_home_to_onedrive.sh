#!/bin/bash

# Define directories
BACKUP_HOME_DIR=~/backup_home
ENCRYPTED_HOME_DIR=~/encrypted_home_backup

# Create or clear directories
mkdir -p $BACKUP_HOME_DIR $ENCRYPTED_HOME_DIR
rm -rf $BACKUP_HOME_DIR/* $ENCRYPTED_HOME_DIR/*

# Use rsync to copy files to the local backup directory
# Excluding some folders to save space. You can customize this.
rsync -av --exclude '.cache/' --exclude 'Downloads/' --exclude '.local/share/Trash/' ~/ $BACKUP_HOME_DIR

# Encrypt the backup directory
tar czvf - $BACKUP_HOME_DIR | gpg -c --cipher-algo AES256 -o $ENCRYPTED_HOME_DIR/home_backup.tar.gz.gpg

# Sync the encrypted backup directory to OneDrive
onedrive --synchronize --upload-only --local-first --single-directory $ENCRYPTED_HOME_DIR

# Send a notification
notify-send "Home directory backup completed and uploaded to OneDrive."
