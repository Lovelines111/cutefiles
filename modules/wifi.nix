{ config, pkgs, lib, ... }:

{
  
  # general networking config
  networking = {
    hostName = "bigcomputer";
    nameservers = [ "9.9.9.9" "9.9.9.11" ]; #DNS
    dhcpcd.extraConfig = "nohook resolv.conf";
    interfaces.wlan0.useDHCP = true; #idk if it even works tbh
    enableIPv6 = false;
    networkmanager = {
      enable = true;
      dns = "none";
      unmanaged = [ "wlan0" ]; # move wifi to WPA
    };
  };
  services.resolved.enable = false;

#   services.avahi = {
#   enable = true;
#   nssmdns = true;  # Enable mDNS name resolution
#   publish.enable = true; # Allow device discovery
# };

  # wifi settings
  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    interfaces = ["wlan0"];
    networks."AGP-Router".psk = "774c!84838757A120489"; #my password
    networks."MGTS_GPON_AA86".psk = "nashumnombregeirtisha";
    extraConfig = "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=wheel";
  };


# udev rule to rename the adapter so I can predictibly configure it.
  services.udev.extraRules = ''
  ACTION=="add", SUBSYSTEM=="usb", ATTR{power/autosuspend}="-1"
  ACTION=="add", SUBSYSTEM=="net", ATTR{address}=="3a:ca:c9:12:fe:65", NAME="wlan0"
'';
}

