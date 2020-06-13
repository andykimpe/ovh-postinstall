#!/bin/bash
wget --no-check-certificate -P /etc/yum.repos.d/ https://github.com/andykimpe/ovh-postinstall/raw/master/kimsufi/centos6-openvz/openvz.repo
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
kernel1=$(find /boot -name  vmlinuz*)
kernel2=$(find /boot -name  initramfs*)
chmod 777 /boot/grub/grub.conf
cat > /boot/grub/grub.conf <<EOF
default=0
timeout=5
	title linux solusvm-master-vz_64
	kernel $kernel1 root=/dev/sda1  ro
	root (hd0,0)
	initrd $kernel2
EOF
echo "OK"
exit
