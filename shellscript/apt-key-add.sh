#!/bin/bash
keyURI=$1

if [ $# -gt 1 ]; then
    keyName=$2
else
    keyName=`echo $keyURI | awk -F'/' '{print $(NF)}'`
fi

curl $keyURI | gpg --dearmor > /usr/share/keyrings/$keyName
