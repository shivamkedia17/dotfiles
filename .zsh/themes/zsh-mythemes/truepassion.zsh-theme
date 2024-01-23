autoload -Uz vcs_info
autoload -U colors && colors
precmd() {
    vcs_info
}

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats "%{$fg[cyan]%}%s(%{$fg[red]%}%b%{$fg[cyan]%}) "

# directory
function directory() {
    # REF: https://stackoverflow.com/questions/25944006/bash-current-working-directory-with-replacing-path-to-home-folder

    local color="%{$fg_bold[blue]%}";
    local directory="${PWD/#$HOME/~}";
    local color_reset="%{$reset_color%}";

    echo "${color}${directory}${color_reset}";
}


# Define a function to set the Git information
function git_prompt_info {
    vcs_info
    if [[ -n $vcs_info_msg_0_ ]]; then
        echo "$vcs_info_msg_0_"
    fi
}

# git
# /* ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "; */

function update_git_status() {
    GIT_STATUS=$(git_prompt_info);
}

function git_status() {
    echo "${GIT_STATUS}"
}


# command
function update_command_status() {
    local arrow="";
    local color_reset="%{$reset_color%}";
    local reset_font="%{$fg_no_bold[white]%}";
    COMMAND_RESULT=$1;
    export COMMAND_RESULT=$COMMAND_RESULT
    if $COMMAND_RESULT;
    then
        arrow="%{$fg_bold[red]%}❱%{$fg_bold[yellow]%}❱%{$fg_bold[green]%}❱";
    else
        arrow="%{$fg_bold[red]%}❱❱❱";
    fi
    COMMAND_STATUS="${arrow}${reset_font}${color_reset}";
}
update_command_status true;

function command_status() {
    echo "${COMMAND_STATUS}"
}

# REF: http://zsh.sourceforge.net/Doc/Release/Functions.html
precmd() {
    # last_cmd
    local last_cmd_return_code=$?;
    # local last_cmd_result=true;
    if [ "$last_cmd_return_code" = "0" ];
    then
        local last_cmd_result=true;
    else
        local last_cmd_result=false;
    fi

    # update_git_status
    update_git_status;

    # update_command_status
    update_command_status $last_cmd_result;
}


# set option
setopt PROMPT_SUBST;

# prompt
PROMPT='$(directory) $(git_status)$(command_status) %# ';
