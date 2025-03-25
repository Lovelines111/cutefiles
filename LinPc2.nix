{ inputs, config, pkgs, ... }:
{

services.xray.enable = true;
#services.xray.settingsFile = /etc/xray/config.json;  #Yeda NL
#services.xray.settingsFile = /etc/xray/beetle-de.json; #Beetle-DE
#services.xray.settingsFile = /etc/xray/beetle-FI.json; #Beetle-FI
#services.xray.settingsFile = /etc/xray/paper.json;
#services.xray.settingsFile = /etc/xray/chat.json;
#services.xray.settingsFile = /etc/xray/yeda-21.json;  #last working
#services.xray.settingsFile = /home/luvelyne/xraycfgs/yeda-21.json;
#services.xray.settingsFile = /etc/xray/yeda-22.json;
#services.xray.settingsFile = /home/luvelyne/xraycfgs/yeda-23.json;
#services.xray.settingsFile = /etc/xray/udp-test-2.json;
#services.xray.settingsFile = /home/luvelyne/cutefiles/NOvpn.json;
#services.xray.settingsFile = /home/luvelyne/xraycfgs/Dacha-21.json;
services.xray.settingsFile = /home/luvelyne/xraycfgs/Yeda-3.json;


}
