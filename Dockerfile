FROM codercom/code-server

#Install Unzip for shell scripts
RUN sudo apt-get install -y unzip 

#Install Terraform
ADD terraform.sh /
RUN sudo chmod +x /terraform.sh
RUN sudo /terraform.sh

#Install AWSCLI
ADD awscli.sh /
RUN sudo chmod +x /awscli.sh
RUN sudo /awscli.sh