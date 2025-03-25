{ config, pkgs, inputs, ... }:

# Cool themes here:
#https://github.com/atelierbram/Base2Tone-kitty/blob/main/themes/
#https://github.com/dexpota/kitty-themes/blob/master/themes/

let
  # Define the theme URL. Use raw url e.g. "https://raw.githubusercontent.com/path/theme.conf"
  #URL = "https://raw.githubusercontent.com/dexpota/kitty-themes/refs/heads/master/themes/Ubuntu.conf";
  URL = "https://raw.githubusercontent.com/atelierbram/Base2Tone-kitty/refs/heads/main/themes/base2tone-lavender-dark.conf";
  # Epic automation! don't touch it though
  THEME = pkgs.stdenv.mkDerivation {
    name = "kitty-theme.conf";
    src = builtins.fetchurl {
      url = URL;
    };
    phases = [ "install" ];
    install = ''
      cp $src $out
    '';
  };
in

{

# Configure kitty terminal
	programs.kitty = {
		enable = true;
		#Font settings:
		font = {
		name = "FiraCode Nerd Font";
		size = 12;
			};

		settings = {
			include = "${THEME}";
			background_opacity = 0.8;
			background_blur = 1;
			dynamic_background_opacity = true;
		};
		keybindings = {
			"alt+e" = "next_tab";
			"alt+q" = "previous_tab";
		};
	};
}
