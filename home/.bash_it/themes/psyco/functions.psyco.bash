function psyco_scm_prompt {
    scm_prompt_vars
    local git_status_output
    git_status_output=$(git status 2> /dev/null )

    # If There is an SCM
    if [[ "${SCM}" != "${SCM_NONE}" ]]; then
        SCM_PROMPT="${SCM_THEME_PROMPT_PREFIX}"
        if [[ "${SCM_DIRTY}" -eq 1 ]]; then
            if [ -n "$(echo $git_status_output | grep 'Changes not staged')" ]; then
                SCM_PROMPT+="${SCM_THEME_PROMPT_DIRTY_COLOR}"
            elif [ -n "$(echo $git_status_output | grep 'Changes to be committed')" ]; then
                SCM_PROMPT+="${SCM_THEME_PROMPT_STAGED_COLOR}"
            elif [ -n "$(echo $git_status_output | grep 'Untracked files')" ]; then
                SCM_PROMPT+="${SCM_THEME_PROMPT_UNTRACKED_COLOR}"
            else
                SCM_PROMPT+="${SCM_THEME_PROMPT_DIRTY_COLOR}"
            fi
        else
            SCM_PROMPT+="${SCM_THEME_PROMPT_CLEAN_COLOR}"
        fi

        # If SCM is GIT
        if [[ "${SCM}" == "${SCM_GIT}" ]]; then
            local tag=""
            if [[ $SCM_IS_TAG -eq "1" ]]; then
                tag=$SCM_TAG_PREFIX
            fi
            SCM_PROMPT+="${SCM_CHAR}${tag}${SCM_BRANCH}${SCM_STATE}${SCM_GIT_BEHIND}${SCM_GIT_AHEAD}${SCM_GIT_STASH}${SCM_THEME_PROMPT_SUFFIX}"
        fi
    else
        SCM_PROMPT=""
    fi
}

function command_status(){
    exit_code=$?

    if [ $exit_code != 0 ]; then
        last_command="\[${reset}${bold}${red}\]✗ $exit_code "
    else
        last_command="\[${reset}${bold}${green}\]✓ "
    fi
}

function prompt_command() {
    command_status
    psyco_scm_prompt
    PS1="${ruby_format}$(ruby_version_prompt)${user_name}${at_symbol}${machine_name}${location_word}${location_path} ${SCM_PROMPT}${last_command}${user_privilege}${input_style} "
}
