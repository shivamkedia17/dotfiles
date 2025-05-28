#!/bin/bash

sudo ./setup-dotfiles.sh
sudo ./setup-shell.sh
sudo zsh ./setup-installs.sh

# Setup Fonts

cp fonts/ProductSans-Regular.ttf /Library/Fonts
