#!/bin/bash
apt-get update -q >/dev/null 2>&1
DEBIAN_FRONTEND=noninteractive apt-get -qy dist-upgrade >/dev/null 2>&1
sed -i 's/stretch/buster/g' /etc/apt/sources.list
apt-get update -q >/dev/null 2>&1
rm -f /etc/security/acces.conf
rm -f /etc/crontab
rm -f /etc/ssh/ssh_config
rm -f /etc/bind/named.conf.options
rm -f 
DEBIAN_FRONTEND=noninteractive apt-get -qy dist-upgrade >/dev/null 2>&1
IP=$(wget -qO- ifconfig.me)
IFS=. read -a ArrIP<<<"$IP"
GATEWAY=${ArrIP[0]}.${ArrIP[1]}.${ArrIP[2]}.254
INTERFACES=ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2;getline}'
HOSTNAME=$(hostname -A)
HOST=$(hostname)
cat > /etc/network/interfaces <<EOF
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback


# vmbr0: Bridging. Make sure to use only MAC adresses that were assigned to you.
auto vmbr0
iface vmbr0 inet static
        address $IP/24
        gateway $GATEWAY
        bridge_ports$INTERFACES
        bridge_stp off
        bridge_fd 0



auto vmbr2
#private sub network
iface vmbr2 inet static
        address  192.168.1.1
        netmask  255.255.255.0
        bridge_ports none
        bridge_stp off
        bridge_fd 0

        post-up echo 1 > /proc/sys/net/ipv4/ip_forward
        post-up   iptables -t nat -A POSTROUTING -s '192.168.1.0/24' -o vmbr1 -j MASQUERADE
        post-down iptables -t nat -D POSTROUTING -s '192.168.1.0/24' -o vmbr1 -j MASQUERADE
EOF
chattr -i /etc/hosts
chmod 777 /etc/hosts
cat > /etc/hosts <<EOG
127.0.0.1       localhost.localdomain       localhost
$IP   $HOSTNAME        $HOST

# The following lines are desirable for IPv6 capable hosts
::1     localhost       ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOG
chattr +i /etc/hosts
echo "deb [arch=amd64] http://download.proxmox.com/debian/pve buster pve-no-subscription"> /etc/apt/sources.list.d/pve-install-repo.list
wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -qO /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg >/dev/null 2>&1
chmod +r /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg
apt-get update -q >/dev/null 2>&1
DEBIAN_FRONTEND=noninteractive  apt-get -qy install proxmox-ve postfix open-iscsi >/dev/null 2>&1
echo "OK"
exit
