#!/bin/bash

apt-get -y install autofs nfs-client

# 3-3 Clients automatically mount /usr/local from the server at boot (not necessarily with /usr/local as mount point)
sed -i '/automount/d' /etc/nsswitch.conf
echo -e "automount:\tfiles nis" >> /etc/nsswitch.conf

echo "mount -t nfs 10.0.0.1:/usr/local /mnt/usr/local" >> /etc/exports
echo "10.0.0.1:/usr/local /mnt nfs defaults 0 0" >> /etc/fstab
echo "autofs: files nis" >> /etc/nsswitch.conf

/etc/init.d/nis restart

/etc/init.d/autofs start
