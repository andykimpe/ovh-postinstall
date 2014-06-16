#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
rm -f /etc/apt/sources.list
wget https://github.com/andykimpe/ovh-postinstall/raw/master/truty-french-desktop/sources.list -P /etc/apt/
apt-get update
apt-get -y dist-upgrade
apt-get -y autoremove
apt-get -y install ubuntu-desktop gnome-session-fallback language-pack-fr language-pack-fr-base language-pack-gnome-fr language-pack-gnome-fr-base ubuntu-restricted-extras
echo "OK"
