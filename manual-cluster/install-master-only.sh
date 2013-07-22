
VERSION=hadoop-1.0.4
cd /usr/local/$VERSION/conf
rm masters
wget https://raw.github.com/ajehang/scripts/master/hadoop/conf/masters
rm slaves
wget https://raw.github.com/ajehang/scripts/master/hadoop/conf/slaves
su - hduser -c "/usr/local/hadoop/bin/hadoop namenode -format"

