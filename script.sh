#!/bin/bash

scp -P 2220 ~/.ssh/id_rsa.pub root@127.0.0.1:.ssh/authorized_keys

# need to enter password

# ssh root@127.0.0.1 -p 2220


