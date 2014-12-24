#!/usr/bin/env bash
source "${BASH_IT}/themes/psyco/base.psyco.bash"

SCM_THEME_PROMPT_CLEAN_COLOR="\[${reset}${bold}${green}\]"
SCM_THEME_PROMPT_DIRTY_COLOR="\[${reset}${bold}${red}\]"
SCM_THEME_PROMPT_STAGED_COLOR="\[${reset}${bold}${orange}\]"
SCM_THEME_PROMPT_UNTRACKED_COLOR="\[${reset}${bold}${purple}\]"

SCM_GIT='git'
SCM_GIT_CHAR="G "

SCM_HG='hg'
SCM_HG_CHAR='M '

SCM_SVN='svn'
SCM_SVN_CHAR='S '

SCM_NONE='NONE'
SCM_NONE_CHAR=''

SCM_GIT_BEHIND_CHAR="-"
SCM_GIT_AHEAD_CHAR="+"
