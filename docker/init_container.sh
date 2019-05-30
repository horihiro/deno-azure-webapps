#!/bin/sh

# edit motd
cat >/etc/motd <<EOL 
     _
    | |
  __| |  ___  _ __    ___
 / _\` | / _ \| '_ \  / _ \\
| (_| ||  __/| | | || (_) |
 \__,_| \___||_| |_| \___/

Deno: https://github.com/denoland/deno
`deno version | sed -E "s/^/  /"`
Web App for Containers: https://azure.microsoft.com/ja-jp/services/app-service/containers/

EOL
cat /etc/motd

# start sshd
/usr/sbin/sshd

# make startup command
if [ $# -ne 0 ]; then
  echo "/home/site/wwwroot/$@" > /opt/startup/startupCommand
else
  echo "/opt/startup/default.ts" > /opt/startup/startupCommand
fi
STARTUPCOMMAND=$(cat /opt/startup/startupCommand)

echo "Running deno run -A $STARTUPCOMMAND"

# exec startup command
export DENO_HOME=/home/site/wwwroot
eval "exec deno run -A $STARTUPCOMMAND" 