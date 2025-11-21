{ inputs, config, pkgs, ... }:
{
services.xray.enable = true;
services.xray.settingsFile = ../xraycfgs/yeda-nl.json;
}
