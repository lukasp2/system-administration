#!/bin/bash

apt-get -y install nis

cat ~/system-administration/NIS/files/\\etc\\default\\nis > /etc/default/nis 
