#!/bin/bash

apt-get update
apt-get upgrade
apt-get -y install nis

echo "domain example.com server server.example.com" > /etc/yp.conf

