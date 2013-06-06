# make a new directory
add-apt-repository -y ppa:juju/pkgs
apt-get update 
apt-get install juju lxc apt-cacher-ng libzookeeper-java zookeeper
ssh-keygen -t rsa
juju bootstrap
sed -i "s/ec2/local/" ~/.juju/environments.yaml
echo "    data-dir: /root/hcontainers" >> ~/.juju/environments.yaml
mkdir /root/hcontainers
juju bootstrap
juju deploy hadoop hadoop-master
juju deploy hadoop hadoop-slavecluster
juju add-unit -n 1 hadoop-slavecluster
juju add-relation hadoop-master:namenode hadoop-slavecluster:datanode
juju add-relation hadoop-master:jobtracker hadoop-slavecluster:tasktracker
juju debug-log
