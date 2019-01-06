#!/bin/sh

# edit motd
cat >/etc/motd <<EOL 
  _____                               
  /  _  \ __________ _________   ____  
 /  /_\  \\___   /  |  \_  __ \_/ __ \ 
/    |    \/    /|  |  /|  | \/\  ___/ 
\____|__  /_____ \____/ |__|    \___  >
        \/      \/                  \/ 
A P P   S E R V I C E   O N   L I N U X
Documentation: http://aka.ms/webapp-linux
NodeJS quickstart: https://aka.ms/node-qs
NodeJS Version : `node --version`
EOL
cat /etc/motd

# start sshd
/usr/sbin/sshd

# make startup command
echo "/home/site/wwwroot/$@" > /opt/startup/startupCommand
STARTUPCOMMAND=$(cat /opt/startup/startupCommand)
echo "Running deno $STARTUPCOMMAND"

# exec startup command
eval "exec deno $STARTUPCOMMAND" 