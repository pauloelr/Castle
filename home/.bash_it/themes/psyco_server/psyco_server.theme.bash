#!/usr/bin/env bash
source "${BASH_IT}/themes/psyco_server/colors.psyco_server.bash"
source "${BASH_IT}/themes/psyco_server/base.psyco_server.bash"
source "${BASH_IT}/themes/psyco/style.psyco.bash"
source "${BASH_IT}/themes/psyco/functions.psyco.bash"

if [[ -t "$fd" || -p /dev/stdin ]]; then
	PROMPT_COMMAND=prompt_command;
fi
