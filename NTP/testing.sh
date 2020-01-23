#!/bin/bash

# this script is to be run on the clients

# Checks if the client machine’s time is synchronized with NTP server. 
# The output should ideally show a time *offset* between the two systems.
ntpdate -q gw

# You can view the time synchronization queue by running the following command.
# You should be able to see gw.example.som as the time synchronization host/source in the queue.
ntpq -p | grep gw.example.com
