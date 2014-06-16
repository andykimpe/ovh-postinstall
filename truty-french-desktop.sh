#!/bin/bash
adduser Desktop
mkdir /home/Desktop
cp /et/skel/* /home/Desktop
apt-get update
apt-get -y dist-upgrade
apt-get -y install ubuntu-desktop language-pack-fr language-pack-fr-base language-pack-gnome-fr language-pack-gnome-fr-base
echo "Desktop:Desktop" | chpasswd
add-apt-repository -y ppa:x2go/stable
apt-get update
apt-get install -y x2goserver x2goserver-xsession
echo "OK"