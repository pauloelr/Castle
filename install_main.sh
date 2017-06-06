#!/bin/bash
# ppa:teejee2008/ppa = conky-manager
# ppa:pi-rho/dev= tmux
REPOSITORIES="ppa:libreoffice/ppa
ppa:numix/ppa
ppa:webupd8team/java
ppa:webupd8team/sublime-text-3
ppa:webupd8team/y-ppa-manager
ppa:teejee2008/ppa
ppa:webupd8team/atom
ppa:pi-rho/dev"

PACKAGES="apt-transport-https
atom
ca-certificates
chromium-browser
chromium-browser-l10n
compizconfig-settings-manager
conky-all
conky-manager
curl
docker-engine
firefox-locale-pt
gimp
git
gnome-tweak-tool
google-chrome-stable
guake
inkscape
libreoffice-help-en-gb
libreoffice-help-pt-br
libreoffice-l10n-en-gb
libreoffice-l10n-pt-br
nodejs
numix-gtk-theme
numix-icon-theme-circle
opera-stable
oracle-java8-installer
php7.0-cli
php7.0-sqlite
php-pear
php7.0
php7.0-json
php7.0-curl
php7.0-mysql
php7.0-xsl
psensor
software-properties-common
smuxi
spotify-client
subversion
tmux-next
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

NPM_CMD="sudo npm install -g -s"
for NPM_PACKAGE in $NPM_PACKAGES; do
	NPM_CMD="$NPM_CMD $NPM_PACKAGE"
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

echo '[Install] Docker Repository'
curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb https://apt.dockerproject.org/repo/ ubuntu-$(lsb_release -cs) main"

echo '[Install] Google Chrome Repository'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

echo '[Install] Opera Repository'
sudo add-apt-repository -y 'deb http://deb.opera.com/opera-stable/ stable non-free'
wget -qO- http://deb.opera.com/archive.key | sudo apt-key add -

echo '[Install] Spotify Repository'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'

echo '[Install] Nodejs 6.x Repository'
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

echo '[Install] Updating Package List'
sudo apt-get update

echo '[Install] Instaling Packages'
eval $INSTALL_CMD

echo '[Install] Reloading Bash'
source ~/.bashrc

echo '[Install] NPM Packages'
eval $NPM_CMD

cd ~
echo '[Install] Instaling Composer'
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo '[Install] Instaling Homesick'
sudo gem install homesick

echo '[Install] Installing Docker Compose and Machine'
sudo curl -L https://github.com/docker/compose/releases/download/1.11.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/machine/releases/download/v0.9.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine
sudo chmod +x /tmp/docker-machine
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

source <(wget -qO- https://raw.github.com/pauloelr/Castle/master/install_user.sh)
