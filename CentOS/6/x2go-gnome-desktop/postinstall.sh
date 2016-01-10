#!/bin/bash
yum -y install epel-release wget nano
yum -y update
yum -y groupinstall "Desktop" "Desktop Platform" "X Window System" "Fonts"
yum -y groupinstall "Graphical Administration Tools"
yum -y groupinstall "Internet Browser"
yum -y groupinstall "General Purpose Desktop"
yum -y groupinstall "Office Suite and Productivity"
yum -y groupinstall "Graphics Creation Tools"
yum -y groupinstall "Legacy X Window System compatibility"
wget -O /etc/yum.repos.d/x2go.repo http://packages.x2go.org/epel/x2go.repo
yum -y install x2goserver x2goserver-xsession x2goclient
yum -y install wine
yum -y install http://rpm.playonlinux.com/fedora/yum/base/playonlinux-yum-4-1.noarch.rpm
yum -y install playonlinux
service sshd restart
adduser desktop
echo "desktop:desktop" | chpasswd
echo "desktop    ALL=(ALL)       ALL" > /etc/sudoers.d/desktop
chmod 777 /etc/sudoers.d/desktop
sed -i 's/#includedir /etc/sudoers.d/includedir /etc/sudoers.d/g' "/etc/sudoers"
echo "OK"
exit
