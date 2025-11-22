
{
  gnome = import ./gnome.nix;
  hyprland-home = import ./hyprland-home.nix;
  GTK = import ./GTK.nix;
  cursor = import ./cursor.nix;
  kitty = import ./kitty.nix;
  librewolf = import ./librewolf.nix;
  zsh = import ./zsh.nix;
  mangohud = ./mangohud.nix;
  obs = ./OBS.nix;
  waybar = ./waybar.nix;
  wezterm = ./wezterm.nix;
  helix = ./helix.nix;
  hunt = ./hunt.nix;
  fuzzel = ./fuzzel.nix;
  pokemon = ./pk2home.nix;
  cava = ./cava.nix;

  DMaterialShell = ./DMaterialShell.nix;
  Caelestia-shell = ./Caelestia-shell.nix;
}
