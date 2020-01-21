#!/bin/bash

echo "1" > /proc/sys/net/ipv4/ip_forward

apt-get -y install iptables-persistent

/sbin/iptables -t nat -A POSTROUTING -o ens3 -j MASQUERADE
/sbin/iptables -A FORWARD -i ens3 -o ens4 -m state --state RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -A FORWARD -i ens4 -o ens3 -j ACCEPT

echo "dhclient ens3 -v" >> ~/.bashrc
echo "echo '1' > /proc/sys/net/ipv4/ip_forward" >> ~/.bashrc

# cat ~/system-administration/router/\\etc\\resolv.conf > /etc/resolve.conf

echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
