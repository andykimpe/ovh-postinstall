#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
rm -rf /etc/apt/sources.list /etc/apt/sources.list.d/
mkdir /etc/apt/sources.list.d/
wget https://github.com/andykimpe/ovh-postinstall/raw/master/truty-french-desktop/sources.list -P /etc/apt/
wget https://github.com/andykimpe/ovh-postinstall/raw/master/truty-french-desktop/andykimpe-freshplayerplugin-daily-trusty.list -P /etc/apt/sources.list.d/
wget https://github.com/andykimpe/ovh-postinstall/raw/master/truty-french-desktop/andykimpe-skype-trusty.list -P /etc/apt/sources.list.d/
wget https://github.com/andykimpe/ovh-postinstall/raw/master/truty-french-desktop/ubuntu-wine-ppa-trusty.list -P /etc/apt/sources.list.d/
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 99B2B9B3274A7DA0
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 5A9A06AEF9CB8DB0
dpkg --add-architecture i386
apt-get update
apt-get -y --force-yes -f dist-upgrade
apt-get -y autoremove
apt-get -y --force-yes -f install ubuntu-desktop gnome-session-fallback language-pack-fr language-pack-fr-base language-pack-gnome-fr language-pack-gnome-fr-base ubuntu-restricted-extras chromium-browser
apt-get -y --force-yes -f install freshplayerplugin skype wine1.7 playonlinux
echo "OK"
