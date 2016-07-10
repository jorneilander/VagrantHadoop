#!/bin/bash

HOSTNAME=`hostname -f`
IP=`ip addr | grep "inet.*enp0s3" | awk '{print $2}' | cut -d \/ -f 1`

nsupdate -v << EOF
server 10.1.0.2
update del $HOSTNAME A
update add $HOSTNAME 86400 A $IP
send
EOF