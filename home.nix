{ config, pkgs, ... }:
let
  modules = import ./modules/home;
  pstream = pkgs.callPackage ./modules/home/pstream.nix {};
  tf2hud-editor = pkgs.callPackage ./modules/home/tf2-hud-editor.nix {};

in
{
  imports = with modules; [
  # gnome
  hyprland-home
	kitty
	GTK
	cursor #I wanna control it systemwide in the configuration.nix
  zsh
  mangohud
  waybar
  hunt
  # spicetify
  pokemon
  # hyprpannel-cherry
  # fuzzel
  wezterm
  helix
  # DMaterialShell
  Caelestia-shell
  cava
  ];


  programs.home-manager.enable = true;

  home.username = "luvelyne";
  home.homeDirectory = "/home/luvelyne";

  home.packages = with pkgs; [
    blahaj
    eza
    lolcat
    figlet
    neofetch
    popcorntime
    kitty 
    wl-clipboard
    prismlauncher
    bottles
    qbittorrent
    # libreoffice-still-unwrapped    
    spotify-player
    webcord-vencord
    vlc
    zed-editor #Lucie said it's some good editor.
    # cava #controlled with programs.cava
    # obs-studio
    # obs-cmd
    # openrgb  #!!! The package is also installed in home.nix!!!
    direnv
    strawberry
    droidcam
    protonup-qt
    protonplus
    kdePackages.kdenlive
    r2modman
    ani-cli
    easyeffects
    cmatrix
    # pstream
    pokemonsay
    tf2hud-editor
    btop-cuda
    htop-vim
    audacity
    asciiquarium-transparent
    dig
    blanket
    material-symbols
    hyprpicker
    gpu-screen-recorder
    wlr-randr
    cope
   ];

  home.sessionVariables = {
   TERMINAL = "alacritty";
  };

  xdg.desktopEntries.Helix = {
    name = "Helix (WezTerm)";
    genericName = "Text Editor";
    exec = "wezterm start --always-new-process hx %F";
    icon = "helix";
    terminal = false;
    type = "Application";
    categories = ["Utility" "TextEditor"];
    mimeType = ["text/plain" "inode/directory"];
  };

  
  # home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  #

    xdg.configFile."swappy/config".text = ''
    [Default]
    save_dir=$HOME/Desktop
    save_filename_format=swappy-%Y%m%d-%H%M%S.png
    show_panel=false
    line_size=5
    text_size=20
    text_font=sans-serif
    paint_mode=brush
    early_exit=false
    fill_shape=false
    auto_save=false
    custom_color=rgba(220,138,221,1)
    transparent=false
    transparency=50
    
  '';

  # Webcord persimmion.
  nixpkgs.config.permittedInsecurePackages = [
    "electron-36.9.5"
  ];


  home.stateVersion = "24.11"; 
}

