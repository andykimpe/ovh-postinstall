#!/bin/bash
rm -f /etc/yum.repos.d/CentOS-Base.repo
wget https://github.com/andykimpe/ovh-postinstall/raw/master/centos-6/CentOS-Base.repo -P /etc/yum.repos.d/
yum -y update
echo "OK"
exit
