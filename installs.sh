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
casks=(kitty battery tiles qlstephen qlmarkdown monitorcontrol hiddenbar finicky appcleaner firefox duckduckgo spotify google-drive)

for cask in "${casks[@]}"
do
    brew install --cask $cask;
done


# install the following formulae and dependencies
formulae=(nmap tldr tree rustup python3 pandoc typst)
for f in "${formulae[@]}"
do
    brew install $f;
done

# install rustup using rustup-init
rustup-init;
