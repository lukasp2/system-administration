#!/bin/bash

echo "1" > /proc/sys/net/ipv4/ip_forward

apt-get -y install iptables-persistent

echo "/sbin/iptables -t nat -A POSTROUTING -o ens3 -j MASQUERADE" >> ~/.bashrc
echo "/sbin/iptables -A FORWARD -i ens3 -o ens4 -m state --state RELATED,ESTABLISHED -j ACCEPT" >> ~/.bashrc
echo "/sbin/iptables -A FORWARD -i ens4 -o ens3 -j ACCEPT" >> ~/.bashrc

echo "dhclient ens3 -v" >> ~/.bashrc
echo "echo '1' > /proc/sys/net/ipv4/ip_forward" >> ~/.bashrc

echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

source ~/.bashrc
