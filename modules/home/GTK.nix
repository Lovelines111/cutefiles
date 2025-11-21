{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    #bibata-cursors
    # rose-pine-gtk-theme
    #rose-pine-icon-theme
    # dracula-qt5-theme
    # oreo-cursors-plus
    adwaita-icon-theme
    
    ];
  
  # gtk = {
  #   enable = true;
  #   font = {
  #     name = "Sans";
  #     size = 11;
  #   };
  #   theme = {
  #      # name = "rose-pine";
  #      # package = pkgs.rose-pine-gtk-theme;
  #     name = "Dracula";
  #     package = pkgs.dracula-theme;
  #   };
  # };
  # qt = {
  #   enable = true;
  #   platformTheme.name = "gtk";
  #   style = {
  #     name = "Dracula";
  #     package = pkgs.dracula-qt5-theme;
  #   };
  # };




  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/peripherals/mouse" = {
      speed = -0.75;  
      accel-profile = "flat";  
    };
  };


}
