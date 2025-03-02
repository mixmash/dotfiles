#!/bin/sh

# SOURCE: https://superuser.com/questions/1513706/list-only-packages-specifically-installed-by-the-user-with-apt-or-other-pkg-man


apt-mark showmanual

# comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)




aptitude search '~i !~M' -F '%p' --disable-columns | sort -u > currentlyinstalled.txt
wget -qO - http://mirror.pnl.gov/releases/precise/ubuntu-12.04.3-desktop-amd64.manifest \
  | cut -f1 | sort -u > defaultinstalled.txt
comm -23 currentlyinstalled.txt defaultinstalled.txt

