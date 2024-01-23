# ~/.zshrc
autoload -Uz vcs_info # enable vcs_info
precmd () { vcs_info } # always load before displaying the prompt
zstyle ':vcs_info:*' formats ' %s(%F{red}%b%f)' # git(main)

PS1='%n@%m %F{blue}%~%f %# ' # user@host /path/repo (main) $
RPROMPT=$vcs_info_msg_0_ 
