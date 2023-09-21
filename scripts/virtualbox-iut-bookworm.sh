#!/bin/bash

# on prépositionne le source list de l'IUT
sudo tee /etc/apt/sources.list.iut << EOF
deb http://debian.iutbeziers.fr/debian bookworm main contrib non-free
#deb-src http://debian.iutbeziers.fr/debian bookworm main

deb http://security.debian.org/debian-security bookworm-security main contrib non-free
#deb-src http://security.debian.org/debian-security bookworm-security main
#
deb http://debian.iutbeziers.fr/debian bookworm-updates main  contrib non-free
#deb-src http://debian.iutbeziers.fr/debian bookworm-updates main

deb http://debian.iutbeziers.fr/debian bookworm-backports main contrib non-free
#deb-src http://debian.iutbeziers.fr/debian bookworm-backports main non-free
EOF
#
sudo tee /etc/apt/sources.list << EOF
deb http://deb.debian.org/debian bookworm main non-free-firmware non-free
#deb-src http://deb.debian.org/debian bookworm main non-free-firmware

deb http://deb.debian.org/debian-security/ bookworm-security main non-free-firmware non-free
#deb-src http://deb.debian.org/debian-security/ bookworm-security main non-free-firmware

deb http://deb.debian.org/debian bookworm-updates main non-free-firmware non-free
#deb-src http://deb.debian.org/debian bookworm-updates main non-free-firmware

deb http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware non-free
#deb-src http://deb.debian.org/debian bookworm-backports main contrib non-free
EOF



sudo apt install linux-headers-$(uname -r)
sudo apt-get update && sudo apt-get upgrade -y  && sudo apt-get install -y \
 git  \
 curl \
 debconf \
 locales \
 apt-utils \
 debconf-utils \
 iproute2 \
 net-tools \
 vim \
 apt-transport-https \
 ca-certificates \
 software-properties-common \
 figlet \
 tcpdump \
 open-vm-tools \
 man \
 net-tools \
 mtr \
 bash-completion \
 ssh \
 git \
 pkg-config 


sudo git config --global http.sslverify false
sudo git config --global merge.autostash true
export GIT_SSL_NO_VERIFY=true

sudo sed -i "s/event_activation = 1/event_activation = 0/" /etc/lvm/lvm.conf
sudo mkdir -p -m 755 /etc/apt/keyrings


     

sudo mkdir -p /root/.ssh
sudo chmod 700 /root/.ssh
sudo cat /dev/zero | sudo ssh-keygen -t ed25519 -C "made with ssh-key-now" -q -N ""
#sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCluScPESl1bpumb6lFN/0KEKhEcI+W0VnttVz2jyh9lbwyMoo6eZA7QbwhXx3Qy85u1tD9G1Q6ayzaJ0KdWTRVgqpNA+hWDZ09913zgQS3vnXPvNIBHqZkapnQE7GbegsbCvwfX6ePNBMem9CE8aOKy/6hJU6/ncn1Sf7NxcElRt4xFk9/D0zEjruwApZaWYAT1/O54hfMn1kdkYrRSrz33inR7NPO/LhcJ1WKe+OmDowaEANO49Yr0y83ZzQOmvhBJSfzVA5w2tQIImmWxOagDVEe1kXlyEYqezYcyF77sEAxJTjY90KYOf6DMwn8ke5A0wLDc70cLNR9/UnDJBGr pouchou@portablejmp" | sudo tee -a /root/.ssh/authorized_keys
#sudo chmod 600 /root/.ssh/authorized_keys



sudo echo "Europe/Paris" | sudo tee   /etc/timezone
sudo sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen
sudo rm -f /etc/default/locale
sudo echo 'LANG="fr_FR.UTF-8"' | sudo tee -a /etc/default/locale
sudo  dpkg-reconfigure --frontend=noninteractive locales
sudo  update-locale LANG=fr_FR.UTF-8

sudo timedatectl set-timezone "Europe/Paris"


