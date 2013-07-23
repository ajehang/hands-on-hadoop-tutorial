#!/bin/bash
#run as hduser
VERSION=hadoop-1.1.2
ssh-copy-id -i $HOME/.ssh/id_rsa.pub hduser@slave1
ssh-copy-id -i $HOME/.ssh/id_rsa.pub hduser@slave2
ssh-copy-id -i $HOME/.ssh/id_rsa.pub hduser@slave3
ssh-copy-id -i $HOME/.ssh/id_rsa.pub hduser@slave4
cd /usr/local/$VERSION/conf
rm masters
wget https://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/manual-cluster/conf/masters
rm slaves
wget https://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/manual-cluster/conf/slaves
#cd
#hadoop namenode -format

