#!/bin/sh
if [ -x "$(command -v apt)" ]; then
  sudo apt update
  # git
  sudo apt install -y \
    git \                           # git
    tree \                          # File tree structure
    zip \                           # Compress files
    unzip \                         # Decompress files
    jq \                            # JSON processing
    ranger \                        # Terminal file manager
    shellcheck \                    # Bash checker 
    imagemagick \                   
    grep \                          # Grep Terminal
    gnome-tweaks \                  # Tweak Gnome Desktop environment
    alacritty \                     # Terminal emulator
    kubectx \                       # Kubernetes tool
    scalpel \                       # Recovery tool
    fzf \                           # Fuzzy finder
    yamllint \                      # Terminal linter for yaml-fies
    silversearcher-ag \             # Silver searcher - search content of files
    ripgrep \                       # Faster grep 
    tldr \                          # Better man pages
    golang-go                       # Go programming language

  apt install -y zsh
  # chsh -s /bin/zsh                # Change default shell to zsh

  apt install -y xclip \            # System clipboard, Ctr+c
  apt install -y python3            # Python programming language
  apt install -y python3-pip        # Python package manager

  # Install snap store
  apt install -y snapd
  sudo snap install core

  # Install flatpak
  apt install flatpak
  # tmux \                        # Terminal multiplexer

  # Github CLI 
  type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo apt install gh -y

  # Lazygit 
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
  lazygit --version
    
  # Ambient Sounds
  flatpak install flathub com.rafaelmardojai.Blanket
  # Gnome touchpad gestures
  flatpak install flathub com.github.joseexposito.touche

  # k9s terminal tool for kubernetes clusters
  curl -sS https://webinstall.dev/k9s | bash


  # AppImage Launcher
  sudo add-apt-repository ppa:appimagelauncher-team/stable
  sudo apt-get update                  
  sudo apt-get install appimagelauncher

else
  echo "apt not found"
fi

