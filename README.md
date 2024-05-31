My NixOS configuration. 


```
 __________________________
< I'm sad. Send 50 dollars >
 --------------------------

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

gamemoderun %command% #doesn't work anyway XD
mangohuds %command% #for performance metrics
WINE_FULLSCREEN_FSR=1 WINE_FULLSCREEN_FSR_STRENGTH=4 %command% #FSR. The last number is strength. (1-5)

sudo nixos-rebuild switch -I nixos-conf=configuration.nix
