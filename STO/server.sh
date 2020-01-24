#!/bin/bash

# 10-1 Use RAID 1 to create a device on which you place an ext2 file system optimized for many small files, that you mount 
# as /home1 on the server. Make sure that /home1 is correctly mounted at boot.

mdadm --create --verbose --level=1 --metadata=1.2 --raid-devices=2 /dev/md1 /dev/vda /dev/vdb

mkdir /home1

mkfs.ext2 -b 1024 /dev/md1

echo "UUID=xxx /home1 ext2 defaults 0 1" >> /etc/fstab

mount /home1

# 10-2 Use LVM to create a device on which you place an ext2 file system optimized for a smaller number of large files, 
# that you mount as /home2 on the server. Make sure that /home2 is correctly mounted at boot.

pvcreate /dev/vd{c,d}

vgcreate -s 4K vg1 /dev/vdc /dev/vdd

lvcreate -l 100%FREE vg1 -n home2

mkdir /home2

mkfs.ext2 -b 4096 /dev/vg1/home2

echo "/dev/vg1/home2 /home2 ext2 defaults 0 1" >> /etc/fstab

mount /home2
