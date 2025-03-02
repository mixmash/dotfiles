#!/bin/sh

SNAP_DIR="$HOME/snap/firefox/common/.mozilla/firefox/ "
LOCAL_SNAP_DIR="$HOME/snap/firefox/common/.cache/mozilla/firefox/"
BACKUP_DIR="$HOME/Desktop/firefox-backup"

mkdir $BACKUP_DIR
cp -r $SNAP_DIR "$BACKUP_DIR/root-directory" 
echo "Root directory was copied"

cp -r $LOCAL_SNAP_DIR "$BACKUP_DIR/local-directory"
echo "Local directory was copied"
