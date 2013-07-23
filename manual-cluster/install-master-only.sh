#!/bin/bash
#run as hduser
VERSION=hadoop-1.1.2
scp /home/hduser/.ssh/id_rsa.pub root@slave1:/root
scp /home/hduser/.ssh/id_rsa.pub root@slave2:/root
scp /home/hduser/.ssh/id_rsa.pub root@slave3:/root
scp /home/hduser/.ssh/id_rsa.pub root@slave4:/root
cd /usr/local/$VERSION/conf
rm masters
wget https://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/manual-cluster/conf/masters
rm slaves
wget https://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/manual-cluster/conf/slaves
#cd
#hadoop namenode -format

