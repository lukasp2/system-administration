#!/bin/bash

apt-get update
apt-get -y upgrade

cat ~/system-administration/DNS/server/\\etc\\resolv.conf > /etc/resolv.conf

ifdown ens3; ifup ens3


