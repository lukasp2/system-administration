#!/bin/bash

# this script is to be run on the clients

# Checks if the client machine’s time is synchronized with NTP server. 
# The output should ideally show a time *offset* between the two systems.
NTPDATE=$(ntpdate -q gw | grep "server 10.0.0.1")
if [[ $NTPDATE == "" ]]; then
  echo "FAILED: ntpdate -q gw"
else
  echo "OK: ntpdate -q gw"
fi

# You can view the time synchronization queue by running the following command.
# You should be able to see gw.example.som as the time synchronization host/source in the queue.
NTPQ=$(ntpq -p | grep gw.example.com)
if [[ $NTPQ == "" ]]; then
  echo "FAILED: ntpq -p | grep gw.example.com"
else
  echo "OK: ntpq -p | grep gw.example.com"
fi
