#!/bin/bash
keyURI=$1
keyName=`echo $keyURI | awk -F'/' '{print $(NF)}'`
curl $keyURI | gpg --dearmor > /usr/share/keyrings/$keyName
