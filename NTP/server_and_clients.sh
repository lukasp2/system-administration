#!/bin/bash

apt-get -y install ntpdate

timedatectl set-ntp off

apt-get -y install ntp
