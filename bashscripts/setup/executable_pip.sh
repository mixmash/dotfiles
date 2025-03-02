#!/bin/sh
if [ -x "$(command -v pip3)" ]; then
    
    pip3 install \
        mitzasql \                  # SQL terminal tool
        asciinema \                 # ASCII videos from command line
        jupyterlab \                # Jupyter Lab
        notebook \                  # Jupyter notebook
        pandas \                    # Dataframe library
        numpy \                     # Numerical computing
        scipy \                     # Scientific computing
else
  echo "pip3 not found"
fi


