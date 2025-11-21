{ config, pkgs, ... }:

{
  # User environment packages
  home.packages = with pkgs; [
    gnome-tweaks
    dconf
    colord
    gnomeExtensions.blur-my-shell
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.user-themes
    gnomeExtensions.vitals
    gnomeExtensions.sound-output-device-chooser
    gnomeExtensions.appindicator
    gnomeExtensions.forge
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.quick-settings-tweaker
    gnomeExtensions.open-bar
    gnomeExtensions.media-controls
    #gnomeExtensions.display-scale-switcher
  ];

  # GNOME Extensions setup
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "blur-my-shell@aunetx"
        #"trayIconsReloaded@selfmade.pl"
	"user-theme@gnome-shell-extensions.gcampax.github.com"
	"Vitals@CoreCoding.com"
	"sound-output-device-chooser@kgshank.net"
	"appindicatorsupport@rgcjonas.gmail.com"
	#"forge@jmmaranan.com"
	"clipboard-indicator@tudmotu.com"
	"quick-settings-tweaker@qwreey"
	"openbar@neuromorph"
	"media-controls@cliffniff.github.com"
  #"display-scale-switcher@abelsiqueira.com"

      ];
    };
  };

  # Specify Home Manager state version
  home.stateVersion = "24.11"; # or the version you're using
}

