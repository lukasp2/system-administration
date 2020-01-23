# run on local machine (only after NET, lab 1, has been finished)

# this script will set up ssh keys for the machines so that the router can access
# the other machines without having to enter a password. This way, you can clone 
# this git-repo to the router only, and from the router send all the files to the
# clients.

#!/bin/bash

# copy ssh key to router, you will need to enter the routers password for this 
scp -P 2220 ~/.ssh/id_rsa.pub root@127.0.0.1:.ssh/authorized_keys

# log in to router (no need for password anymore)
ssh root@127.0.0.1 -p 2220

# copy ssh key from router to server, you will need to enter the servers password for this 
scp ~/.ssh/id_rsa.pub root@10.0.0.2:.ssh/authorized_keys

# copy ssh key from router to client-1, you will need to enter the client-1 password for this 
scp ~/.ssh/id_rsa.pub client-1@10.0.0.3:.ssh/authorized_keys

# copy ssh key from router to client-2, you will need to enter the client-2 password for this 
scp ~/.ssh/id_rsa.pub client-2@10.0.0.4:.ssh/authorized_keys
