#!/bin/bash

sed -i '/^portmap/d' /etc/hosts.allow
sed -i '/^nportmap/d' /etc/hosts.allow
sed -i '/^portmap/d' /etc/hosts.deny
sed -i '/^automount/d' /etc/nsswitch.conf
sed -i '/auto\.master/d' /etc/auto.master

# Exercise 3: Configure a file server
# 3-1 Set your server up as a file server using NFS (or the network file system of your choice).
apt-get -y install nfs-kernel-server

# 3-2 Configure your server to export the /usr/local directory to all clients [...]
# ALSO CREATE /usr/local ?? """"""""""""""""""""""""
echo "/usr/local 10.0.0.3(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
echo "/usr/local 10.0.0.4(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports

# [...] It must not be possible to access /usr/local from any other system. Your server must not treat root users on the client as root on the exported file system. 
echo "portmap: 10.0.0./255.255.255.248\nportmap: 127.0.0.1" >> /etc/hosts.allow
echo "portmap: 0.0.0.0" >> /etc/hosts.deny

# 3-3 Clients automatically mount /usr/local from the server at boot (not necessarily with /usr/local as mount point)
# see clients.sh

# 4: The automounter
# 4-2 Create two new users. Create /home1 and /home2 directories for the two users. Move one user's home directory to /home1/USERNAME and other user's home directory to /home2/USERNAME
mkdir /home1
mkdir /home2
# see test script

# Note: Ensure that no home directories remain in /home. Do not change the home directory location in the user database.

# 4-3 Configure your NFS server to export /home1 and /home2 with the appropriate permissions to your clients (and only your clients)
mntopt="rw,sync,no_root_squash,no_subtree_check"
mntopts="(${mntopt})"
mntrootopts="(fsid=0,${mntopt})"

echo "/srv/nfs/ ${c1}${mntrootopts} ${c2}${mntrootopts}" >> /etc/exports
echo "/srv/nfs/local/ ${nw}.${STARTADDRESS}/29${mntopts}" >> /etc/exports

echo "/srv/nfs/home1/ ${c1}${mntopts} ${c2}${mntopts}" >> /etc/exports
echo "/srv/nfs/home2/ ${c1}${mntopts} ${c2}${mntopts}" >> /etc/exports

sed -i "s/^ALL\ =.*/ALL\ =\ \ ${maps}/" /var/yp/Makefile

/etc/init.d/nfs-kernel-server restart
  
# 5: Configure the automounter
# [WARNING] reorder the boot sequence so that nis starts before autofs (see course website)
...

# 5-1 Install an automounter on the clients and on the server. The autofs package is recommended. [...]
apt-get -y install autofs

# 5-2 Configure the automounter so it mounts /home/USERNAME from the user's real home directory (on the NFS server). Make /home an indirect mount point - that is, the automounter will automatically mount subdirectories of /home, but not /home itself. You will probably need one line per user in the configuration file.
echo -e "/home\t\t auto.home" > /etc/auto.master
echo -e "/usr/local\t auto.local" >> /etc/auto.master
echo -e "+auto.master" >> /etc/auto.master

# (5-3 Verify that all users can log on to the client and that the correct home directories are mounted.)
# see test script

nisrestart
/etc/init.d/autofs start

