{pkgs, inputs, oldpkgs, ... }:
{
  #install the packages
  environment.systemPackages = with pkgs; [
    v2raya
    # xray
    # inputs.oldpkgs.legacyPackages.x86_64-linux.xray
    xray
    #xray 25.2.21 is working. modern xray is not!!! idk why bitch, they made some DNS changes and I think V2rayA hasn't cought up yet.
  ];
  
  # systemd.services.v2raya = {
    # description = "v2rayA system service";
    # wantedBy = [ "multi-user.target" ];
    # after = [ "network-online.target" ];
    # requires = [ "network-online.target" ];

    # serviceConfig = {
    #   ExecStart = "${pkgs.sudo}/bin/sudo ${pkgs.v2raya}/bin/v2rayA";
    #   User = "root";
    #   Group = "root";
    #   Restart = "on-failure";
    #   Environment = "PATH=${pkgs.v2ray}/bin:${pkgs.v2raya}/bin:/run/current-system/sw/bin";
    #   };
  # };

  services.v2raya = {
    enable = true;
    package = pkgs.v2raya;
    # cliPackage = inputs.oldpkgs.legacyPackages.x86_64-linux.xray;  #important!!!
    cliPackage = pkgs.xray;
  };

  # Delay v2raya startup until network is fully available
  systemd.services.v2raya = {
    after = [ "network-online.target" "systemd-resolved.service" ];
    # wants = [ "network-online.targetd" ];
    wants = [ "network-online.target" "systemd-resolved.service" ];
    serviceConfig = {
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
  
}
