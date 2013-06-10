hands-on-hadoop-tutorial
========================

My hadoop tutorial for service computing

1. Crate a OpenStack image name=Ubuntu 12.04 LTS Desktop x64 flavor=m1.medium
2. open terminal in newly created VM
3. wget -o /dev/null http://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/install.sh
4. wget -o /dev/null http://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/lxc-ip.sh
4. chmod +x *.sh
5. ./install.sh
6. Open VNC session for MapR Virtual Machine
7. Open a terminal window inside MapR and determine your public-address of hadoop-master/0 using ./lxc-ip.sh
8.  ssh into your hadoop master node container e.g
    ssh ubuntu@x.x.x.x (x=ip address obtained in step 9)
9. wget -o /dev/null http://github.com/ajehang/hands-on-hadoop-tutorial/raw/master/script.sh
10. chmod +x script.sh
11. ./script.sh
    
