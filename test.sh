#!/bin/bash

# Backup and Encryption Script

# Define the directory for backup (your home directory)
BACKUP_DIR="/home/cleve/"
# Define the directory for encrypted backup
ENCRYPTED_DIR="/home/cleve/encrypted_backup/"

# Create the encrypted directory if it doesn't exist
mkdir -p $ENCRYPTED_DIR

# Define a hardcoded passphrase for testing purposes
passphrase="YourHardcodedPassphraseHere"

# Perform backup and encryption
# This will create a tarball of your home directory and then encrypt it
tar czvf - $BACKUP_DIR | gpg --batch --yes --passphrase "$passphrase" --cipher-algo AES256 -o $ENCRYPTED_DIR/backup.tar.gz.gpg

# Sync to OneDrive (Optional, Uncomment below line if you wish to sync)
# onedrive --synchronize

echo "Backup and encryption completed."

