{ config, pkgs, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
    ];
#     theme = spicePkgs.themes.starryNight;
#     colorScheme = "Galaxy";

      theme = {
        name = "Retroblur";
        src = pkgs.fetchFromGitHub {
          owner = "Motschen";
          repo = "Retroblur";
          rev = "fresh";
          hash = "sha256-YAOmeSAxD0qR8Y7t+HOBoTCJtiJNfveJCmiptfg25OE";
        };

        injectCss = true;
        injectThemeJs = true;
        replaceColors = true;
        homeConfig = true;
        overwriteAssets = false;
#        additonalCss = "";
      };
  };
}
