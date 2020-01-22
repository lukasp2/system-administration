#!/bin/bash

apt-get update
apt-get -y upgrade

cat ~/system-administration/DNS/server/\\etc\\resolv.conf > /etc/resolv.conf

#mkdir /etc/bind/
#cat ~/system-administration/DNS/server/\\etc\\bind\\named.conf > /etc/bind/named.conf
#cat ~/system-administration/DNS/server/\\etc\\bind\\named.conf.options > /etc/bind/named.conf.options

mkdir -p /etc/resolvconf/resolv.conf.d/
echo "domain dons.com" > /etc/resolvconf/resolv.conf.d/base
echo "10.0.0.2" > /etc/resolvconf/resolv.conf.d/base

ifdown ens3; ifup ens3


