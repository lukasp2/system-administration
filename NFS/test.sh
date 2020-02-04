#!/bin/bash

apt-get -y install sshpass

# delete users and home dirs
rm -Rf /home1
rm -Rf /home2

userdel -r user1
userdel -r user2

# 4-2 Create /home1/ and /home2/ directories
mkdir /home1
mkdir /home2

# 4-2 Create two new users. Move one user's home directory to /home2/USERNAME and the other user's home directory to /home1/USERNAME.
useradd -m -G users -p password -b /home1 user1
useradd -m -G users -p password -b /home2 user2 

# [note] Ensure that no home directories remain in /home. Do not change the home directory location in the user database

# 5-3 Verify that all users can log on to the client and that the correct home directories are mounted.
USER1=$(cat /etc/passwd | grep user1 | cut -d ":" -f1,6)
USER2=$(cat /etc/passwd | grep user2 | cut -d ":" -f1,6)

if [[ $USER1 == "user1:/home1/user1" ]]; then
  echo "Home directory for user1 correct" 
else
  echo "Home directory for user1 is incorrect" 
fi

if [[ $USER2 == "user2:/home2/user2" ]]; then
  echo "Home directory for user2 correct" 
else
  echo "Home directory for user2 is incorrect" 
fi

su user1
USER=$(whoami)
if [[ $USER == user1 ]]; then
  echo "Successfully logged in to user1"
else
  echo "Could not log in to user1"
fi

su user2
USER=$(whoami)
if [[ $USER == user2 ]]; then
  echo "Successfully logged in to user2"
else
  echo "Could not log in to user2"
fi

su -

# delete users and home dirs
rm -Rf /home1
rm -Rf /home2

userdel -r user1
userdel -r user2


