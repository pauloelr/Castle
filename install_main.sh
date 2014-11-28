#!/bin/bash
REPOSITORIES="ppa:libreoffice/ppa
ppa:numix/ppa
ppa:thefanclub/grive-tools
ppa:webupd8team/java
ppa:webupd8team/sublime-text-3
ppa:webupd8team/y-ppa-manager
ppa:teejee2008/ppa
ppa:thefanclub/grive-tools
ppa:chris-lea/node.js"

PACKAGES="apache2
chromium-browser
chromium-browser-l10n
compizconfig-settings-manager
conky
conky-manager
curl
firefox-locale-pt
gimp
git
gnome-tweak-tool
google-chrome-stable
grive
grive-tools
inkscape
libapache2-mod-php5
libreoffice-help-en-gb
libreoffice-help-pt-br
libreoffice-l10n-en-gb
libreoffice-l10n-pt-br
nodejs
numix-gtk-theme
numix-icon-theme-circle
oracle-java7-installer
php5-cli
php-pear
php5
php5-json
php5-curl
php5-xsl
smuxi
sublime-text-installer
subversion 
unity-tweak-tool
vagrant
vim-gnome
vim
virtualbox
vlc
wget
y-ppa-manager"

NPM_PACKAGES="bower"

INSTALL_CMD="sudo apt-get install -y"
for PACKAGE in $PACKAGES; do
	INSTALL_CMD="$INSTALL_CMD $PACKAGE"
done

echo '[Install] Updating Package List'
sudo apt-get update

echo '[Install] Upgrading Packages'
sudo apt-get dist-upgrade -y

echo '[Install] Adicionando Repositórios'
REPOSITORIES_CMD="sudo add-apt-repository -y"
for REPOSITORY in $REPOSITORIES; do
	eval "$REPOSITORIES_CMD $REPOSITORY"
done
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

echo '[Install] Updating Package List'
sudo apt-get update

echo '[Install] Instaling Packages'
eval $INSTALL_CMD

echo '[Install] Reloading Bash'
source ~/.bashrc

echo '[Install] NPM Packages'
NPM_CMD="sudo npm install -g -s"
for NPM_PACKAGE in $NPM_PACKAGES; do
	eval "$NPM_CMD $NPM_PACKAGE"
done

cd ~
echo '[Install] Instaling Composer'
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo '[Install] Instaling Homesick'
sudo gem install homesick

source <(wget -qO- https://raw.github.com/pauloelr/Castle/master/install_user.sh)
