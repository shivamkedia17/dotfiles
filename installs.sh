#! /usr/bin/sh

# check if homebrew is installed or not
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating Homebrew"
    brew update
fi


# install the followings casks (apps)
casks=(kitty battery tiles qlmarkdown monitorcontrol hiddenbar finicky appcleaner firefox duckduckgo spotify google-drive)

for cask in "${casks[@]}"
do
    brew install --cask $cask;
done


# install the following formulae and dependencies
formulae=(tldr rust rust-analyzer python3 pandoc typst)
for f in "${formulae[@]}"
do
    brew install $f;
done
