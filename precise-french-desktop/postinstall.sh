#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
rm -rf /etc/apt/sources.list /etc/apt/sources.list.d/
mkdir /etc/apt/sources.list.d/
wget https://github.com/andykimpe/ovh-postinstall/raw/master/precise-french-desktop/sources.list -P /etc/apt/
apt-get update
apt-get -y --force-yes dist-upgrade
apt-get -y autoremove
apt-get -y install ubuntu-desktop gnome-session-fallback language-pack-fr language-pack-fr-base language-pack-gnome-fr language-pack-gnome-fr-base ubuntu-restricted-extras
echo "OK"
