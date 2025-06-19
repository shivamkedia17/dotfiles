# check if homebrew is installed or not
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating Homebrew"
    brew update
fi


# install the followings casks (apps)
casks=(battery tiles qlmarkdown syntax-highlight monitorcontrol hiddenbar finicky appcleaner font-sf-mono font-sf-pro font-iosevka font-computer-modern kitty firefox chromium spotify zed obsidian temurin google-drive docker zoom wireshark iina)

for cask in "${casks[@]}"
do
    brew install --cask $cask;
done


# install the following formulae and dependencies
formulae=(nmap tldr tree nvim gcc gdb rustup golang python3 typst) 
for f in "${formulae[@]}"
do
    brew install $f;
done

# install rustup using rustup-init
rustup-init;

# install bun
brew install oven-sh/bun/bun;

