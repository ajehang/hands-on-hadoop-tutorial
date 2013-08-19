#!/bin/bash
MIRROR=http://apache.osuosl.org/hbase/hbase-0.94.10/
VERSION=hbase-0.94.10

#download hadoop, untar, put in /usr/local
cd /tmp
wget "$MIRROR/$VERSION".tar.gz
tar -xzf "$VERSION".tar.gz
mv  $VERSION /usr/local
rm "$VERSION".tar.gz

# app folder; who uses this ????
#mkdir -p /app/hadoop/tmp
#chown -R hduser.hadoop /app/hadoop/tmp
#chmod 750 /app/hadoop/tmp

#modify hadoop-env
cd /usr/local/$VERSION/conf
echo "export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-amd64" >> hbase-env.sh

#get configuration files
rm hbase-site.xml
wget https://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/manual-cluster/conf/hbase-site.xml
rm regionservers
wget https://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/manual-cluster/conf/regionservers
# chmod, symbolic links
cd /usr/local
ln -s $VERSION hbase
chown -R hduser:hadoop $VERSION
chown hduser:hadoop $VERSION

cd /usr/local/hbase/lib

cp /usr/local/hadoop/hadoop-core-1.1.2.jar .
chmod +wx hadoop-core-1.1.2.jar 
rm hadoop-core-1.0.4.jar

echo "export HBASE_MANAGES_ZK=true" >>hbase-env.sh

#cd /home/hduser/
#wget https://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/manual-cluster/conf/.bashrc

#mv .bashrc.1 .bashrc
