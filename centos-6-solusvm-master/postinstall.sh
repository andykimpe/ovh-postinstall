#!/bin/bash
#please beta dot use
rm -f /etc/yum.repos.d/CentOS-Base.repo
wget --no-check-certificate https://github.com/andykimpe/ovh-postinstall/raw/master/centos-6/CentOS-Base.repo -P /etc/yum.repos.d/
yum -y update
YUM_PATH=/usr/bin/yum
WGET_PATH=/usr/bin/wget
MKDIR_PATH=/bin/mkdir
CLEAR_PATH=/usr/bin/clear
ECHO_PATH=/bin/echo
PRINTF_PATH=/usr/bin/printf
TAR_PATH=/bin/tar
PHP_PATH=/usr/bin/php
$CLEAR_PATH
$MKDIR_PATH -p /usr/local/solusvm/tmp/
PRELOG=/tmp/preinstall.log
TMP1=/tmp/version.txt
TMP2=/tmp/type.txt
MIRROR=http://files.soluslabs.com
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
setenforce 0
$ECHO_PATH "6" > /tmp/version.txt
CENT_VERSION=`cat /tmp/version.txt`
$ECHO_PATH "1" > /tmp/svmversion.txt		
SVM_VERSION=`cat /tmp/svmversion.txt`
$ECHO_PATH "http://files.eu.fr.soluslabs.com" > /tmp/filemirror.txt
MIRROR=`cat /tmp/filemirror.txt`
option="2"
$YUM_PATH -y install glibc glibc-devel glibc-devel.i686 perl php php-cli php-common 
if [ -d /usr/lib64 ]; then
#64 bit
$WGET_PATH $MIRROR/solusvm/loaders/ioncube_loaders_lin_x86_64.tar.gz -O /usr/local/solusvm/tmp/ioncube_loaders.tar.gz
$WGET_PATH $MIRROR/solusvm/loaders/php.ini.64.${CENT_VERSION} -O /etc/php.ini
else
#32bit
$WGET_PATH $MIRROR/solusvm/loaders/ioncube_loaders_lin_x86.tar.gz -O /usr/local/solusvm/tmp/ioncube_loaders.tar.gz
$WGET_PATH $MIRROR/solusvm/loaders/php.ini.32.${CENT_VERSION} -O /etc/php.ini
fi  	  
userdel solusvm 
adduser -d /usr/local/solusvm -s /sbin/nologin solusvm
$WGET_PATH https://github.com/andykimpe/ovh-postinstall/raw/master/centos-6-solusvm-master/soluslabs.repo -O /etc/yum.repos.d/soluslabs.repo
$YUM_PATH clean all
$TAR_PATH vxzf /usr/local/solusvm/tmp/ioncube_loaders.tar.gz -C /etc/
$WGET_PATH $MIRROR/solusvm/installer/v3/installscripts.tar.gz -O /usr/local/solusvm/tmp/installscripts.tar.gz
$MKDIR_PATH -p /usr/local/solusvm/tmp/.install/
$TAR_PATH vxzf /usr/local/solusvm/tmp/installscripts.tar.gz -C /usr/local/solusvm/tmp/.install/
chown root:root /usr/local/solusvm/tmp/.install/*
chmod +x /usr/local/solusvm/tmp/.install/*
$PHP_PATH /usr/local/solusvm/tmp/.install/master --virt=openvz
