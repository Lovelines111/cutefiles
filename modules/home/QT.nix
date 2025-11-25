{ config, pkgs, lib, ... }:

{
  # Qt configuration with Kvantum
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  # Install Kvantum and Gruvbox theme
  home.packages = with pkgs; [
    # Kvantum theme engine
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
    
    # Kvantum manager for theme configuration
    # libsForQt5.kvantum
    
    # Gruvbox Kvantum theme
    (gruvbox-kvantum.override { variant = "Gruvbox-Dark-Brown"; })
  ];

  # Set environment variables for Kvantum
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "kvantum";
    QT_STYLE_OVERRIDE = "kvantum";
  };

  # Set Gruvbox-Dark-Brown as the default Kvantum theme
  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=Gruvbox-Dark-Brown
  '';
}
