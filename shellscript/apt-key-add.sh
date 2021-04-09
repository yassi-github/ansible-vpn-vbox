#!/bin/bash
keyURI=$1

if [ $# -gt 1 ]; then
    keyName=$2
else
    keyName=`echo $keyURI | awk -F'/' '{print $(NF)}'`
fi

trap 'wget -O- $keyURI | gpg --dearmor > /usr/share/keyrings/$keyName' ERR

curl $keyURI | gpg --dearmor > /usr/share/keyrings/$keyName
