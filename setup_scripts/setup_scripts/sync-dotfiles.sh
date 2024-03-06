#/bin/zsh

# My own themes

git clone https://github.com/shivamkedia17/dotfiles.git ~/dotfiles
ln -f ~/dotfiles/zsh-mythemes/*.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/
zsh omz theme set simpleserver
ln -f ~/dotfiles/vim/.vimrc ~
cp -r ~/dotfiles/vim/.vim ~

