#!/bin/sh

# List enabled extensions
extensions=$(gnome-extensions list --enabled)
echo $extensions
echo $extensions > gnome-shell-extensions-enabled-list.txt

echo "\n"
# List all extensions
extensions=$(gnome-extensions list)
echo $extensions
echo $extensions > gnome-shell-extensions-all-list.txt
