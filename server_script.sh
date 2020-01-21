#!/bin/bash

apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade

apt-get -y install bind9 bind9utils bind9-doc
apt-get -y install dnsutils

cat ~/system-administration/resources/server/\\etc\\network\\interfaces > /etc/network/interfaces
cat ~/system-administration/resources/server/\\etc\\bind\\named.conf > /etc/bind/named.conf
cat ~/system-administration/resources/server/\\etc\\bind\\named.conf.local > /etc/bind/named.conf.local
cat ~/system-administration/resources/server/\\etc\\bind\\for.dons.com > /etc/bind/for.dons.com
cat ~/system-administration/resources/server/\\etc\\bind\\rev.dons.com > /etc/bind/rev.dons.com
cat ~/system-administration/resources/server/\\etc\\resolv.conf > /etc/resolv.conf
cat ~/system-administration/resources/server/\\etc\\bind\\named.conf.options > /etc/bind/named.conf.options

apt-get update
/etc/init.d/bind9 restart
