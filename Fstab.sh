#!/bin/bash
D=`date +%Y%m%d`
mkdir /interfaces
mount -t nfs4 10.204.66.110:/interfaces /interfaces
cp -prf /etc/fstab /etc/fstab_$D
echo "10.204.66.110:/interfaces	/interfaces	nfs4    nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,_netdev,noresvport        0       0" >> /etc/fstab 

