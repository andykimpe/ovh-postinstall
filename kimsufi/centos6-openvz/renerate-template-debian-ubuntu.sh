#!/bin/bash
#required os system for generate debian 10
apt-get -y install debootstrap
apt-get -y install debian-keyring
apt-get -y install ubuntu-keyring
mkdir -p /newroot/
debootstrap --components="main,contrib,non-free" --arch=amd64 stretch /newroot/ https://deb.debian.org/debian/
cat > /newroot/etc/apt/sources.list <<EOF
deb http://deb.debian.org/debian/ stretch main contrib non-free
deb-src http://deb.debian.org/debian/ stretch main contrib non-free
deb http://deb.debian.org/debian/ stretch-updates main contrib non-free
deb-src http://deb.debian.org/debian/ stretch-updates main contrib non-free
deb http://deb.debian.org/debian-security stretch/updates main
deb-src http://deb.debian.org/debian-security stretch/updates main
EOF
chroot /newroot/ apt-get update
cat > /newroot/upgrade <<EOF
#!/bin/bash
DEBIAN_FRONTEND="noninteractive" apt-get -y dist-upgrade
EOF
chmod +x /newroot/upgrade
chroot /newroot/ /upgrade
rm -f /newroot/upgrade
chroot /newroot/ apt-get -y install adduser
chroot /newroot/ apt-get -y install apt
chroot /newroot/ apt-get -y install apt-utils
chroot /newroot/ apt-get -y install bzip2
chroot /newroot/ apt-get -y install console-setup
chroot /newroot/ apt-get -y install debconf
chroot /newroot/ apt-get -y install debconf-i18n
chroot /newroot/ apt-get -y install eject
chroot /newroot/ apt-get -y install gnupg
chroot /newroot/ apt-get -y install ifupdown
chroot /newroot/ apt-get -y install initramfs-tools
chroot /newroot/ apt-get -y install iproute2
chroot /newroot/ apt-get -y install iputils-ping
chroot /newroot/ apt-get -y install isc-dhcp-client
chroot /newroot/ apt-get -y install kbd
chroot /newroot/ apt-get -y install kmod
chroot /newroot/ apt-get -y install less
chroot /newroot/ apt-get -y install locales
chroot /newroot/ apt-get -y install lsb-release
chroot /newroot/ apt-get -y install makedev
chroot /newroot/ apt-get -y install mawk
chroot /newroot/ apt-get -y install net-tools
chroot /newroot/ apt-get -y install netbase
chroot /newroot/ apt-get -y install netcat-openbsd
chroot /newroot/ apt-get -y install passwd
chroot /newroot/ apt-get -y install procps
chroot /newroot/ apt-get -y install python3
chroot /newroot/ apt-get -y install resolvconf
chroot /newroot/ apt-get -y install rsyslog
chroot /newroot/ apt-get -y install sudo
chroot /newroot/ apt-get -y install tzdata
chroot /newroot/ apt-get -y install debian-keyring
chroot /newroot/ apt-get -y install udev
chroot /newroot/ apt-get -y install ureadahead
chroot /newroot/ apt-get -y install vim-tiny
chroot /newroot/ apt-get -y install whiptail
chroot /newroot/ apt-get -y install ssh
chroot /newroot/ apt-get clean
chroot /newroot/ apt-get auto-clean
sed -i 's|#PermitRootLogin prohibit-password|PermitRootLogin yes|' "/newroot/etc/ssh/sshd_config"
cd /newroot
rm -f /root/debian-9-x86_64-minimal.tar.gz
tar --numeric-owner --ignore-failed-read -cvzpf /root/debian-9-x86_64-minimal.tar.gz .
cd
rm -rf /newroot/
mkdir -p /newroot/
debootstrap --components="main,contrib,non-free" --arch=amd64 buster /newroot/ https://deb.debian.org/debian/
cat > /newroot/etc/apt/sources.list <<EOF
deb http://deb.debian.org/debian/ buster main contrib non-free
deb-src http://deb.debian.org/debian/ buster main contrib non-free
deb http://deb.debian.org/debian/ buster-updates main contrib non-free
deb-src http://deb.debian.org/debian/ buster-updates main contrib non-free
deb http://deb.debian.org/debian-security buster/updates main
deb-src http://deb.debian.org/debian-security buster/updates main
EOF
chroot /newroot/ apt-get update
cat > /newroot/upgrade <<EOF
#!/bin/bash
DEBIAN_FRONTEND="noninteractive" apt-get -y dist-upgrade
EOF
chmod +x /newroot/upgrade
chroot /newroot/ /upgrade
rm -f /newroot/upgrade
chroot /newroot/ apt-get -y install adduser
chroot /newroot/ apt-get -y install apt
chroot /newroot/ apt-get -y install apt-utils
chroot /newroot/ apt-get -y install bzip2
chroot /newroot/ apt-get -y install console-setup
chroot /newroot/ apt-get -y install debconf
chroot /newroot/ apt-get -y install debconf-i18n
chroot /newroot/ apt-get -y install eject
chroot /newroot/ apt-get -y install gnupg
chroot /newroot/ apt-get -y install ifupdown
chroot /newroot/ apt-get -y install initramfs-tools
chroot /newroot/ apt-get -y install iproute2
chroot /newroot/ apt-get -y install iputils-ping
chroot /newroot/ apt-get -y install isc-dhcp-client
chroot /newroot/ apt-get -y install kbd
chroot /newroot/ apt-get -y install kmod
chroot /newroot/ apt-get -y install less
chroot /newroot/ apt-get -y install locales
chroot /newroot/ apt-get -y install lsb-release
chroot /newroot/ apt-get -y install makedev
chroot /newroot/ apt-get -y install mawk
chroot /newroot/ apt-get -y install net-tools
chroot /newroot/ apt-get -y install netbase
chroot /newroot/ apt-get -y install netcat-openbsd
chroot /newroot/ apt-get -y install passwd
chroot /newroot/ apt-get -y install procps
chroot /newroot/ apt-get -y install python3
chroot /newroot/ apt-get -y install resolvconf
chroot /newroot/ apt-get -y install rsyslog
chroot /newroot/ apt-get -y install sudo
chroot /newroot/ apt-get -y install tzdata
chroot /newroot/ apt-get -y install debian-keyring
chroot /newroot/ apt-get -y install udev
chroot /newroot/ apt-get -y install ureadahead
chroot /newroot/ apt-get -y install vim-tiny
chroot /newroot/ apt-get -y install whiptail
chroot /newroot/ apt-get -y install ssh
chroot /newroot/ apt-get clean
chroot /newroot/ apt-get auto-clean
sed -i 's|#PermitRootLogin prohibit-password|PermitRootLogin yes|' "/newroot/etc/ssh/sshd_config"
cd /newroot
rm -f /root/debian-10-x86_64-minimal.tar.gz
tar --numeric-owner --ignore-failed-read -cvzpf /root/debian-10-x86_64-minimal.tar.gz .
cd
rm -rf /newroot/
mkdir -p /newroot/
debootstrap --include ubuntu-minimal  --components="main,restricted,universe,multiverse" --arch=amd64 xenial /newroot/ http://fr.archive.ubuntu.com/ubuntu
cat > /newroot/etc/apt/sources.list <<EOF
deb http://fr.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse 
deb-src http://fr.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse 
deb http://fr.archive.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse 
deb http://fr.archive.ubuntu.com/ubuntu/ xenial-updates main restricted universe multiverse 
deb-src http://fr.archive.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse 
deb-src http://fr.archive.ubuntu.com/ubuntu/ xenial-updates main restricted universe multiverse 
deb http://archive.canonical.com/ubuntu xenial partner
deb-src http://archive.canonical.com/ubuntu xenial partner
EOF
chroot /newroot/ apt-get update
cat > /newroot/upgrade <<EOF
#!/bin/bash
DEBIAN_FRONTEND="noninteractive" apt-get -y dist-upgrade
EOF
chmod +x /newroot/upgrade
chroot /newroot/ /upgrade
rm -f /newroot/upgrade
chroot /newroot/ apt-get clean
chroot /newroot/ apt-get auto-clean
sed -i 's|PermitRootLogin prohibit-password|PermitRootLogin yes|' "/newroot/etc/ssh/sshd_config"
cd /newroot
rm -f /root/ubuntu-16.04-x86_64-minimal.tar.gz
tar --numeric-owner --ignore-failed-read -cvzpf /root/ubuntu-16.04-x86_64-minimal.tar.gz .
cd
rm -rf /newroot/
mkdir -p /newroot/
debootstrap --include "ubuntu-minimal,ssh" --components="main,restricted,universe,multiverse" --arch=amd64 bionic /newroot/ "http://fr.archive.ubuntu.com/ubuntu"
cat > /newroot/etc/apt/sources.list <<EOF
deb http://fr.archive.ubuntu.com/ubuntu/ bionic main restricted universe multiverse 
deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic main restricted universe multiverse 
deb http://fr.archive.ubuntu.com/ubuntu/ bionic-security main restricted universe multiverse 
deb http://fr.archive.ubuntu.com/ubuntu/ bionic-updates main restricted universe multiverse 
deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic-security main restricted universe multiverse 
deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic-updates main restricted universe multiverse 
deb http://archive.canonical.com/ubuntu bionic partner
deb-src http://archive.canonical.com/ubuntu bionic partner
EOF
chroot /newroot/ apt-get update
cat > /newroot/upgrade <<EOF
#!/bin/bash
DEBIAN_FRONTEND="noninteractive" apt-get -y dist-upgrade
EOF
chmod +x /newroot/upgrade
chroot /newroot/ /upgrade
rm -f /newroot/upgrade
chroot /newroot/ apt-get clean
chroot /newroot/ apt-get auto-clean
sed -i 's|PermitRootLogin prohibit-password|PermitRootLogin yes|' "/newroot/etc/ssh/sshd_config"
cd /newroot
rm -f /root/ubuntu-18.04-x86_64-minimal.tar.gz
tar --numeric-owner --ignore-failed-read -cvzpf /root/ubuntu-18.04-x86_64-minimal.tar.gz .
cd
rm -rf /newroot/
mkdir -p /newroot/
debootstrap --include ubuntu-minimal  --components="main,restricted,universe,multiverse" --arch=amd64 focal /newroot/ http://fr.archive.ubuntu.com/ubuntu
cat > /newroot/etc/apt/sources.list <<EOF
deb http://fr.archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse 
deb-src http://fr.archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse 
deb http://fr.archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse 
deb http://fr.archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse 
deb-src http://fr.archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse 
deb-src http://fr.archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse 
deb http://archive.canonical.com/ubuntu focal partner
deb-src http://archive.canonical.com/ubuntu focal partner
EOF
chroot /newroot/ apt-get update
cat > /newroot/upgrade <<EOF
#!/bin/bash
DEBIAN_FRONTEND="noninteractive" apt-get -y dist-upgrade
EOF
chmod +x /newroot/upgrade
chroot /newroot/ /upgrade
rm -f /newroot/upgrade
chroot /newroot/ apt-get clean
chroot /newroot/ apt-get auto-clean
sed -i 's|PermitRootLogin prohibit-password|PermitRootLogin yes|' "/newroot/etc/ssh/sshd_config"
cd /newroot
rm -f /root/ubuntu-20.04-x86_64-minimal.tar.gz
tar --numeric-owner --ignore-failed-read -cvzpf /root/ubuntu-20.04-x86_64-minimal.tar.gz .
cd
rm -rf /newroot/
