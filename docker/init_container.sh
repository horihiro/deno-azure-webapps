#!/bin/sh

# edit motd
cat >/etc/motd <<EOL 
     _
    | |
  __| |  ___  _ __    ___
 / _` | / _ \| '_ \  / _ \
| (_| ||  __/| | | || (_) |
 \__,_| \___||_| |_| \___/

Documentation: http://aka.ms/webapp-linux
Deno: https://github.com/denoland/deno
`deno version | sed -E "s/^/  /"`
This container: https://github.com/horihiro/deno
  base on Deno Countainer: https://github.com/hayd/deno_docker
EOL
cat /etc/motd

# start sshd
/usr/sbin/sshd

# make startup command
if [ $# -ne 0 ]; then
  echo "/home/site/wwwroot/$@" > /opt/startup/startupCommand
else
  echo "/home/site/wwwroot/default.ts" > /opt/startup/startupCommand
fi
STARTUPCOMMAND=$(cat /opt/startup/startupCommand)

echo "Running deno run -A $STARTUPCOMMAND"

# exec startup command
export DENO_HOME=/home/site/wwwroot
eval "exec deno run -A $STARTUPCOMMAND" 