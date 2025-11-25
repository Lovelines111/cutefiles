{ config, pkgs, ... }:

{
   # Install Steam and necessary dependencies
  environment.systemPackages = with pkgs; [
     steam-run
     vulkan-tools
     vkbasalt
     vkbasalt-cli
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports for Remote Play
    dedicatedServer.openFirewall = true; # Open ports for dedicated servers
    gamescopeSession.enable = true; # Enable Gamescope session (optional)
  };

  # Enable hardware support for gaming
  hardware.graphics = {
    
    extraPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    
    ];

    extraPackages32 = with pkgs.driversi686Linux; [
     mesa
    ];

   


  };

  # Optional: Enable gamemode for better gaming performance
  programs.gamemode.enable = true;

}
