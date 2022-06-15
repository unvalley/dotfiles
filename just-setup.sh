#!/bin/bash
mkdir -p ~/.local/bin
# https://github.com/casey/just#pre-built-binaries
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/.local/bin/

echo export PATH="$PATH:$HOME/bin" | sudo tee -a ~/.zshrc ~/.bashrc
just --help