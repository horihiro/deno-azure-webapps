#!/bin/sh

# edit motd
cat > /etc/motd <<EOL
    #&        #&          &&        && 
&        #&          &&        &&      
&   #&   #&   #&     &&   &&   &&   && 
    #&     @@@@@@@@@@@@&, &&        && 
#   #&  @@ @@@@ @@@@@@@@@@##   ##   && 
&     @@@@@@@@@@@@@@@@@@@@@@&, &&      
&     @@@@@@@@@@@@@@@ &@@@@@&, &&      
&   #&  @@@@@@@@@@@ &@@@@@@@&, &&   && 
    #&        (#   %@@@@@@@@&,      && 
&   #&   #&   #&   %@@@@@@@@&, &&   && 
&        #&        %@@@@@@@@&, &&      
&   (#   #&   (#   %@@@@@@@@&, &&   ## 
    #&        #&   %@@@@@@@@&,      && 
    #&        #&   %@@@@@@@@&,      && 
  ____
 |  _ \  ___ _ __   ___
 | | | |/ _ \ '_ \ / _ \\
 | |_| |  __/ | | | (_) |
 |____/ \___|_| |_|\___/  on Azure App Service

Deno: https://deno.land/
EOL

# install deno
curl -fsSL "https://deno.land/x/install/install.sh" | sh -s v0.24.0

echo "export DENO_INSTALL=\"$HOME/.local\"" >> $HOME/.bashrc
echo "export PATH=\"\$DENO_INSTALL/bin:\$PATH\"" >> $HOME/.bashrc

. $HOME/.bashrc

deno version | sed -E "s/^/  /" >> /etc/motd
echo >> /etc/motd

# execute deno
deno run --allow-net /home/site/wwwroot/example.ts -p $PORT