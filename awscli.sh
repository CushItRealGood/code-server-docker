#!/bin/bash
sudo apt-get update
sudo apt-get install -y groff # groff needed for aws help pages
cd /home/coder
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/home/coder/awscliv2.zip"
sudo unzip /home/coder/awscliv2.zip
cd /home/coder/aws
sudo ./install
sudo rm /home/coder/awscliv2.zip