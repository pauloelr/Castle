#!/bin/bash
command -v homesick >/dev/null 2>&1 || { sudo gem install homesick; }
command -v git >/dev/null 2>&1 || { sudo apt-get install git-core; }

echo '[Install] Instaling BashIt'
git clone https://github.com/revans/bash-it.git ~/.bash_it

echo '[Install] Cloning Castle'
homesick clone pauloelr/Castle
yes y | homesick symlink Castle
source ~/.bashrc

echo '[Install] Enabling BashIt Plugins'
source <(wget -qO- https://raw.github.com/pauloelr/Castle/master/enable_bashit.sh)

echo '[Install] Installing Vundle'
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if [ -e "$HOME/.composer/composer.json" ]; then
    command -v composer >/dev/null 2>&1 || { \
        cd ~  \
        echo '[Install] Instaling Composer' \
        curl -sS https://getcomposer.org/installer | php; \
        sudo mv composer.phar /usr/local/bin/composer; \
    }
    echo '[Install] Composer Global Install'
    composer global install -n --prefer-source
fi

#Uncoment These Lines to Change Theme
#echo '[Install] Change Theme'
#sed -i "s/export BASH_IT_THEME=.*/export BASH_IT_THEME='psyco_server'/" ~/.homesick/repos/Castle/home/.bash_profile

echo '[Install] Installation Finished'
