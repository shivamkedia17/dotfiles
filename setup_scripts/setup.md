# How to setup a new mac from scratch

## 1. Dock and System Settings
	a. Increase pointer speed !!
	b. remove stupid apps from dock !!
	c. show battery %
	d. use cmd to move around items in menu bar
	e. dock settings: use scale effect
	f. minimise app into icon
	g. Hot Corners: Top Right: Desktop, Top Left: Mission Control, 
	h. Shortcuts: Mouse Shortcuts: ^+Secondary Click -> Mission Control

## 2. basic utilities literally
	a. Alfred: (use a crack)
	b. karabiner: `https://karabiner-elements.pqrs.org`
		1. remap esc to caps lock and vice versa
	c. Homebrew

## 3. Safari settings
	a. search engine: duckduckgo
	b. homepage settings
	c. compact tabs
	d. privacy
	e. Extensions:
		i. adblock plus
		ii. accelerate
		iii. focus for youtube
		iv. bitwarden

## 4. Extra Utilities
	a. Monitor Control  `brew install --cask MonitorControl`
	b. Hidden Bar  `brew install --cask `
	c. AppCleaner (better way to uninstall) `brew install --cask AppCleaner`
	d. QLMarkdown: `brew install --cask qlmarkdown`
	e. Battery (battery utility): `brew install battery`
	f. Amphetamine (from the app store)
	g. Finicky (Default Browser for different things): `brew install finicky`
	h. Tiles.app

## 5. Apps
	a. kitty (terminal)
	b. ms office apps
	c. google drive plugin for mac
	d. firefox
	e. vscode
	f. Bitwarden (password manager)
	g. CollaNote

## 6. Fonts:
	- Nerd Fonts (Droid Sans)
	- Computer Modern (Latex Font)
	- Product Sans (Google's Font)
	```bash
	```	
## 7. Programming Languages
	- Python
	- Rust

## 7. What else?

- Finder Settings: show downloads on new window, edit sidebar
	- show status bar
	- set default file view settings: icon size, group by name, sort by name, snap to grid

## Dotfiles:
- While backing up ensure you have all your dotfiles in the git bare repo
- Use the dotfiles-setups.sh script to reinstall everything into place
- List of dotfiles:
    - Alfred
    - Vim
    - Zsh
    - Karabiner
    - Kitty
    - finicky


## VSCode Settings:
- Login in with GitHub (hopefully everything is synced)
- Install only useful extensions
    + Dobri Next (Theme)
    + Rust Analyzer
    + Typst
- Cmd+Shift+P: Add shell command `code` to `PATH`


