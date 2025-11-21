{ pkgs, lib, ...  }:
let
  # customConfig = import ./ido-front-sddm.nix;
  # Copy wallpaper to Nix store first - accessible to SDDM
  wallpaper = pkgs.copyPathToStore ./Ido-Front.png;
  
  # Import config and merge with wallpaper path
  baseConfig = import ./ido-front-sddm.nix;
  customConfig = baseConfig // {
    Background = builtins.toString wallpaper;
  };

  customAstronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "astronaut";
    themeConfig = customConfig;
  };
in
{
  environment.systemPackages = with pkgs; [
    # sddm-astronaut
    customAstronaut 
    kdePackages.qtbase
    kdePackages.qtwayland
    kdePackages.qtmultimedia
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = false;
    extraPackages = with pkgs; [
      customAstronaut 
     ];
    theme = "sddm-astronaut-theme";
    settings = {
      Theme = {
        Current = "sddm-astronaut-theme";
      };
    };
  };
  
}
