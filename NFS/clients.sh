#!/bin/bash

apt-get -y install autofs

apt-get -y install nfs-client

# 3-3 Clients automatically mount /usr/local from the server at boot (not necessarily with /usr/local as mount point)
sed -i '/automount/d' /etc/nsswitch.conf
echo -e "automount:\tfiles nis" >> /etc/nsswitch.conf

nisrestart

/etc/init.d/autofs start
