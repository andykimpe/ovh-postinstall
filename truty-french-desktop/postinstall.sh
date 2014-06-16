#!/bin/bash
apt-get update
apt-get -y dist-upgrade
apt-get -y autoremove
apt-get -y install update-manager-core
do-release-upgrade -d -f DistUpgradeViewNonInteractive
apt-get -y install ubuntu-desktop gnome-session-fallback language-pack-fr language-pack-fr-base language-pack-gnome-fr language-pack-gnome-fr-base
echo "OK"
