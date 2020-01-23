#!/bin/bash

apt-get -y install nis

cat ~/system-administration/NIS/files/\\etc\\default\\nis > /etc/default/nis 
cat ~/system-administration/NIS/files/\\etc\\ypserv.securenets > /etc/ypserv.securenets 
