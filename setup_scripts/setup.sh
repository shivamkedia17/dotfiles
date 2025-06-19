#!/bin/bash

./setup-dotfiles.sh
sudo ./setup-shell.sh
zsh ./setup-installs.sh

# Setup Fonts

cp fonts/ProductSans-Regular.ttf /Library/Fonts
