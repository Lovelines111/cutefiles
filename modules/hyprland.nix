{ pkgs, ...}:
{
  # programs.hyprland.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };

  # environment.systemPackages = with pkgs; [
  #   kitty
  #   nautilus
  #   fuzzel
  #   wl-clipboard
  #   swww
  #   slurp
  #   grim
  #   swappy
  #   imv
  #   jq
  #   libnotify
  #   pavucontrol
  #   # xdg-desktop-portal-hyprland
  #   # networkmanagerapplet    
  # ];

  #For screen caprute
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    xdgOpenUsePortal = false;
    # extraPortals = with pkgs; [ xdg-desktop-portal-gnome ];
    extraPortals = [
      # pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

}
