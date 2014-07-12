#!/bin/bash
cd ~ 

echo '[Install] Updating Package List'
sudo apt-get update

echo '[Install] Upgrading Packages'
sudo apt-get dist-upgrade -y

echo '[Install] Instaling BashIt'
git clone https://github.com/revans/bash-it.git ~/.bash_it

echo '[Install] Reloading Bash'
source ~/.bashrc

echo '[Install] Cloning Castle'
homesick clone pauloelr/Castle
homesick symlink Castle
source ~/.bashrc
homesick rc Castle

echo '[Install] Composer Global Install'
composer global install -n --prefer-source

echo '[Install] Installation Finish'
