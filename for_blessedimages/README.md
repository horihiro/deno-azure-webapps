# How to run Deno for App Service on Linux

1. Select an application stack other than `Java` and `Ruby`
  ![](../appstacks.png)
1. Upload `deno.sh` and ts files to your WebApp via FTP etc.
1. Set `sh /PATH/TO/deno.sh` to `Startup Command` and save configurations
  ![](../startupscript.png)

Then you can see the following screen when opening WebSSH.
  ![](../denowebssh.png)
