#!/bin/bash

#apt-get update
#apt-get upgrade
#apt-get -y install nis

#echo "domain example.com server server.example.com" >> /etc/yp.conf

sed -ir 's/^passwd:\s*.*$/passwd: compat nis/g' /etc/nsswitch.conf
#sed -i 's/group: files systemd/group: compat nis/g' /etc/nsswitch.conf
#sed -i 's/shadow: files systemd/shadow: compat nis/g' /etc/nsswitch.conf
