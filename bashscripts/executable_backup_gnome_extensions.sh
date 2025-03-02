#!/bin/sh

# SOURCE: https://www.ubuntubuzz.com/2018/08/backup-and-restore-gnome-shell-extensions.html
cp -r $HOME/.local/share/gnome-shell/extensions/ $HOME/Desktop/gnome-extensions
echo "Gnome Extensions backed up in directory 'gnome-extensions' on your Desktop"

# SOURCE: https://www.linuxquestions.org/questions/linux-newbie-8/backup-gnome-extensions-data-4175657380/
# Backup
# dconf dump /org/gnome/shell/extensions/ > extensions.conf` 

# Restore
# dconf load /org/gnome/shell/extensions/ < extensions.conf
#
#
# SOURCE: https://ostechnix.com/backup-and-restore-linux-desktop-system-settings-with-dconf/
# BACKUP WHOLE SYSTEM
# dconf dump / > backup-desktop
# 
# Restore
#  dconf load / < backup-desktop
#
# Backup And Restore GNOME-specific Settings Only
# dconf dump /org/gnome/ > my_gnome_settings
# Restore
# dconf load /org/gnome/ < my_gnome_settings
