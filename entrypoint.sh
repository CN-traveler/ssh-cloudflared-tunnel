#!/bin/bash

echo "root:$1" | chpasswd
cloudflared service install $2
service ssh start
tail -f /var/log/alternatives.log