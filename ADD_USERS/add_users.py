
#!/usr/bin/python
import time
import sys
import subprocess
import string
import os
from random import randint
import random

def create_users(file):
  #f = open(file, 'r')
  names = [line.strip('\n') for line in open(file, 'r')]

  for name in names:
    if name != '':
      create_user(name)
      
  bash = "exportfs -v -r"
  output = os.popen(bash).read()
  time.sleep(0.2)  
  
  bash = "make -C /var/yp"
  os.popen(bash).read()

def create_user(name):
  name = name.lower().split()
  fname = name[0][0:3]
  lname = name[1][0:2]

  username = fname + lname
  username = generate_numbers(username)
  password = ''.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(8))

  print "added user:"
  print "name:\t", name[0], name[1]
  print "id:\t", username
  print "pswd:\t", password
  print '\n'
  create_home(name, username, password)
  
def generate_numbers(username):
  bash = "grep -oE ^" + username + "[0-9]{3} /etc/passwd | sort -r | head -n 1"
  output = os.popen(bash).read()
  
  if (output == ''):
    username = username + "000"
  else:
    username = username + (str(int(output[5:8]) + 1))

  return username

def create_home(name, username, password):
  #bash = "adduser " + username + " --no-create-home" + " --gecos '" + name + "' --disabled-password"
  home_str = str(randint(1,2))
  bash = "useradd -m -G users -p " + password + " -b /home" + home_str + " " + username
  output = os.popen(bash).read()

  time.sleep(2)
  print("User created for ", name[0], name[1], ":")
  print("username: ", username)
  print("and password: ", password)

  bash = "mkdir /home" + home_str + "/" + username
  output = os.popen(bash).read()

  #time.sleep(0.2)
  #bash = "echo " + username + ":" + password + " | chpasswd"
  #output = os.popen(bash).read()
  
  time.sleep(0.2)
  bash = "chown " + username + ":" + username + " /home" + home_str + "/" + username
  output = os.popen(bash).read()
  
  time.sleep(0.2)
  bash = "chmod 700 /home" + home_str + "/" + username    
  output = os.popen(bash).read()
  
  time.sleep(0.2)
  with open("/etc/auto.home", "a") as myfile:
      myfile.write(username + " -fstype=nfs,nfsvers=3,rw,sync server:/home" + home_str + "/" + username + "\n")

## MAIN ##
if (len(sys.argv) != 2):
  print("usage: python add_user.py <filename>") 
else:
  create_users(sys.argv[1])

