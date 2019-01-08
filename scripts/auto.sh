#!/bin/bash

host=$1
passwd=$2
echo host: $host
echo pwd: $passwd

sshpass -p $passwd ssh root@$host "uname -a"
