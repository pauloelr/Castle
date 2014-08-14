#!/bin/bash
echo '[Install] Instaling BashIt'
git clone https://github.com/revans/bash-it.git ~/.bash_it

echo '[Install] Reloading Bash'
source ~/.bashrc

echo '[Install] Cloning Castle'
homesick clone pauloelr/Castle
homesick symlink Castle
source ~/.bashrc

echo '[Install] Change Theme'
sed -i "s/export BASH_IT_THEME=.*/export BASH_IT_THEME='psyco_server'/" ~/.homesick/repos/Castle/home/.bash_profile

echo '[Install] Enable BashIt'
source ~/.enable_bashit.sh

echo '[Install] Installation Finish'
