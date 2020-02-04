#!/bin/bash

apt-get -y install sshpass

# 4-2 Create /home1/ and /home2/ directories
mkdir /home1
mkdir /home2

# 4-2 Create two new users. Move one user's home directory to /home2/USERNAME and the other user's home directory to /home1/USERNAME.
useradd -m -G users -p password -b /home1 user1
useradd -m -G users -p password -b /home2 user2 

# [note] Ensure that no home directories remain in /home. Do not change the home directory location in the user database

# 5-3 Verify that all users can log on to the client and that the correct home directories are mounted.


# delete users
userdel -r user1
userdel -r user2
