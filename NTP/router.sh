#!/bin/bash

apt-get update
apt-get -y install ntp

cat ~/system-administration/NTP/files/\\etc\\ntp.conf > /etc/ntp.conf



service ntp restart

