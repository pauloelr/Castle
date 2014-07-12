#!/usr/bin/env bash

source "${BASH_IT}/themes/psyco/colors.psyco.bash"
source "${BASH_IT}/themes/psyco/base.psyco.bash"
source "${BASH_IT}/themes/psyco/functions.psyco.bash"

input_style="\[${reset}\]"
ruby_format="\[${reset}${yellow}\]"
user_name="\[${reset}${bold}${red}\]\u"
at_symbol="\[${reset}${bold}${light_gray}\]@"
machine_name="\[${reset}${bold}${orange}\]\h"
location_word="\[${reset}${bold}${light_gray}\] in "
location_path="\[${reset}${bold}${blue}\]\w"
user_privilege="\[${reset}${bold}${white}\]\n\$"

function prompt_command() {
	command_status
	powerline_scm_prompt
    PS1="${ruby_format}$(ruby_version_prompt)${user_name}${at_symbol}${machine_name}${location_word}${location_path}${SCM_PROMPT}${last_command}${user_privilege}${input_style} "
}

PROMPT_COMMAND=prompt_command;
