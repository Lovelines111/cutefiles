{
  description = "BigComputer flake by Evi";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    oldpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    
    hyprland.url = "github:hyprwm/Hyprland";
    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };

    # hyprpanel = {
    #   url = "github:Jas-SinghFSU/HyprPanel";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
      
    home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
    };

    # winboat = {
    #   url = "github:TibixDev/winboat";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # dankMaterialShell = {
    #   url = "github:AvengeMedia/DankMaterialShell";
    #   # url = "path:/home/luvelyne/Documents/DankMaterialShell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    caelestia-shell = {
      # url = "path:/home/luvelyne/Documents/shell";
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nur.url = "github:nix-community/NUR";

    # lix-module = {
    #   url = "git+https://git.lix.systems/lix-project/nixos-module.git";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

 outputs = { self, nixpkgs, home-manager, nur, spicetify-nix, oldpkgs,  ... } @ inputs: {
    nixosConfigurations.bigcomputer = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        inputs.nur.modules.nixos.default  # NUR module for NixOS
        ./configuration.nix
        ./hardware-configuration.nix
        inputs.spicetify-nix.nixosModules.default
        # inputs.lix-module.nixosModules.default
      ];
    };

    homeConfigurations."luvelyne" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
      extraSpecialArgs = { inherit inputs; };
      modules = [
      inputs.spicetify-nix.homeManagerModules.default # spotify themes
        ./home.nix
      ];
    };
  };
}
