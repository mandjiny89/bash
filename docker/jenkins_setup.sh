#!/bin/bash
#Running Jenkins in docker container, it will create a jenkins folder and jenkins container 

STATUS_CHECK=`sudo systemctl status docker |grep active |cut -c12-17`

if [[ STATUS_CHECK  -eq active ]]
then 
  sudo docker volume create jenkins_volume
  sudo docker run -dit --restart always --name jenkins_master -v jenkins_volume:/somefolder -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
else 
	echo "Docker is not running"
fi

