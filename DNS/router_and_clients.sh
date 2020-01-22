#!/bin/bash

apt-get update
apt-get -y upgrade

cat ~/system-administration/DNS/server/\\etc\\resolv.conf > /etc/resolv.conf
cat ~/system-administration/DNS/server/\\etc\\bind\\named.conf.options > /etc/bind/named.conf.options
