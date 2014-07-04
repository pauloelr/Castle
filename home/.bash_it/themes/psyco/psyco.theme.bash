#!/usr/bin/env bash

source "${BASH_IT}/themes/psyco/colors.psyco.bash"
source "${BASH_IT}/themes/psyco/base.psyco.bash"
source "${BASH_IT}/themes/psyco/functions.psyco.bash"

ruby_format="\[${reset}${yellow}\]"
user_name="\[${reset}${bold}${blue}\]\u"
at_symbol="\[${reset}${bold}${light_gray}\]@"
machine_name="\[${reset}${bold}${orange}\]\h"
location_word="\[${reset}${bold}${light_gray}\] in "
location_path="\[${reset}${bold}${green}\]\w"
user_privilege="\[${reset}${bold}${white}\]\n\$"
input_style="\[${reset}\]"

function prompt_command() {
	powerline_scm_prompt
    PS1="${ruby_format}$(ruby_version_prompt)${user_name}${at_symbol}${machine_name}${location_word}${location_path}${SCM_PROMPT}${user_privilege}${input_style} "
}

PROMPT_COMMAND=prompt_command;
