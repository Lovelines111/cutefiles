{pkgs, ... }:
{
  networking = {
  hostName = "bigcomputer";
  wireless.enable = false;
  enableIPv6 = false;
  networkmanager.enable = true;
  networkmanager.dns = "none";
  # nameservers = [ "9.9.9.9" "9.9.9.11" ]; #DNS
  nameservers = [
   # "94.140.14.14"
   # "94.140.15.15"
   "1.1.1.1"
   # "2a10:50c0::ad1:ff"
   # "2a10:50c0::ad2:ff"
  ];

  dhcpcd.extraConfig = "nohook resolv.conf";
  };
  
  services.resolved.enable = false;

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
   networking.firewall.allowedTCPPorts = [ 22 10808 25565 55676];
   networking.firewall.allowedUDPPorts = [ 22 10808 25565 ];
   networking.firewall.trustedInterfaces = [ "tun0" ]; #allow vpn connection. I don't know what ports it's using so I had to go with the device.
   networking.firewall.enable = true;

  #  environment.variables = {
  #   # Force WebRTC to use proxy
  #   MOZ_DISABLE_WEBRTC = "0";
  # };
}
