hands-on-hadoop-tutorial
========================

My hadoop tutorial for service computing

1. Crate a OpenStack image name=Ubuntu 12.04 LTS Desktop x64 flavor=m1.medium
3. open terminal in newly created VM
4. wget -o /dev/null http://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/install.sh
5. chmod +x install.sh
6. ./install.sh
7. Open VNC session for MapR Virtual Machine
8. Open a terminal window inside MapR and determine your public-address of hadoop-master/0 using juju status
9.  ssh into your hadoop master node container e.g
    ssh ubuntu@x.x.x.x (x=ip address obtained in step 8)
10. wget -o /dev/null http://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/script.sh

    
