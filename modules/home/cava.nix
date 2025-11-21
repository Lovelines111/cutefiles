{pkgs, ... }:
{
  programs.cava = {
    enable = true;
    # settings = {
    #   general = {
    #     framerate = 60;
    #     autosens = 1;      # Auto-adjust sensitivity
    #     overshoot = 20;
    #     bars = 0; #is the key setting for dynamic bar count
    #   };
    # };
  };
}
