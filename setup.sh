#!/bin/bash
INTERFACE_NAME=$(ip a | grep UP | grep BROADCAST | awk '{print $2}' | cut -d':' -f1 | head -n1)
IPADDRESS=$(ip r | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | tail -1)
HOST_NAME=$(hostname)
echo "$IPADDRESS   $HOST_NAME" >> /etc/hosts

sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
