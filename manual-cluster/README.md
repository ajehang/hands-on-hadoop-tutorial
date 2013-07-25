For openStack open tcp port e.g 54310, 60000, 60010, 60020, 60030, 50010, 2888, 3888, 50020, 50030, 50075, 50090, 50105, 50060, 8020,  2181
etc.

example: /etc/hosts

127.0.0.1  localhost
#127.0.0.1	slave2 ubuntu

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
10.1.0.20    master
10.1.0.75    slave1
10.1.0.83    slave2
10.1.0.130   slave3
10.1.0.131   slave4
