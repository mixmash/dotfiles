#!/bin/sh

# SOURCE: https://askubuntu.com/questions/1261242/how-to-list-installed-packages-using-snap

snap list | grep -v Publisher | grep -v canonical | awk '{print $1}'
