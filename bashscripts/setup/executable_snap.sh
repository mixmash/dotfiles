#!/bin/sh
if [ -x "$(command -v snap)" ]; then

  snap install \
      chromium \                    # Browser
      fx \                          # Inspect JSON files
      cups \                        # Printer & Scanner tool
      gimp \                        # Image editing
      krita \                       # Image editing
      postman \                     # API responses
      kubectl --classic \           # Kubernets tool
      # teams-for-linux \             # Microsoft Teams 
else
  echo "snap not found"
fi


