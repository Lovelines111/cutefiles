{pkgs, ...}:
{
  # This is for steam and vesktop kind of apps.
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 25;
    gtk.enable = true;
    x11.enable = true;
  };

  # This is for desktop and all.
  home.sessionVariables = {
    XCURSOR_SIZE = "25";
    XCURSOR_THEME = "Bibata-Modern-Ice";
  };

  # Some apps accept standalone cursor configuration.
  # This will override the configuration from this file.
}
