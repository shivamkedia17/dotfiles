#!/bin/bash

# set locale
sh ./setlocale.sh
sudo timedatectl set-timezone Asia/Kolkata

# update all apps
sudo apt update
# Install tldr pages, tree
sudo apt install tldr tree gcc gdb

# Install zsh
sudo apt install zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change shell to zsh
echo "To change your shell to zsh, run:"
echo 'chsh -s /bin/zsh'

# Install zsh custom plugins
# Zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# add plugins to .zshrc
echo "add plugins to .zshrc,"
vim ~/.zshrc -c "/plugins=" && source ~/.zshrc


