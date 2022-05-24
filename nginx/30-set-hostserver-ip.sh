#!/bin/sh

HOST_IP=`hostname -I | sed 's/.[0-9]*\s*$/.1/'`
grep -q "hostserver" /etc/hosts || echo "$HOST_IP hostserver" >> /etc/hosts
