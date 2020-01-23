#!/bin/bash

apt-get -y install ntpdate

service ntp stop
ntpdate 10.0.0.1
service ntp start

timedatectl set-ntp off

apt-get -y install ntp
echo "server gw prefer iburst" > /etc/ntp.conf
service ntp restart
