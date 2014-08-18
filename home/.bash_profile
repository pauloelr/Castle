#!/usr/bin/env bash

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin

# Add composer bin directory
export PATH=$PATH:~/.composer/vendor/bin

if [ -d ~/.bin ]; then
	export PATH=$PATH:~/.bin
fi

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='psyco'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='https://github.com/pauloelr'

# Set my editor and git editor
export EDITOR="/opt/sublime_text_2/sublime_text"
export GIT_EDITOR='/usr/bin/gedit'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
