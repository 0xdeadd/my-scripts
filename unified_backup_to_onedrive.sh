#!/bin/bash

# Variables
BACKUP_DIR="/home/cleve/backup_home"
ENCRYPTED_DIR="/home/cleve/encrypted_home_backup"
ONEDRIVE_DIR="/home/cleve/OneDrive"

# Create directories if they don't exist
mkdir -p $BACKUP_DIR
mkdir -p $ENCRYPTED_DIR
mkdir -p $ONEDRIVE_DIR

# Step 1: Backup home directory to $BACKUP_DIR
rsync -a --exclude 'Downloads' --exclude '.cache' --exclude '.flatpak' /home/cleve/ $BACKUP_DIR

# Step 2: Encrypt the backup
tar czvf - $BACKUP_DIR | gpg -c --cipher-algo AES256 -o $ENCRYPTED_DIR/backup.tar.gz.gpg

# Step 3: Move the encrypted backup to OneDrive directory
mv $ENCRYPTED_DIR/backup.tar.gz.gpg $ONEDRIVE_DIR

# Step 4: Synchronize OneDrive
onedrive --synchronize

# Cleanup
rm -rf $BACKUP_DIR/*
rm -rf $ENCRYPTED_DIR/*

echo "Backup completed."

