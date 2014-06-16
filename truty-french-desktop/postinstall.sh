#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
rm -rf /etc/apt/sources.list /etc/apt/sources.list.d/
mkdir /etc/apt/sources.list.d/
wget https://github.com/andykimpe/ovh-postinstall/raw/master/truty-french-desktop/sources.list -P /etc/apt/
wget https://github.com/andykimpe/ovh-postinstall/raw/master/truty-french-desktop/andykimpe-freshplayerplugin-daily-trusty.list -P /etc/apt/sources.list.d/
apt-get update
apt-get -y --force-yes -f dist-upgrade
apt-get -y autoremove
apt-get -y --force-yes -f install ubuntu-desktop gnome-session-fallback language-pack-fr language-pack-fr-base language-pack-gnome-fr language-pack-gnome-fr-base ubuntu-restricted-extras freshplayerplugin
echo "OK"
