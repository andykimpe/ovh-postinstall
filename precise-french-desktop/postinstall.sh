#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
rm -rf /etc/apt/sources.list /etc/apt/sources.list.d/
mkdir /etc/apt/sources.list.d/
wget https://github.com/andykimpe/ovh-postinstall/raw/master/precise-french-desktop/sources.list -P /etc/apt/
wget https://github.com/andykimpe/ovh-postinstall/raw/master/precise-french-desktop/andykimpe-freshplayerplugin-daily-precise.list -P /etc/apt/sources.list.d/
wget https://github.com/andykimpe/ovh-postinstall/raw/master/precise-french-desktop/andykimpe-skype-precise.list -P /etc/apt/sources.list.d/
wget https://github.com/andykimpe/ovh-postinstall/raw/master/precise-french-desktop/ubuntu-wine-ppa-precise.list -P /etc/apt/sources.list.d/
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 99B2B9B3274A7DA0
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 5A9A06AEF9CB8DB0
dpkg --add-architecture i386
apt-get update
apt-get -y dist-upgrade
apt-get -y autoremove
apt-get -y install ubuntu-desktop gnome-session-fallback language-pack-fr language-pack-fr-base language-pack-gnome-fr language-pack-gnome-fr-base ubuntu-restricted-extras chromium-browser
apt-get -y install freshplayerplugin skype wine1.7 playonlinux openjdk-7-jre icedtea-7-plugin vlc
echo "OK"
