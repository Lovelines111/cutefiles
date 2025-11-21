{pkgs, inputs, ... }:
{
 
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    rootless = {
      enable = false;
      setSocketVariable = false;
    };
  };

  users.users.luvelyne.extraGroups = [ "docker" ];
  
}
