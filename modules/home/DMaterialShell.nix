{ inputs, config, lib, pkgs, ... }:
{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ]; 
  
  programs.dankMaterialShell.enable = true;
}
