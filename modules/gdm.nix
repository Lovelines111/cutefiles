{ config, inputs,  pkgs, oldpkgs, ... }:

#GDM Settings
{
  # Enable GDM
  services.displayManager.gdm = {
      enable = true;
      wayland = true;
      banner = ''bigcomputer'';
      # package = inputs.oldpkgs.legacyPackages.x86_64-linux.gdm;
    };
}
