#!/bin/bash

apt-get update
apt-get -y upgrade
apt-get -y install nis

cat ~/system-administration/NIS/files/\\etc\\default\\nis > /etc/default/nis 
cat ~/system-administration/NIS/files/\\etc\\ypserv.securenets > /etc/ypserv.securenets 

#sed -ir 's/^/d./d./d./d $/MERGE_PASSWD=true/g' /var/yp/Makefile
sed -ir 's/^MERGE_PASSWD=.*$/MERGE_PASSWD=true/g' /var/yp/Makefile
sed -ir 's/^MERGE_GROUP=.*$/MERGE_GROUP=true/g' /var/yp/Makefile

/usr/lib/yp/ypinit -m

systemctl restart nis
