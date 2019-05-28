#!/bin/sh

# edit motd
cat >/etc/motd <<EOL 
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMWNX0OOOOO0KNWMMMMMMMMMMMMMM
MMMMMMMMMWXOo:'....  ....;lxKWMMMMMMMMMM
MMMMMMMWOc. .    ..   ..    .:xXMMMMMMMM
MMMMMW0c.   .. ..........  ....,xNMMMMMM
MMMMNx'..   ........'... ... .. .cXMMMMM
MMMWd......  .   ..     ...  ..   :XMMMM
MMMO' .. ..  .';cll:;'.   .....    oWMMM
MMWl  ..  .,lO0XMMMWWN0l.  ......  ,KMMM
MMX:  ....xXNWXNMMMMMMMWO,   .  .. .OMMM
MMNc   . 'kWMMMMMWNNWWMMMk.      . '0MMM
MMWd.     .;looolco0XWMMMX:      ..:XMMM
MMMK:            .dWMMMMMWl     ..'kMMMM
MMMM0;            lWMMMMMWx.   ...xWMMMM
MMMMMKc.          lNMMMMMMk.    ;OWMMMMM
MMMMMMWO:.        lWMMMMMMO'  ,dXMMMMMMM
MMMMMMMMW0o;..    :0KK0kdoc;ckNMMMMMMMMM
MMMMMMMMMMMWKkdlc:cllllodx0NWMMMMMMMMMMM
MMMMMMMMMMMMMMMMMWWWWWMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM

Documentation: http://aka.ms/webapp-linux
Deno: https://github.com/denoland/deno
Deno Version : `deno version`
Deno Docker Countainer: https://github.com/hayd/deno_docker
EOL
cat /etc/motd

# start sshd
/usr/sbin/sshd

# make startup command
echo "/home/site/wwwroot/$@" > /opt/startup/startupCommand
STARTUPCOMMAND=$(cat /opt/startup/startupCommand)

# make options
OPTS=$(env | grep WEBSITE_DENO_ | sed -e "s/WEBSITE_DENO_\(.*\)=true/--\1 /" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ_/abcdefghijklmnopqrstuvwxyz-/" | tr -d "\n")

echo "Running deno run $OPTS $STARTUPCOMMAND"

# exec startup command
eval "exec deno run $OPTS $STARTUPCOMMAND" 