#!/bin/bash

# 3-1 install portmap
apt-get -y install nfs-kernel-server portmap

# 3-2 export /usr/local to clients on 10.0.0.X
echo "/usr/local 10.0.0.0/255.255.255.0(rw,no_root_squash,subtree_check)" >> /etc/exports
exportfs -a
/etc/init.d/nfs-kernel-server reload

# 3-3 Clients automatically mount /usr/local from the server at boot (not necessarily with /usr/local as mount point)
