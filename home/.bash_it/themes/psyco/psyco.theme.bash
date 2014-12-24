#!/usr/bin/env bash
source "${BASH_IT}/themes/psyco/colors.psyco.bash"
source "${BASH_IT}/themes/psyco/base.psyco.bash"
source "${BASH_IT}/themes/psyco/style.psyco.bash"
source "${BASH_IT}/themes/psyco/functions.psyco.bash"

if [[ $- == *i* ]]; then
	PROMPT_COMMAND=prompt_command;
fi
