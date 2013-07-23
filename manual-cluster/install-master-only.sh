#!/bin/bash
VERSION=hadoop-1.1.2
ssh-copy-id -i $HOME/.ssh/id_rsa.pub hduser@slave1
ssh-copy-id -i $HOME/.ssh/id_rsa.pub hduser@slave2
ssh-copy-id -i $HOME/.ssh/id_rsa.pub hduser@slave3
ssh-copy-id -i $HOME/.ssh/id_rsa.pub hduser@slave4
cd /usr/local/$VERSION/conf
rm masters
wget https://raw.github.com/ajehang/scripts/master/hadoop/conf/masters
rm slaves
wget https://raw.github.com/ajehang/scripts/master/hadoop/conf/slaves
su - hduser -c "/usr/local/hadoop/bin/hadoop namenode -format"

