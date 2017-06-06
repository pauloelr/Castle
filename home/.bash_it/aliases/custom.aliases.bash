#!/usr/bin/env bash

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias gitca='git commit --amend --no-edit'
alias gitpm='git push origin HEAD:refs/for/master'
alias gitaa='git add --all'
alias gitpg='git add --all && git commit --amend --no-edit && git push origin HEAD:refs/for/master'
