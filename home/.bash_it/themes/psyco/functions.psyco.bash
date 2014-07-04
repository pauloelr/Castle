function set_rgb_color {
    if [[ "${1}" != "-" ]]; then
        fg="38;5;${1}"
    fi
    if [[ "${2}" != "-" ]]; then
        bg="48;5;${2}"
        [[ -n "${fg}" ]] && bg=";${bg}"
    fi
    echo -e "\[\033[${fg}${bg}m\]"
}

function powerline_scm_prompt {
    scm_prompt_vars
    local git_status_output
    git_status_output=$(git status 2> /dev/null )

    if [[ "${SCM_NONE_CHAR}" != "${SCM_CHAR}" ]]; then
        if [[ "${SCM_DIRTY}" -eq 1 ]]; then
            if [ -n "$(echo $git_status_output | grep 'Changes not staged')" ]; then
                SCM_PROMPT="${SCM_THEME_PROMPT_PREFIX}$(set_rgb_color ${SCM_THEME_PROMPT_DIRTY_COLOR} ${SCM_THEME_PROMPT_COLOR})"
            elif [ -n "$(echo $git_status_output | grep 'Changes to be committed')" ]; then
                SCM_PROMPT="${SCM_THEME_PROMPT_PREFIX}$(set_rgb_color ${SCM_THEME_PROMPT_STAGED_COLOR} ${SCM_THEME_PROMPT_COLOR})"
            elif [ -n "$(echo $git_status_output | grep 'Untracked files')" ]; then
                SCM_PROMPT="${SCM_THEME_PROMPT_PREFIX}$(set_rgb_color ${SCM_THEME_PROMPT_UNTRACKED_COLOR} ${SCM_THEME_PROMPT_COLOR})"
            else
                SCM_PROMPT="$(set_rgb_color ${SCM_THEME_PROMPT_DIRTY_COLOR} ${SCM_THEME_PROMPT_COLOR})${SCM_THEME_PROMPT_PREFIX}"
            fi
        else
            SCM_PROMPT="$(set_rgb_color ${SCM_THEME_PROMPT_CLEAN_COLOR} ${SCM_THEME_PROMPT_COLOR})${SCM_THEME_PROMPT_PREFIX}"
        fi
        if [[ "${SCM_GIT_CHAR}" == "${SCM_CHAR}" ]]; then
            local tag=""
            if [[ $SCM_IS_TAG -eq "1" ]]; then
                tag=$SCM_TAG_PREFIX
            fi
            SCM_PROMPT+=" ${SCM_CHAR}${tag}${SCM_BRANCH}${SCM_STATE}${SCM_GIT_BEHIND}${SCM_GIT_AHEAD}${SCM_GIT_STASH} ${SCM_THEME_PROMPT_SUFFIX}"
        fi
        SCM_PROMPT="$(set_rgb_color ${LAST_THEME_COLOR} ${SCM_THEME_PROMPT_COLOR})${THEME_PROMPT_SEPARATOR}${normal} ${SCM_PROMPT} ${normal}"
        LAST_THEME_COLOR=${SCM_THEME_PROMPT_COLOR}
    else
        SCM_PROMPT=""
    fi
}