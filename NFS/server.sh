#!/bin/bash

# Exercise 3: Configure a file server
# 3-1 install portmap
apt-get -y install nfs-kernel-server portmap

# 3-2 export /usr/local to clients on 10.0.0.X
echo "/usr/local 10.0.0.3(rw) 10.0.0.4(rw)" >> /etc/exports
exportfs -a
/etc/init.d/nfs-kernel-server reload

# 3-3 Clients automatically mount /usr/local from the server at boot (not necessarily with /usr/local as mount point)
...

# 4: The automounter
# Create /home1 and /home2 directories for two users.
...

# 4-2 Create two new users.
...

# Move one user's home directory to /home2/USERNAME
...

# Move the other user's home directory to /home1/USERNAME
...

# Note: Ensure that no home directories remain in /home. Do not change the home directory location in the user database.

# 4-3 Configure your NFS server to export /home1 and /home2 with the appropriate permissions to your clients (and only your clients)
...

# 5: Configure the automounter
# [WARNING] reorder the boot sequence so that nis starts before autofs (see course website)
...

# 5-1 Install an automounter on the clients and on the server. The autofs package is recommended. [...]
apt-get -y install autofs

# 5-2 Configure the automounter so it mounts /home/USERNAME from the user's real home directory (on the NFS server). Make /home an indirect mount point - that is, the automounter will automatically mount subdirectories of /home, but not /home itself. You will probably need one line per user in the configuration file.
...

# (5-3 Verify that all users can log on to the client and that the correct home directories are mounted.)



