#----------------------------------------

### ZSH CONFIG
export ZSH=$HOME/.zsh
export ZSH_PLUGINS=$ZSH/plugins
export ZSH_THEMES=$ZSH/themes
export HISTFILE=$ZSH/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
# History won't save duplicates
setopt HIST_IGNORE_ALL_DUPS
# History won't save duplicates
setopt HIST_FIND_NO_DUPS

#----------------------------------------
### THEMES
source $ZSH_THEMES/zsh-mythemes/truepassion.zsh-theme

#----------------------------------------
### PLUGINS
fpath=($ZSH_PLUGINS/zsh-completions/src $fpath)

source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh


#----------------------------------------
### SHELL OPTIONS
setopt autocd
zstyle ':completion:*' menu select matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -U compinit && compinit

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

bindkey "^U" backward-kill-line

# bindkey "^[[A" history-beginning-search-backward
# bindkey "^[[B" history-beginning-search-forward

#----------------------------------------
### ALIASES

## General
alias ls='ls -GFC'
alias la='ls -GFlha'
alias l='ls -GFCA'
alias vim='nvim'
alias v='vim'

## Git
alias ga='git add'
alias gp='git push'
alias gpl='git pull'
alias gst='git status'
alias gco='git checkout'
alias gb='git branch'
alias gcmsg='git commit -m'

## GCC
alias gcc='/opt/homebrew/bin/gcc-14'
alias gcc-ar='/opt/homebrew/bin/gcc-ar-14'
alias gcc-nm='/opt/homebrew/bin/gcc-nm-14'
alias gcc-ranlib='/opt/homebrew/bin/gcc-ranlib-14'

## Dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

## Mac Specific
alias icld='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias dpcs='cd ~/Documents/dpcs-code'
alias suban='cd ~/Documents/suban-code'
alias lipika='cd ~/Documents/ai-lipika'
alias cbio='cd ~/Documents/compbio'
alias infoth='cd ~/Documents/infotheory'
alias capstone='cd ~/projects/capstone'
alias prj='cd ~/projects'
alias websec='cd ~/Documents/web-sec'

#----------------------------------------

### PATH
PATH='/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin'

PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
PATH="$(brew --prefix)/opt/python@3.11/libexec/bin:$PATH"

PATH="$PATH:/Applications/kitty.app/Contents/MacOS:$HOME/.cargo/bin"
PATH="$PATH:$HOME/.cargo/env"

PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin"

PATH="$PATH:/usr/local/smlnj/bin"
PATH="$PATH:/Applications/Postgres.app/Contents/Versions/16/bin"

PATH="$PATH:/usr/local/texlive/2024basic/bin/universal-darwin"
PATH="$PATH:$HOME/go/bin"
PATH="$PATH:$HOME/.deno/bin"

export PATH

export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib -L/opt/homebrew/Cellar/fftw/3.3.10_1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include -I/opt/homebrew/Cellar/fftw/3.3.10_1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
export RUSTFLAGS="-L/opt/homebrew/opt/libpq/lib"

#----------------------------------------
## OTHERS
ssh-add ~/.ssh/github
ssh-add ~/.ssh/ashoka-vm
ssh-add ~/.ssh/droplet

export TERM='xterm-256color'

# bun completions
[ -s "/Users/shivoom/.bun/_bun" ] && source "/Users/shivoom/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/shivoom/.docker/completions $fpath)
autoload -Uz compinit
compinit
#
# End of Docker CLI completions
