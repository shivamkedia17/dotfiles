# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="truepassion"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git themes z vscode history-substring-search zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch arm64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# -----------------------
# Setup a way to manage dotfiles easily w a git bare repo called dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
# -----------------------

# export TERM=xterm-256color

# Environment variables to 
DRIP=178.128.93.169
DROPLET_ROOT=root@$DRIP
DROPLET=chicken@$DRIP

RINTUPC=chs.rintu@10.1.21.72
AC02LAB1=chs.rintu@10.1.22.164

# Add ssh-keys for servers
ssh-add ~/.ssh/droplet
ssh-add ~/.ssh/github

# alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
# alias ls='ls -C'
# alias python='/opt/homebrew/bin/python3'
alias brew='arch -arm64 /opt/homebrew/bin/brew'
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias chicken="ssh $DROPLET -p 2222"
alias rchicken="ssh $DROPLET_ROOT -p 2222"
alias lchicken="ssh $UBSERV -p 999" # ssh into local ubuntu-server
QEMU='/opt/homebrew/Cellar/qemu/7.2.0/bin'

export PYTHON='/usr/local/bin/python2'
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="$PATH:$HOME/Library/Python/3.11/bin"
export PATH="$PATH:/opt/homebrew/lib/python3.11"

# sem 5
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/15/bin"
alias pgres="psql -p5432 postgres"
alias icld="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"
alias dbms="icld; cd Sem\ 5/DBMS"
alias pldi="icld; cd Sem\ 5/PLDI"
alias rusti="icld; cd Sem\ 5/rust_ism"
alias networks="icld; cd Sem\ 5/Networks"
alias alg="icld; cd Sem\ 5/Algebra\ 1"
alias iml="icld; cd Sem\ 5/Machine\ Learning"

# use homebrew's gcc
alias gcc='gcc-13'
alias g++='g++-13'

# env for flex and bison
export PATH="/opt/homebrew/opt/flex/bin:$PATH"
export PATH="/opt/homebrew/opt/bison/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/flex/lib -L/opt/homebrew/opt/bison/lib"
export CFLAGS="-I/opt/homebrew/opt/flex/include"
export CPPFLAGS="-I/opt/homebrew/opt/flex/include"

alias ncpt='open -n -a /Applications/Cisco\ Packet\ Tracer\ 8.2.1/Cisco\ Packet\ Tracer\ 8.2.1.app/'
