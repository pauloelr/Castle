#!/bin/bash

source ~/.bash_it/bash_it.sh

# Aliases
bash-it enable alias general
bash-it enable alias git
bash-it enable alias vagrant
bash-it enable alias vim

# Completions
bash-it enable completion bash-it
bash-it enable completion defaults
bash-it enable completion git
bash-it enable completion git_flow
bash-it enable completion homesick
bash-it enable completion ssh

# Plugins
bash-it enable plugin base
bash-it enable plugin battery
bash-it enable plugin browser
bash-it enable plugin dirs
bash-it enable plugin extract
bash-it enable plugin git
bash-it enable plugin javascript
bash-it enable plugin ssh
bash-it enable plugin vagrant
bash-it enable plugin docker
