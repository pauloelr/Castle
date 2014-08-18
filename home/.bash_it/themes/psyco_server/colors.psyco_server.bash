#!/usr/bin/env bash
source "${BASH_IT}/themes/psyco/colors.psyco.bash"

red=$(tput -Txterm setaf 1)
magenta=$(tput -Txterm setaf 5)
orange=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
purple=$(tput -Txterm setaf 5)
yellow=$(tput -Txterm setaf 3)
cyan=$(tput -Txterm setaf 6)
white=$(tput -Txterm setaf 7)
black=$(tput -Txterm setaf 0)
light_gray=$(tput -Txterm setaf 7)
dark_gray=$(tput -Txterm setaf 7)
blue=$(tput -Txterm setaf 4)
reset=$(tput -Txterm setaf 7)
bold=''
dim=''
underline=''
reverse=''

SCM_THEME_PROMPT_CLEAN_COLOR=${green}
SCM_THEME_PROMPT_DIRTY_COLOR=${red}
SCM_THEME_PROMPT_STAGED_COLOR=${orange}
SCM_THEME_PROMPT_UNTRACKED_COLOR=${purple}
