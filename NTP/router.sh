#!/bin/bash

apt-get update
apt-get -y install ntp

cat ~/system-administration/NTP/files/\\etc\\ntp.conf > /etc/ntp.conf

apt-get -y install ufw
ufw allow from any to any port 123 proto udp

service ntp restart
