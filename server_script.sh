#!/bin/bash

apt-get update && upgrade && dist-upgrade

apt-get install bind9 bind9utils bind9-doc
apt-get install dnsutils

cat ./server/\etc\network\interfaces > /etc/network/interfaces
cat ./server/\etc\bind\named.conf.local > /etc/bind/named.conf.local
cat ./server/\etc\bind\for.dons.com > /etc/bind/for.dons.com
cat ./server/\etc\bind\rev.dons.com > /etc/bind/rev.dons.com
cat ./server/\etc\resolv.conf > /etc/resolv.conf
cat ./server/\etc\bind\named.conf.options > /etc/bind/named.conf.options

apt-get update
/etc/init.d/bind9 restart
