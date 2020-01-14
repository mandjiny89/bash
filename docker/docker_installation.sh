#!/bin/bash

#If docker already present in the system than remove 
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

# Install the prerequists 
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# Setup the repo to install Docker 
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install epel-release

# Docker installation 
sudo yum install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker

echo "Docker installation completed successfully"
