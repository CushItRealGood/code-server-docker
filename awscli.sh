#!/bin/bash
cd /home/coder
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/home/coder/awscliv2.zip"
sudo unzip /home/coder/awscliv2.zip
#sudo /aws/install #not sure why docker build doesnt like this trying this instead:
pwd
ls -latr
pwd
cd /home/coder/aws
sudo ./install
sudo rm /home/coder/awscliv2.zip