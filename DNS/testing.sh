#!/bin/bash

echo "Testing $ dig dons.com"
dig dons.com

echo "Testing $ dig -x 10.0.0.2"
dig -x 10.0.0.2

echo "Testing $ dig +short @dons.com porttest.dns-oarc.net TXT"
dig +short @dons.com porttest.dns-oarc.net TXT

echo "Checking the DNS configuration files"
echo "if nothing is printed below, it means DNS configuration is valid."
named-checkconf /etc/bind/named.conf
named-checkconf /etc/bind/named.conf.local

echo "Checking the zone files, these commands should return two lines each, the last one 'OK'."
named-checkzone dons.com /etc/bind/for.dons.com
named-checkzone dons.com /etc/bind/rev.dons.com
