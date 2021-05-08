#!/bin/bash

#trap 'echo Usage: command \<github-username\>' ERR
#if [ $# != 1 ];then return 1;fi
#ghname=$1

for container in `cat ./lxc_server_list.txt`;do
    #lxc launch -p mvlprof ubuntu:f $container
    lxc launch ubuntu:f $container
done

# `ssh -t [lxd-host] lxc exec container bash` でいいなら以下は不要
# ip_tail=80
# for container in `cat ./lxc_server_list.txt`;do
#     echo "setting $container ip address..."
#     lxc network attach lxdbr0 $container eth0
#     lxc config device set $container eth0 ipv4.address 10.168.3.$ip_tail
#     ip_tail=$(( $ip_tail + 1 ))
# done

# for container in `cat ./lxc_server_list.txt`;do
#     echo restarting $container ...
#     lxc restart $container
# done

# # copy ssh key to containers
# # [bridge type] if access from another ssh client, use: ssh -t [lxd-host] ssh [container]
# for container in `cat ./lxc_server_list.txt`;do
#     #lxc exec $container -- ssh-import-id-gh $ghname
#     cat ~/.ssh/id_ed25519.pub | xargs -i% lxc exec $container -- bash -c 'echo % >> /{root,home/ubuntu}/.ssh/authorized_keys'
# done
