#!/bin/bash

# Check if the current shell is zsh
if [ "$SHELL" != "/bin/zsh" ]; then
    echo "Current shell is not Zsh."

    # Check if zsh is installed
    if ! command -v zsh &> /dev/null; then
        echo "Zsh is not installed. Installing Zsh..."
        brew install zsh
    fi

    # Set zsh as the default shell
    echo "Setting Zsh as the default shell..."
    chsh -s /bin/zsh
    echo "Please restart your terminal for the changes to take effect."
else
    echo "Current shell is Zsh."
fi

# Check if $ZSH is set
if [ "$ZSH" != "$HOME/.zsh" ]; then
    echo "Setting up Zsh configuration..."

    # Check if .zsh directory exists
    if [ ! -d "$HOME/.zsh" ]; then
        echo "Fatal: The ~/.zsh directory does not exist."
	exit
    fi

    # Set $ZSH
    export ZSH="$HOME/.zsh"
    echo "ZSH is set to $ZSH"
fi

# Symlink the .zshrc file
ln -s $ZSH/.zshrc $HOME/.zshrc

# Change into the zsh directory
cd $ZSH

# Install necessary git submodules (plugins and themes)
echo "Installing plugins and themes..."
git submodule update --init --recursive

echo "Zsh setup completed. Please restart your terminal."

echo "Symlinking vimrc..."
ln -s $HOME/.vim/.vimrc $HOME/.vimrc

cd

echo "Complete."
