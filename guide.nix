#This is an instruction on how to stay on unstable branch while still having #certain packages from older pkgs repo.
#Assuming you have home.nix through flake.


#flake.nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";  #need both
    nixos2405.url = "github:NixOS/nixpkgs/nixos-24.05";
    #snip
  };

  outputs = { nixos2405, ... }
  #snip
}

#home.nix
    { nixos2405, ... }:
{
  #snip

home.packages = with pkgs; [
  inputs.nixos2405.legacyPackages.x86_64-linux.Your-package
];
#snip
}

