#!/bin/bash

apt-get update
apt-get -y upgrade

mkdir /etc/bind/

cat ~/system-administration/DNS/server/\\etc\\resolv.conf > /etc/resolv.conf
cat ~/system-administration/DNS/server/\\etc\\bind\\named.conf > /etc/bind/named.conf
cat ~/system-administration/DNS/server/\\etc\\bind\\named.conf.options > /etc/bind/named.conf.options

ifdown ens3; ifup ens3


