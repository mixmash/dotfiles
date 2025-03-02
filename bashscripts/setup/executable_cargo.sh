#!/bin/sh

if [ -x "$(command -v cargo)" ]; then

  # Install Rust
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source $HOME/.cargo/env
  rustc --version
  apt install -y build-essential
  rustup update
  # Alternative via apt
  # sudo apt install rustc
  # rustc -V 

  cargo install \
     agg \
     fd \
     gobang \
     tree-sitter-cli \
     ruplacer \
     topgrade # \

else
  echo "cargo not found"
fi

