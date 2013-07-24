#!/bin/bash
MIRROR=http://www.gtlib.gatech.edu/pub/apache/hadoop/common/hadoop-1.1.2/
VERSION=hadoop-1.1.2

apt-get update
apt-get -y install openjdk-6-jdk

# set hostnames
echo "10.1.0.20    master" >> /etc/hosts
echo "10.1.0.75    slave1" >> /etc/hosts
echo "10.1.0.83    slave2" >> /etc/hosts
echo "10.1.0.130    slave3" >> /etc/hosts
echo "10.1.0.131    slave4" >> /etc/hosts

#download hadoop, untar, put in /usr/local
cd /tmp
wget "$MIRROR/$VERSION".tar.gz
tar -xzf "$VERSION".tar.gz
mv  $VERSION /usr/local
rm "$VERSION".tar.gz

# create user and group
addgroup hadoop
useradd  -G hadoop hduser -s /bin/bash -m

# app folder; who uses this ????
mkdir -p /app/hadoop/tmp
chown -R hduser.hadoop /app/hadoop/tmp
chmod 750 /app/hadoop/tmp

#modify hadoop-env
cd /usr/local/$VERSION/conf
echo "export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-amd64" >> hadoop-env.sh
echo "export HADOOP_OPTS=-Djava.net.preferIPv4Stack=true" >> hadoop-env.sh


#get configuration files
rm core-site.xml
wget https://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/manual-cluster/conf/core-site.xml
rm mapred-site.xml
wget https://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/manual-cluster/conf/mapred-site.xml
rm hdfs-site.xml
wget https://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/manual-cluster/conf/hdfs-site.xml

# chmod, symbolic links
cd /usr/local
ln -s $VERSION hadoop
chown -R hduser:hadoop $VERSION
chown hduser:hadoop $VERSION


#ssh stuff
su - hduser -c "echo | ssh-keygen -t rsa -P \"\""
cat /home/hduser/.ssh/id_rsa.pub >> /home/hduser/.ssh/authorized_keys
su - hduser -c "ssh -o StrictHostKeyChecking=no localhost echo "# login once, to add to known hosts

scp /home/hduser/.ssh/id_rsa.pub root@slave1:/root
scp /home/hduser/.ssh/id_rsa.pub root@slave2:/root
scp /home/hduser/.ssh/id_rsa.pub root@slave3:/root
scp /home/hduser/.ssh/id_rsa.pub root@slave4:/root

cd /usr/local/$VERSION/conf
rm masters
wget https://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/manual-cluster/conf/masters
rm slaves
wget https://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/manual-cluster/conf/slaves

