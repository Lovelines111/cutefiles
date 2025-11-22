# This is the configuration of my NixOS For MacBook Air 6,2 2013!!
# It's extra cute with some tweaks. Vesktop uses ClientTheme addon with #5e3640 color.
# Librewolf is using this theme: https://addons.mozilla.org/en-US/firefox/addon/classicpink/
# Don't forget to apply dconf from the folder nearby for gnome config and openbar config too :3

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      # ./hardware-configuration.nix
      ./apps.nix
      ./modules/LACT.nix
      # ./modules/cursor.nix #not needed???
      # ./modules/gnome.nix
      #./modules/vpn.nix
      ./modules/steam.nix
      ./modules/v2rayA.nix
      ./modules/nvidia.nix
      ./modules/hyprland.nix
      ./modules/sddm.nix
      ./modules/flatpak.nix
      ./modules/firejail.nix
      # ./modules/evo-disk.nix
      ./modules/hardware.nix
      ./modules/sound.nix
      ./modules/networkmanager.nix
      # ./modules/wifi.nix
      # ./modules/virtualization.nix
      # ./modules/docker.nix
      # ./modules/winboat.nix
      ./modules/pk2.nix
      ./modules/spicetify.nix
      # ./modules/ssh.nix
      ./modules/amd.nix
      # ./modules/archer-fix.nix
      ./modules/gamemode.nix
      ./modules/openrgb.nix
      # ./modules/gdm.nix
    ];

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_zen;
  # boot.kernelPackages = pkgs.linuxPackages_cachyos;
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];

  boot.extraModprobeConfig = ''
    options v4l2loopback devices=2 video_nr=1,2 card_label="OBS Cam,DroidCam" exclusive_caps=1,1
  '';

  # hardware.cpu.amd.updateMicrocode = true; #in amd dedicated nix module.

  security.polkit.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

#   #RGB controls. !!! The package is also installed in home.nix!!!
#   # services.hardware.openrgb.enable = true;
#   services.hardware.openrgb = { 
#   enable = true; 
#   package = pkgs.openrgb-with-all-plugins; 
#   # motherboard = "amd"; 
# };
  
  # hardware.cpu.intel.updateMicrocode = true;
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "performance"; # or "powersave"

  
  #Camear support
  # hardware.facetimehd.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.luvelyne = {
  	isNormalUser = true;
	  description = "Evi"; # Login prompt
    shell = pkgs.zsh;
	  extraGroups = [ "networkmanager" "wheel" "audio" "video" "libvirtd" "kvm" "render" "gamemode" "openrazer" "ydotool" "wireshark"];
    packages = with pkgs; [
       (wrapOBS {
        plugins = with obs-studio-plugins; [
          droidcam-obs
          obs-pipewire-audio-capture
        ];
      })
       ];
  };

  programs.zsh.enable = true;

  services.ratbagd.enable = true; #for piper to work

  nixpkgs.config.cudaSupport = true;

  # # Display manager
  # services = {
  # displayManager.gdm.enable = true;
  # displayManager.gdm.wayland = true;
  # };


  # Fonts
    fonts.packages = with pkgs; [
     jetbrains-mono
     nerd-font-patcher
     nerd-fonts.fira-code

     ipafont
     kochi-substitute
     noto-fonts-cjk-sans
     noto-fonts-cjk-serif
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  
  # Keyboard Layouts:
  services.xserver.xkb = {
    layout = "ch, ru";
    variant = "de";
    options = "grp:win_space_toggle";
  };

  # Configure console keymap # No idea what it's for tbh
  console.keyMap = "sg";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound with pipewire.
  # services.pulseaudio.enable = false;
  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  # };

  systemd.tmpfiles.rules = [
  "d /home/luvelyne/evo 0755 luvelyne users"
];

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # environment.sessionVariables = {
  #   TERMINAL = "wezterm";  # Sets $TERMINAL to wezterm
  # };


  # xdg.mime.enable = true;
  # xdg.mime.defaultApplications = {
  #   "text/plain" = "helix-wezterm.desktop";
  # }; #fix helix in nautilus.


  # Install firefox.
  programs.firefox.enable = false; # So long firefox reputation O7

  services.power-profiles-daemon.enable = true;
  services.cpupower-gui.enable = false;

  hardware.openrazer.enable = true;
  environment.systemPackages = with pkgs; [
      openrazer-daemon
   ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # LIX
  # nix = {
  # package = pkgs.lix;
  # settings = {
  #   experimental-features = ["nix-command" "flakes"];
  #   # structuredAttrs = true;
  #   # separateDebugInfo = true;
  #   # Other settings you might need
  # };
# };
  # # XDG portal configuration
  # xdg.portal = {
  #   enable = true;
  #   xdgOpenUsePortal = false;
  #   extraPortals = [
  #     pkgs.xdg-desktop-portal-gtk
  #     pkgs.xdg-desktop-portal-hyprland
  #   ];
  #   config = {
  #     common = {
  #       default = ["gtk"];
  #     };
  #     hyprland = {
  #       default = ["hyprland" "gtk"];
  #     };
  #   };
  # };

  
  # Open ports in the firewall.
   # networking.firewall.allowedTCPPorts = [ 22 10808 53 4747 ];
   # networking.firewall.allowedUDPPorts = [ 22 10808 53 4747 28960 28961 ];
   # networking.firewall.trustedInterfaces = [ "tun0" ]; #allow vpn connection. I don't know what ports it's using so I had to go with the device.
   # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
