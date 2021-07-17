#!/bin/bash
keyURI=$1

if [ $# -gt 1 ]; then
    keyName=$2
else
    keyName=`echo $keyURI | awk -F'/' '{print $(NF)}'`
fi

# 拡張子がない場合 or 拡張子がgpgでない場合は、gpg拡張子を追加する。
if [ $(echo $keyName | awk -F'.' '{print $(NF)}') = $keyName ] \
    || [ $(echo $keyName | awk -F'.' '{print $(NF)}') != 'gpg' ]; then
        keyName=${keyName}.gpg
fi

trap 'wget -O- $keyURI | gpg --dearmor > /usr/share/keyrings/$keyName' ERR

curl $keyURI | gpg --dearmor > /usr/share/keyrings/$keyName
