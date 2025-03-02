#!/bin/sh
# SOURCE: https://blog.dzarsky.eu/how-to-backup-your-vs-codium-extensions-and-settings

BACKUP_DIR="$HOME/Desktop/codium-backup"
CODIUM_DIR="$HOME/.config/VSCodium/User"

mkdir ${BACKUP_DIR} 
cd ${BACKUP_DIR} && codium --list-extensions | xargs -L 1 echo codium --install-extension > ext.txt
echo "Created extension directory 'codium-backup' on Desktop"

cd $CODIUM_DIR 
tar -czf codium-config.tar.gz *.json
mv codium-config.tar.gz $BACKUP_DIR
echo "Backed up config in the same directory"
