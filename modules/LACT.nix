{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lact
  ];

  systemd.services.lact-daemon = {
   description = "LACT Daemon Service";
   wantedBy = [ "multi-user.target" ];
   serviceConfig = {
     ExecStart = "${pkgs.lact}/bin/lact daemon";
     Restart = "always";
     # Environment = [
     #   "LD_LIBRARY_PATH=${pkgs.linuxPackages.nvidia_x11}/lib:/run/opengl-driver/lib"
     # ];
   };
 };
}
