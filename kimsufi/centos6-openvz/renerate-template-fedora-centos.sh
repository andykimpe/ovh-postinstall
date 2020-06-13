#!/bin/bash
#required os system for generate fedora 32
cd
mkdir -p /newroot/var/lib
touch /newroot/var/lib/random-seed
rpm --rebuilddb --root=/newroot
rm -rf *.rpm
wget http://mirror.centos.org/centos/6/os/x86_64/Packages/centos-release-6-10.el6.centos.12.3.x86_64.rpm
rpm -i --root=/newroot --nodeps *.rpm
cp -n /newroot/etc/pki/rpm-gpg/* /etc/pki/rpm-gpg/
yum --installroot=/newroot install -y rootfiles openssh-clients openssh-server yum yum-utils man wget sudo tar passwd
yum --installroot=/newroot install -y @core
yum --installroot=/newroot clean all
cd /newroot
rm -f /root/centos-6-x86_64-minimal.tar.gz
tar --numeric-owner --ignore-failed-read -cvzpf /root/centos-6-x86_64-minimal.tar.gz .
cd
rm -rf /newroot/
mkdir -p /newroot/var/lib
touch /newroot/var/lib/random-seed
rpm --rebuilddb --root=/newroot
rm -rf *.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/centos-release-7-8.2003.0.el7.centos.x86_64.rpm
rpm -i --root=/newroot --nodeps *.rpm
cp -n /newroot/etc/pki/rpm-gpg/* /etc/pki/rpm-gpg/
yum --installroot=/newroot install -y rootfiles openssh-clients openssh-server yum yum-utils man wget sudo tar passwd
yum --installroot=/newroot install -y @core
yum --installroot=/newroot clean all
cd /newroot
rm -f /root/centos-7-x86_64-minimal.tar.gz
tar --numeric-owner --ignore-failed-read -cvzpf /root/centos-7-x86_64-minimal.tar.gz .
cd
rm -rf /newroot/
mkdir -p /newroot/var/lib
touch /newroot/var/lib/random-seed
rpm --rebuilddb --root=/newroot
rm -rf *.rpm
wget http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/centos-gpg-keys-8.1-1.1911.0.9.el8.noarch.rpm
wget http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/centos-release-8.1-1.1911.0.9.el8.x86_64.rpm
wget http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/centos-repos-8.1-1.1911.0.9.el8.x86_64.rpm
rpm -i --root=/newroot --nodeps *.rpm
cp -n /newroot/etc/pki/rpm-gpg/* /etc/pki/rpm-gpg/
yum --installroot=/newroot install -y rootfiles openssh-clients openssh-server yum yum-utils man wget sudo tar passwd
yum --installroot=/newroot install -y @core
yum --installroot=/newroot clean all
cd /newroot
rm -f /root/centos-8-x86_64-minimal.tar.gz
tar --numeric-owner --ignore-failed-read -cvzpf /root/centos-8-x86_64-minimal.tar.gz .
cd
rm -rf /newroot/
mkdir -p /newroot/var/lib
touch /newroot/var/lib/random-seed
rpm --rebuilddb --root=/newroot
rm -rf *.rpm
wget https://fr2.rpmfind.net/linux/fedora-secondary/releases/30/Everything/ppc64le/os/Packages/f/fedora-gpg-keys-30-1.noarch.rpm
wget https://fr2.rpmfind.net/linux/fedora-secondary/releases/30/Everything/ppc64le/os/Packages/f/fedora-release-30-1.noarch.rpm
wget https://fr2.rpmfind.net/linux/fedora-secondary/releases/30/Everything/ppc64le/os/Packages/f/fedora-repos-30-1.noarch.rpm
rpm -i --root=/newroot --nodeps *.rpm
cp -n /newroot/etc/pki/rpm-gpg/* /etc/pki/rpm-gpg/
yum --installroot=/newroot install -y rootfiles openssh-clients openssh-server yum yum-utils man wget sudo tar passwd
yum --installroot=/newroot install -y @core
yum --installroot=/newroot clean all
cd /newroot
rm -f /root/fedora-30-x86_64-minimal.tar.gz
tar --numeric-owner --ignore-failed-read -cvzpf /root/fedora-30-x86_64-minimal.tar.gz .
cd
rm -rf /newroot/
mkdir -p /newroot/var/lib
touch /newroot/var/lib/random-seed
rpm --rebuilddb --root=/newroot
rm -rf *.rpm
wget https://fr2.rpmfind.net/linux/fedora-secondary/releases/31/Everything/ppc64le/os/Packages/f/fedora-gpg-keys-31-1.noarch.rpm
wget https://fr2.rpmfind.net/linux/fedora-secondary/releases/31/Everything/ppc64le/os/Packages/f/fedora-release-31-1.noarch.rpm
wget https://fr2.rpmfind.net/linux/fedora-secondary/releases/31/Everything/ppc64le/os/Packages/f/fedora-repos-31-1.noarch.rpm
rpm -i --root=/newroot --nodeps *.rpm
cp -n /newroot/etc/pki/rpm-gpg/* /etc/pki/rpm-gpg/
yum --installroot=/newroot install -y rootfiles openssh-clients openssh-server yum yum-utils man wget sudo tar passwd
yum --installroot=/newroot install -y @core
yum --installroot=/newroot clean all
cd /newroot
rm -f /root/fedora-31-x86_64-minimal.tar.gz
tar --numeric-owner --ignore-failed-read -cvzpf /root/fedora-31-x86_64-minimal.tar.gz .
cd
rm -rf /newroot/
mkdir -p /newroot/var/lib
touch /newroot/var/lib/random-seed
rpm --rebuilddb --root=/newroot
rm -rf *.rpm
wget https://fr2.rpmfind.net/linux/fedora-secondary/releases/32/Everything/ppc64le/os/Packages/f/fedora-gpg-keys-32-1.noarch.rpm
wget https://fr2.rpmfind.net/linux/fedora-secondary/releases/32/Everything/ppc64le/os/Packages/f/fedora-release-32-1.noarch.rpm
wget https://fr2.rpmfind.net/linux/fedora-secondary/releases/32/Everything/ppc64le/os/Packages/f/fedora-repos-32-1.noarch.rpm
rpm -i --root=/newroot --nodeps *.rpm
cp -n /newroot/etc/pki/rpm-gpg/* /etc/pki/rpm-gpg/
yum --installroot=/newroot install -y rootfiles openssh-clients openssh-server yum yum-utils man wget sudo tar passwd
yum --installroot=/newroot install -y @core
yum --installroot=/newroot clean all
cd /newroot
rm -f /root/fedora-32-x86_64-minimal.tar.gz
tar --numeric-owner --ignore-failed-read -cvzpf /root/fedora-32-x86_64-minimal.tar.gz .
cd
rm -rf /newroot/
rm -f *.rpm
