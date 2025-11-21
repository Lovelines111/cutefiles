{ pkgs, inputs, oldpkgs, ... }:
{
    # I've Only added essential programs here, the rest is in home.
  environment.systemPackages = with pkgs; [
    vim
    killall
    neovim
    peazip
    helix
    wget
    git
    telegram-desktop
    vesktop
    # librewolf
    librewolf-bin
    bitwarden-desktop
    # spotify
    rpi-imager
    vlc
    ffmpeg-full
    mangohud
    piper
    cpu-x
    wineWowPackages.waylandFull
    # openjdk8-bootstrap
    protontricks
    wl-crosshair
    unigine-heaven
    lutris
    bluez
    bluez-tools
    (flameshot.override { enableWlrSupport = true; })
    wl-gammactl
    tcpdump
    wireshark
    lsof
    gdb
    ghidra
    obs-cmd
    polychromatic
    python314
    gcc
    # davinci-resolve
    xdotool
    appimage-run
    # protonmail-desktop
    # lix
    # tetrio-desktop
    ffmpegthumbnailer
    # inputs.oldpkgs.legacyPackages.x86_64-linux.systemd
    # inputs.oldpkgs.legacyPackages.x86_64-linux.iproute2
    # systemd
    # zulu24
    tor
    # audacity
    dnspeep
    burpsuite
    # (callPackage ./modules/winboat.nix {})
    # inputs.winboat.packages.x86_64-linux.winboat
    freerdp
    material-symbols
    g810-led #keyboard color switching
    stress-ng
    (discord.override {withOpenASAR = true; withVencord = true;})
    vscode
    libstrangle #limiting FPS
    tomato-c #pomodoro timer goated
    gnome-disk-utility
    rpcs3
    ncdu #disk space analyzer.
    # waydroid-nftables
  ];

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  programs.nix-ld.enable = true;#for PINCE
  programs.ydotool.enable = true; #for auto-vault.

  # virtualisation.waydroid = {
  #   enable = true;
  #   package = pkgs.waydroid;
  # };
  
  # services.ollama = {
  # enable = false;
  # acceleration = "cuda";
# };

}
