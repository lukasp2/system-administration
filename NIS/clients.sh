#!/bin/bash

apt-get update
apt-get -y upgrade
apt-get -y install nis

echo "domain example.com server server.example.com" >> /etc/yp.conf

sed -ir 's/^passwd:\s*.*$/passwd: compat nis/g' /etc/nsswitch.conf
sed -ir 's/^group:\s*.*$/group: compat nis/g' /etc/nsswitch.conf
sed -ir 's/^shadow:\s*.*$/shadow: compat nis/g' /etc/nsswitch.conf

sed -ir 's/^hosts:\s*.*$/shadow: files dns nis/g' /etc/nsswitch.conf

systemctl restart nis

echo "ypbind -broadcast" >> ~/.bashrc
ypbind -broadcast
