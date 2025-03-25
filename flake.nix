{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #nixos2405.url = "github:NixOS/nixpkgs/nixos-24.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    nur.url = "github:nix-community/NUR";
    lobster = {
      url = "github:justchokingaround/lobster";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    umu = {
      url = "github:Open-Wine-Components/umu-launcher?dir=packaging/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nur, nix-flatpak, spicetify-nix, ... } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        inputs.nur.modules.nixos.default  # NUR module for NixOS
        ./configuration.nix
        ./modules/hardware-configuration.nix
      ];
    };

    homeConfigurations."luvelyne" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
      extraSpecialArgs = { inherit inputs; };
      modules = [
        ./home.nix
        ./modules/spicetify.nix
      ];
    };
  };
}
