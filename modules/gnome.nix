# modules/gnome.nix
{ config, pkgs, lib, ... }:

let
  dconfFile = ../dconf/gnome-settings.dconf;
in
{
  imports = [];
  
  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;
  services.desktopManager.gnome.enable = true;
   
  services.udev.packages = with pkgs; [ gnome-settings-daemon ];


}


