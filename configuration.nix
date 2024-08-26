 # Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, cudaPackages_11, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./pk2.nix
      ./XrayLinPc.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest_xen_dom0;

  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];

  boot.blacklistedKernelModules = [ "nouveau" ];

  boot.kernelModules = [ "v4l2loopback" ];

  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=0 card_label="OBS Cam" exclusive_caps=1
  '';

  boot.kernelParams = [ "NVreg_EnableGpuFirmware=1" "nvidia_drm.fbdev=1" "nomodeset" ];



  networking = {
  hostName = "nixos"; # Define your hostname.
  networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
      networkmanager-openconnect
      ];
    };

    nameservers = ["8.8.8.8" "8.8.4.4"];
    #nameservers = [ "1.1.1.1" "1.0.0.1" ]; #DNS
  };
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
   #networking.proxy.default = "socks5://127.0.0.1:0";
   #networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  hardware.openrazer.enable = true;

  hardware.openrazer.users = ["luvelyne"];

#   hardware.system76.enableAll = true;

  services.xserver.videoDrivers = ["nvidia"];


  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia-container-toolkit.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.powerManagement.finegrained = false;
  hardware.nvidia.open = false;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.forceFullCompositionPipeline = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
#   hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
#     version = "555.58";
#     sha256_64bit = "sha256-bXvcXkg2kQZuCNKRZM5QoTaTjF4l2TtrsKUvyicj5ew=";
#     sha256_aarch64 = "sha256-7XswQwW1iFP4ji5mbRQ6PVEhD4SGWpjUJe1o8zoXYRE=";
#     openSha256 = "sha256-hEAmFISMuXm8tbsrB+WiUcEFuSGRNZ37aKWvf0WJ2/c=";
#     settingsSha256 = "sha256-vWnrXlBCb3K5uVkDFmJDVq51wrCoqgPF03lSjZOuU8M=";
#     persistencedSha256 = "sha256-lyYxDuGDTMdGxX3CaiWUh1IQuQlkI2hPEs5LI20vEVw=";
#   };


   services.flatpak.enable = true;

    fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-font-patcher
  ];

  virtualisation.waydroid.enable = false;

  virtualisation.docker = {
  enable = true;
  };

  programs.dconf.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  services = {
  displayManager.sddm.enable = true;
  displayManager.sddm.wayland.enable = true;
  displayManager.defaultSession = "plasma";
  desktopManager.plasma6.enable = true;
  #displayManager.sddm.settings.General.DisplayServer = "x11-user";
  #displayManager.sddm.settings.General.InputMethod = "x11";
#   desktopManager.cosmic.enable = true;
#   displayManager.cosmic-greeter.enable = true;
  displayManager.autoLogin.enable = true;
  displayManager.autoLogin.user = "luvelyne";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "ch";
  };

  # Configure console keymap
  console.keyMap = "sg";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = false;
    pulse.enable = true;
    jack.enable = false;
    extraConfig.pipewire."92-low-latency" = {
  context.properties = {
    default.clock.rate = 48000;
        default.clock.quantum = 4096;
        default.clock.min-quantum = 128;
        default.clock.max-quantum = 8192;
        default.latency.internal.rate = 48000;
        default.latency.internal.quantum = 4096;
        context.properties.default.buffer-size = 8192;
  context.realtime = {
        rt.prio = 88;
        rt.time.soft = 2000000;
        rt.time.hard = 3000000;
    };
  };
  };
};

   environment.variables = {
    PIPEWIRE_LATENCY = "256/48000";
  };

  hardware.pulseaudio.enable = false;

  environment.etc."asound.conf".text = ''
    pcm.!default {
        type plug
        slave.pcm "pipewire"
    }

    ctl.!default {
        type plug
        slave.pcm "pipewire"
    }
  '';
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;

  # Enable touchpad support (enabled  default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.luvelyne = {
    isNormalUser = true;
    description = "Evelyne";
    extraGroups = [ "networkmanager" "wheel" "openrazer" "audio" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  programs.hyprland = {
  enable = false;
  xwayland.enable = false;

  };

#   xdg.portal.enable = true;
#   xdg.portal.extraPortals = [
#   pkgs.xdg-desktop-portal-gtk
#   pkgs.xdg-desktop-portal-kde
#    ];
#   xdg.portal.config = {
#       serviceConfig = {
#         ExecStart = [ "env G_MESSAGES_DEBUG=all /nix/store/64icl8xdwjx39qgd8rva1lqbd7mdnx3l-xdg-desktop-portal-1.18.4/libexec/.xdg-desktop-portal-wrapped" ];
#       };
#     };

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import <nixos-unstable> { config = config.nixpkgs.config; };
    };
  };

  environment.variables.PATH = [ "/usr/bin" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [  #yes have!
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.

  #messengerrs
    vesktop
    webcord-vencord
    telegram-desktop
    #config.nur.repos.colinsane.pkgs.signal-desktop-from-src
  #essential
    wget
    git
    tldr
    neofetch
    cpufetch
    screenfetch
    tree
    btop
    htop
    magic-wormhole-rs
    gcc13
    bc
    gnumake42
    nmap
    age
    ranger
    inetutils
    home-manager
    gperftools
    util-linux
    onefetch
    ipfetch
    ramfetch
    starfetch
    octofetch
    bottom
    btop
    glib
    linuxPackages_zen.cpupower
    polkit
    appimage-run
    ffmpeg
    ustreamer
    openvpn
    oxygen
    xwaylandvideobridge
    ollama
    jq
    opusTools
    dpkg
    cmake
    pw-volume
    pwvucontrol
    alsa-lib
    pavucontrol
    appimagekit
    appimage-run
    tun2socks
    shadowsocks-libev
    v2ray
    rofi-wayland
    systemd
    xorg.xdpyinfo
    xorg.xhost
  #text
    micro
    kate
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  #gameing
    q4wine
    mangohud
    gamemode
    lutris
    piper
    protonplus
    openrazer-daemon
    polychromatic #front-end to control of razer
    razergenie
  #misc
    pkgs.spotify
    blahaj
    vlc
    asciicam
    pokemonsay
  #windowmanager
    wayland
    xwayland
    wl-clipboard    # Clipboard utilities for Wayland
    #waybar         # Status bar for Wayland
    #mako            # Notification daemon for Wayland
    #libnotify
    #swww
    #dunst
    #rofi-wayland
    swww
    #fuzzel
  #info
    wayland-utils
    vulkan-tools
    mesa-demos
    mesa
    ocl-icd
  #cam
    ffmpeg
    v4l-utils
    linuxKernel.packages.linux_zen.v4l2loopback
    cheese
    dunst
  ];

   environment.sessionVariables.NIXOS_OZONE_WL = "0"; #chromium wayland support
#   caused crahes when pasting!!


  services.ratbagd.enable = true;

  services.cpupower-gui = {
    enable = false;
  };

  hardware.cpu.intel.updateMicrocode = true;

  #Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.ollama = {
  enable = true;
  acceleration = "cuda";
};

    programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server

    extraCompatPackages = with pkgs; [
      proton-ge-bin
      # Add any other packages here that you need for compatibility
    ];
};

  programs.steam.gamescopeSession.enable = true;

  programs.gamemode.enable = true;

  programs.zsh.enable = true;

  programs.xwayland.enable = false;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
   #networking.firewall.allowedTCPPorts = [ 1080 ];
   #networking.firewall.allowedUDPPorts = [ 1080 ];
  # Or disable the firewall altogether.
   networking.firewall = { enable = false; };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "nixos-unstable"; # Did you read the comment?

}
