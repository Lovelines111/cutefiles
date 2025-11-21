{pkgs, ... }:
{
    #This is for desktop cursor and most of the apps.
    environment.variables = {
        XCURSOR_SIZE = "18";
        XCURSOR_THEME = "Bibata-Modern-Ice";
    };

  # Make the cursor theme available system-wide
    environment.systemPackages = with pkgs; [
        bibata-cursors
    ];
}
