#!/bin/bash
# désactive l'affiche graphique de apt
export DEBIAN_FRONTEND=noninteractive
# ppa libreoffice pour avoir la dernierre version
add-apt-repository -y ppa:libreoffice/ppa
# mise à jour
apt-get update
apt-get -y upgrade
# installation standard de Xubuntu
apt-get -y install xubuntu-desktop
# ajout d'un utilisateur appeller desktop vous pouvez changer le non
useradd desktop
modification du mot de passe pour desktop mot de passe desktop
# vous pouvez le changer voir la doc sur ccm
# http://www.commentcamarche.net/faq/5976-changer-le-mot-de-passe-via-un-script
echo "desktop:desktop" | chpasswd
# création du home
mkdir -p /home/desktop
# copie des fichier standard dans le home
mkhomedir_helper desktop
# installation x2go ppa
add-apt-repository ppa:x2go/stable -y
# mise à jour
apt-get update
# installation de x2go
apt-get -y install x2goserver x2goserver-xsession
# désactivation des option non compatible de openssh
sed -i "s|Ciphers aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes128-ctr|#Ciphers aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes128-ctr|" /etc/ssh/sshd_config
sed -i "s|MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,hmac-ripemd160|#MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,hmac-ripemd160|" /etc/ssh/sshd_config
sed -i "s|KexAlgorithms diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1|#KexAlgorithms diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1|" /etc/ssh/sshd_config
# redémarage du serveur ssh
service ssh restart
# installation de traduction
apt-get -y install myspell-en-au wbritish openoffice.org-hyphenation hunspell-en-ca myspell-en-za
apt-get -y install gimp-help-en mythes-fr hunspell-fr mythes-en-au thunderbird-locale-en-us
apt-get -y install libreoffice-l10n-en-gb myspell-en-gb hyphen-en-us libreoffice-help-en-us
apt-get -y install libreoffice-help-en-gb language-pack-gnome-fr thunderbird-locale-en-gb
apt-get -y install libreoffice-l10n-en-za thunderbird-locale-en hyphen-fr wfrench
apt-get -y install mythes-en-us aspell-fr libreoffice-help-fr












