#!/bin/bash

apt-get update
apt-get upgrade
apt-get -y install nis

cat ~/system-administration/NIS/files/\\etc\\default\\nis > /etc/default/nis 
cat ~/system-administration/NIS/files/\\etc\\ypserv.securenets > /etc/ypserv.securenets 

sed -i 's/MERGE_PASSWD=false/MERGE_PASSWD=true/g' /var/yp/Makefile
sed -i 's/MERGE_GROUP=false/MERGE_GROUP=true/g' /var/yp/Makefile

/usr/lib/yp/ypinit -m

systemctl restart nis
