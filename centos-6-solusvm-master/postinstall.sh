#!/bin/bash
#please beta dot use
rm -f /etc/yum.repos.d/CentOS-Base.repo
wget https://github.com/andykimpe/ovh-postinstall/raw/master/centos-6/CentOS-Base.repo -P /etc/yum.repos.d/
yum -y update
mkdir -p /usr/local/solusvm/tmp/
yum -y install glibc glibc-devel glibc-devel.i686 perl php php-cli php-common
wget http://files.eu.fr.soluslabs.com/solusvm/loaders/ioncube_loaders_lin_x86_64.tar.gz -O /usr/local/solusvm/tmp/ioncube_loaders.tar.gz
wget http://files.eu.fr.soluslabs.com/solusvm/loaders/php.ini.64.6 -O /etc/php.ini
userdel solusvm
adduser -d /usr/local/solusvm -s /sbin/nologin solusvm
wget http://repo.soluslabs.com/centos/soluslabs.repo -O /etc/yum.repos.d/soluslabs.repo
yum clean all
tar vxzf /usr/local/solusvm/tmp/ioncube_loaders.tar.gz -C /etc/
wget http://files.eu.fr.soluslabs.com/solusvm/installer/v3/installscripts.tar.gz -O /usr/local/solusvm/tmp/installscripts.tar.gz
mkdir -p /usr/local/solusvm/tmp/.install/
tar vxzf /usr/local/solusvm/tmp/installscripts.tar.gz -C /usr/local/solusvm/tmp/.install/
chown root:root /usr/local/solusvm/tmp/.install/*
chmod +x /usr/local/solusvm/tmp/.install/*
php /usr/local/solusvm/tmp/.install/master --virt=openvz
echo OK
