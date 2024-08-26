```
  -----------------------
< My NixOS configuration! >
  -----------------------
  \
    \
      ／l
     (ö. ö )
      l  ~ヽ
      じしf_,)ノ
```

Cheatsheet of useful NixOS and git commands:

sudo nix-collect-garbage -d

nix-collect-garbage -d

nix flake update

sudo nixos-rebuild switch --flake .

home-manager switch --flake .

home-manager news --flake .

git commit --amend

git reset --hard #Returns all files to how they were at HEAD, the latest commit

git reset --hard HEAD~1 #The same but with the previous commit

git stash #Stashes local changes so you can return to this state

git restore

gamemoderun %command% #Launch option for Steam games

WINE_FULLSCREEN_FSR=1 WINE_FULLSCREEN_FSR_STRENGTH=1 %command%  #FSR with proton

--------------------------------------------------------------------------------

This is an instruction on how to stay on unstable branch while still having certain packages from older pkgs repo.
Assuming you have home.nix through flake.

```
#flake.nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";  #need both
    nixos2405.url = "github:NixOS/nixpkgs/nixos-24.05";
    #snip
  };

  outputs = { $anything, nixos2405, ... }
  #snip
}

#home.nix
    { $anything, nixos2405, ... }:
{
  #snip

home.packages = with pkgs; [
  inputs.nixos2405.legacyPackages.x86_64-linux.Your-package
];
#snip
}
```
