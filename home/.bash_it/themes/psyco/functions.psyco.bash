function powerline_scm_prompt {
    scm_prompt_vars
    local git_status_output
    git_status_output=$(git status 2> /dev/null )

    if [[ "${SCM_NONE_CHAR}" != "${SCM_CHAR}" ]]; then
        if [[ "${SCM_DIRTY}" -eq 1 ]]; then
            if [ -n "$(echo $git_status_output | grep 'Changes not staged')" ]; then
                SCM_PROMPT="${SCM_THEME_PROMPT_PREFIX}${SCM_THEME_PROMPT_DIRTY_COLOR}"
            elif [ -n "$(echo $git_status_output | grep 'Changes to be committed')" ]; then
                SCM_PROMPT="${SCM_THEME_PROMPT_PREFIX}${SCM_THEME_PROMPT_STAGED_COLOR}"
            elif [ -n "$(echo $git_status_output | grep 'Untracked files')" ]; then
                SCM_PROMPT="${SCM_THEME_PROMPT_PREFIX}${SCM_THEME_PROMPT_UNTRACKED_COLOR}"
            else
                SCM_PROMPT="${SCM_THEME_PROMPT_PREFIX}${SCM_THEME_PROMPT_DIRTY_COLOR}"
            fi
        else
            SCM_PROMPT="${SCM_THEME_PROMPT_PREFIX}${SCM_THEME_PROMPT_CLEAN_COLOR}"
        fi
        if [[ "${SCM_GIT_CHAR}" == "${SCM_CHAR}" ]]; then
            local tag=""
            if [[ $SCM_IS_TAG -eq "1" ]]; then
                tag=$SCM_TAG_PREFIX
            fi
            SCM_PROMPT+=" ${SCM_CHAR}${tag}${SCM_BRANCH}${SCM_STATE}${SCM_GIT_BEHIND}${SCM_GIT_AHEAD}${SCM_GIT_STASH} ${SCM_THEME_PROMPT_SUFFIX}"
        fi
        SCM_PROMPT=" ${SCM_PROMPT} "
        LAST_THEME_COLOR=${SCM_THEME_PROMPT_COLOR}
    else
        SCM_PROMPT=""
    fi
}