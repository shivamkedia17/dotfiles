#!/bin/bash

sudo bash ./installs.sh 
sudo zsh ./sync-dotfiles.sh
sudo zsh ./dockerinstall.sh
sudo zsh ./wireguard-install.sh
