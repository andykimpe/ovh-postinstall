#!/bin/bash
yum -y install wget
wget -P /etc/yum.repos.d/ https://github.com/andykimpe/ovh-postinstall/raw/master/kimsufi/centos6-openvz/openvz.repo
rpm --import https://github.com/andykimpe/ovh-postinstall/raw/master/kimsufi/centos6-openvz/RPM-GPG-Key-OpenVZ
yum -y update
yum -y install vzkernel
cat > /etc/sysctl.conf <<EOF
# On Hardware Node we generally need
# packet forwarding enabled and proxy arp disabled
net.ipv4.ip_forward = 1
net.ipv6.conf.default.forwarding = 1
net.ipv6.conf.all.forwarding = 1
net.ipv4.conf.default.proxy_arp = 0
# Enables source route verification
net.ipv4.conf.all.rp_filter = 1
# Enables the magic-sysrq key
kernel.sysrq = 1
# We do not want all our interfaces to send redirects
net.ipv4.conf.default.send_redirects = 1
net.ipv4.conf.all.send_redirects = 0
EOF
echo "SELINUX=disabled" > /etc/sysconfig/selinux
yum -y install vzctl vzquota ploop
yum -y remove kernel
rm -f /boot/*.bak
kernel1=$(find /boot -name  vmlinuz*)
kernel2=$(find /boot -name  initramfs*)
cp /boot/grub/grub.conf /boot/grub/grub.conf_disabled_by_openvz_install
chmod 777 /boot/grub/grub.conf
wget -O /boot/grub/grub.conf https://github.com/andykimpe/ovh-postinstall/raw/master/kimsufi/centos6-openvz/grub.conf
chmod 777 /boot/grub/grub.conf
sed -i "s|!KERNEL1!|$kernel1|" "/boot/grub/grub.conf"
sed -i 's/kernel1/$kernel1/g' "/boot/grub/grub.conf"
cat > /boot/grub/grub.conf <<EOF
default=0
timeout=5
	title linux openvz
	kernel $kernel1 root=/dev/sda1  ro
	root (hd0,0)
	initrd $kernel2
EOF
mkdir -p /vz/template/cache
rm -rf /vz/template/cache/*
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
ubuntu 20.04
wget -P /vz/template/cache https://github.com/andykimpe/ovh-postinstall/releases/download/1.0/ubuntu-20.04-x86_64-minimal.tar.gz
wget -O - https://raw.githubusercontent.com/sibprogrammer/owp/master/installer/ai.sh | sh
echo "OK"
exit
