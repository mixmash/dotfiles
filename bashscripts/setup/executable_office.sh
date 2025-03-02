#!/bin/sh

sudo apt install -y \
    libreoffice \                                   # Libre Office
    libreoffice-l10n-de \
    libreoffice-help-de \
    synaptic \                                      # Delete files
    dupeguru \                                      # Finde duplicate files
    brasero \                                       # Burn CDs
    gparted                                        # Partition your harddrive ?


flatpak install flathub \
    org.bleachbit.BleachBit \                       # Cleanup files
    org.gimp.gimp \                                 # Image editing
    org.kde.krita \                                 # Image editing
    org.gnome.meld \                                # Find duplicate files
    com.github.qarmin.czkawka \                     # remove unnecessary files
    org.kde.kdenlive \                              # Video editing
    org.gustavoperedo.FontDownloader \              # Download fonts
    de.mediathekview.MediathekView \                # Download Public German TV Stations
    io.freetubeapp.FreeTube \                       # Invidious YouTube client
    org.gnome.baobab \                              # Disk usage analyzer
    me.hyliu.fluentreader \                         # RSS reader
    net.sourceforge.liferea \                       # Rss reader
    com.github.z.Cumulonimbus \                     # Podcast client
    org.telegram.desktop \                          # Telegram Desktop client
    org.signal.Signal \                             # Signal Desktop client
    com.simplenote.Simplenote \                     # Simple note taking app, syncs with phone
    com.github.micahflee.torbrowser-launcher \      # Tor Browser
    org.gnome.gitlab.somas.Apostrophe              # Markdown editor

snap install \
    plumber \                                       # Edit & Download YouTube videos without downloading
    pdftk \                                         # PDF command line tool
    pick-colour-picker                             # Colour picker

    # Caprine - Facebook Messenger client
