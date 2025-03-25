{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    bibata-cursors
    rose-pine-gtk-theme
    rose-pine-icon-theme
    dracula-qt5-theme
    oreo-cursors-plus
    ];
  
  gtk = {
    enable = true;
    font = {
      name = "Sans";
      size = 11;
    };
    theme = {
       name = "rose-pine";
       package = pkgs.rose-pine-gtk-theme;
#       name = "Dracula";
#       package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "rose-pine";
      package = pkgs.rose-pine-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "Dracula";
      package = pkgs.dracula-qt5-theme;
    };
  };

home.pointerCursor = {
    package = pkgs.oreo-cursors-plus;
    name = "oreo_spark_violet_cursors";
    size = 16;
    gtk.enable = true;
    x11.enable = true;
};
 
  dconf.settings = {
  "org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };
  };
}
