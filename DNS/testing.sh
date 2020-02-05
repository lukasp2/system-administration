#!/bin/bash

echo "Testing $ dig dons.com"
DNS=$(dig dons.com | grep -A 1 "ANSWER SECTION:" | grep -o "10.0.0.2")

if [[ $DNS == "10.0.0.2" ]]; then
  echo "OK: dig dons.com"
else
  echo "FAILED: dig dons.com"
fi

echo "Testing $ dig -x 10.0.0.2"
DNS=$(dig -x 10.0.0.2 | grep -A 1 "ANSWER SECTION:" | grep -o "pri.dons.com")

if [[ $DNS == "pri.dons.com" ]]; then
  echo "OK: dig -x 10.0.0.2"
else
  echo "FAILED: dig -x 10.0.0.2"
fi

echo "Testing DNS configuration files"
OUTPUT=$(named-checkconf /etc/bind/named.conf)
if [[ $OUTPUT == "" ]]; then
  echo "OK: named-checkconf /etc/bind/named.conf"
else
  echo "FAILED: named-checkconf /etc/bind/named.conf"
fi

OUTPUT=$(named-checkconf /etc/bind/named.conf.local)
if [[ $OUTPUT == "" ]]; then
  echo "OK: named-checkconf /etc/bind/named.conf.local"
else
  echo "FAILED: named-checkconf /etc/bind/named.conf.local"
fi

OUTPUT=$(named-checkzone dons.com /etc/bind/for.dons.com | tail -n 1)
if [[ $OUTPUT == "OK" ]]; then
  echo "OK: named-checkzone dons.com /etc/bind/for.dons.com"
else
  echo "FAILED: named-checkzone dons.com /etc/bind/for.dons.com"
fi

OUTPUT=$(named-checkzone dons.com /etc/bind/rev.dons.com | tail -n 1)
if [[ $OUTPUT == "OK" ]]; then
  echo "OK: named-checkzone dons.com /etc/bind/rev.dons.com"
else
  echo "FAILED: named-checkzone dons.com /etc/bind/rev.dons.com"
fi
