#!/bin/bash

IMAGE='ubuntu:f'
PROFILE='mvlprof'
NAME=$(openssl rand -hex 5 | base64)
# Remove '='
NAME=${NAME//=/}
CMD='sudo -u ubuntu ssh-import-id-gh yassi-github'

lxc launch $IMAGE -p $PROFILE $NAME

IP=$(lxc list | grep $NAME | tr -s ' ' | cut -d'|' -f 4 | sed "s% %%g")
while [ -z $IP ];do
        echo -n '.'
        sleep .5
        IP=$(lxc list | grep $NAME | tr -s ' ' | cut -d'|' -f 4 | sed "s% %%g")
done

CHECKUSERCMD='bash -c "sudo -u ubuntu whoami 2>/dev/null"'
USERSTAT=$(bash -c "lxc exec $NAME -- $CHECKUSERCMD")
while [ "$USERSTAT" != 'ubuntu' ];do
        echo -n '.'
        sleep 1
        USERSTAT=$(bash -c "lxc exec $NAME -- $CHECKUSERCMD")
done
echo ""

lxc exec $NAME -- $CMD

echo "SSH: ssh ubuntu@${IP%(*}"
