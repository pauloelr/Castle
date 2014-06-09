#!/bin/bash
cd ~ 

REPOSITORIES="ppa:libreoffice/ppa ppa:numix/ppa
ppa:thefanclub/grive-tools
ppa:webupd8team/java
ppa:webupd8team/sublime-text-2
ppa:webupd8team/y-ppa-manager"

PACKAGES="apache2 
chromium-browser 
chromium-browser-l10n
compizconfig-settings-manager
conky
curl
firefox-locale-pt
gimp
git-core
gnome-tweak-tool
grive
grive-tools
inkscape
libapache2-mod-php5
libreoffice-help-en-gb
libreoffice-help-pt-br
libreoffice-l10n-en-gb
libreoffice-l10n-pt-br
numix-gtk-theme
numix-icon-theme-circle
numix-icon-theme-shine
oracle-java7-installer
php5-cli
php5
php5-json
php5-xsl
smuxi
sublime-text
unity-tweak-tool
vagrant
vim-gnome
vim
virtualbox
vlc
y-ppa-manager"

INSTALL_CMD="sudo apt-get install -y"
for PACKAGE in $PACKAGES; do
	INSTALL_CMD="$INSTALL_CMD $PACKAGE"
done

echo '[Install] Updating Package List'
sudo apt-get update

echo '[Install] Upgrading Packages'
sudo apt-get dist-upgrade -y

REPOSITORIES_CMD="sudo add-apt-repository -y"
for REPOSITORY in $REPOSITORIES; do
	eval "$REPOSITORIES_CMD $REPOSITORY"
done

echo '[Install] Updating Package List'
sudo apt-get update

echo '[Install] Instaling Packages'
eval $INSTALL_CMD

echo '[Install] Reloading Bash'
source ~/.bashrc

echo '[Install] Instaling Composer'
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo '[Install] Instaling BashIt'
git clone https://github.com/revans/bash-it.git ~/.bash_it

echo '[Install] Instaling Homesick'
sudo gem install homesick

echo '[Install] Reloading Bash'
source ~/.bashrc

echo '[Install] Cloning Castle'
homesick clone pauloelr/Castle
homesick symlink Castle
source ~/.bashrc
homesick rc Castle

echo '[Install] Composer Global Install'
composer global install -n --prefer-source

echo '[Install] Applying Changes'
source ~/.bashrc

echo '[Install] Installation Finish'
