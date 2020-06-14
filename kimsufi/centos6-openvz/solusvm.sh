#!/bin/bash
yum -y install wget
yum -y update
#centos 6
wget -P /vz/template/cache https://github.com/andykimpe/ovh-postinstall/releases/download/1.0/centos-6-x86_64-minimal.tar.gz
#centos 7
wget -P /vz/template/cache https://github.com/andykimpe/ovh-postinstall/releases/download/1.0/centos-7-x86_64-minimal.tar.gz
#centos 8
wget -P /vz/template/cache https://github.com/andykimpe/ovh-postinstall/releases/download/1.0/centos-8-x86_64-minimal.tar.gz
#fedora 30
wget -P /vz/template/cache https://github.com/andykimpe/ovh-postinstall/releases/download/1.0/fedora-30-x86_64-minimal.tar.gz
# fedora 31
wget -P /vz/template/cache https://github.com/andykimpe/ovh-postinstall/releases/download/1.0/fedora-31-x86_64-minimal.tar.gz
# fedora 32 
wget -P /vz/template/cache https://github.com/andykimpe/ovh-postinstall/releases/download/1.0/fedora-32-x86_64-minimal.tar.gz
#debian 7
wget -P /vz/template/cache https://download.openvz.org/template/precreated/debian-7.0-x86_64-minimal.tar.gz
# debian 8
wget -P /vz/template/cache https://download.openvz.org/template/precreated/debian-8.0-x86_64-minimal.tar.gz
# debian 9
wget -P /vz/template/cache https://github.com/andykimpe/ovh-postinstall/releases/download/1.0/debian-9-x86_64-minimal.tar.gz
# debian 10
wget -P /vz/template/cache https://github.com/andykimpe/ovh-postinstall/releases/download/1.0/debian-10-x86_64-minimal.tar.gz
# ubuntu 12.04 
wget -P /vz/template/cache https://download.openvz.org/template/precreated/ubuntu-12.04-x86_64-minimal.tar.gz
#ubuntu 14.04
wget -P /vz/template/cache https://download.openvz.org/template/precreated/ubuntu-14.04-x86_64-minimal.tar.gz
# ubuntu 16.04
wget -P /vz/template/cache https://github.com/andykimpe/ovh-postinstall/releases/download/1.0/ubuntu-16.04-x86_64-minimal.tar.gz 
# ubuntu 18.04
wget -P /vz/template/cache https://github.com/andykimpe/ovh-postinstall/releases/download/1.0/ubuntu-18.04-x86_64-minimal.tar.gz
# ubuntu 20.1
wget -P /vz/template/cache https://github.com/andykimpe/ovh-postinstall/releases/download/1.0/ubuntu-20.04-x86_64-minimal.tar.gz
wget -O - https://github.com/andykimpe/ovh-postinstall/raw/master/kimsufi/centos6-openvz/ai.sh | sh
wget -O /etc/modprobe.d/openvz.conf https://github.com/andykimpe/ovh-postinstall/raw/master/kimsufi/centos6-openvz/openvz.conf
service lighttpd stop
chkconfig lighttpd off
yum -y install svmstack-nginx svmstack-nginx-legacy-master-config
wget https://github.com/andykimpe/ovh-postinstall/raw/master/kimsufi/centos6-openvz/nginx.conf -O /usr/local/svmstack/nginx/conf/nginx.conf
chkkconfig httpd on
service httpd restart
chkconfig svmstack-nginx on
service svmstack-nginx restart
chkconfig svmstack-fpm on
service svmstack-fpm restart
echo "OK"
exit
