#    # Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./pk2.nix
      #./XrayLinPc.nix
      #./LinPc2.nix
      ./flatpak.nix
      #./hyprland/main.nix
      #./waybar
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];

  boot.blacklistedKernelModules = [ "nouveau" ];

  boot.kernelModules = [ "v4l2loopback" ];

  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=0 card_label="OBS Cam" exclusive_caps=1
  '';

  #boot.kernelParams = [ "NVreg_EnableGpuFirmware=1" "nvidia_drm.fbdev=1" "nomodeset" ];


  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  networking = {
  proxy.default = "";
  hostName = "nixos"; # Define your hostname.
  networkmanager = {
    enable = true;
    dns = "none";
    plugins = with pkgs; [
      networkmanager-openvpn
      networkmanager-openconnect
      ];
    #unmanaged = [ "tun0" ];
    };

    #nameservers = ["94.140.14.49" "94.140.14.59"];
    nameservers = [ "9.9.9.9" ]; #DNS
    dhcpcd.extraConfig = "nohook resolv.conf";
  };

  services.resolved.enable = false;

#   environment.etc."resolv.conf".text = ''
#       nameserver 116.202.176.26
#       nameserver 94.140.15.15
#     '';

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
    nerd-fonts.fira-code
  ];

  services.cassandra.maxHeapSize = "16G";

  virtualisation.waydroid.enable = true;

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
#   services.xserver = {
#   enable = true;
#   displayManager.gdm.enable = true;
#   desktopManager.gnome.enable = true;
#
# };

  services = {
  displayManager.sddm.enable = true;
  displayManager.sddm.wayland.enable = true;
  displayManager.defaultSession = "plasma";
  desktopManager.plasma6.enable = true;
  #displayManager.sddm.settings.General.DisplayServer = "x11-user";
  #displayManager.sddm.settings.General.InputMethod = "x11";
  displayManager.autoLogin.enable = false;
  displayManager.autoLogin.user = "luvelyne";
  };


  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
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
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = false;
    extraConfig.pipewire."92-low-latency" = {
  context.properties = {
    default.clock.rate = 48000;
        default.clock.quantum = 4096;  #4096
        default.clock.min-quantum = 128;  #128
        default.clock.max-quantum = 8192;  #8192
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
    extraConfig.pipewire-pulse."92-low-latency-pulse" = {
      context.modules = [
    {
      name = "libpipewire-module-protocol-pulse";
      args = {
        pulse.min.req = "32/48000";
        pulse.default.req = "32/48000";
        pulse.max.req = "32/48000";
        pulse.min.quantum = "32/48000";
        pulse.max.quantum = "32/48000";
      };
    }
  ];
  stream.properties = {
    node.latency = "32/48000";
    resample.quality = 1;
  };
  };
};


  nixpkgs.config.permittedInsecurePackages = [
    "appimagekit-unstable-2020-12-31" # Allow insecure package
  ];

   environment.variables = {
    PIPEWIRE_LATENCY = "256/48000";   #"256/48000"
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
#   users.users.novpnuser = {
#     isNormalUser = true;
#     description = "no-vpn-routing";
#     extraGroups = [ "networkmanager" "wheel" "openrazer" "audio" "sudoers" ];
#     packages = with pkgs; [
#       kdePackages.kate
#       iptables
#     ];
#   };

  # Install firefox.
  programs.firefox.enable = true;

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

  services.dbus.enable = true;


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
    inotify-tools
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
    #glib
    #glib
    #glibc
    linuxPackages_zen.cpupower
    polkit
    appimage-run
    ffmpeg
    ustreamer
    openvpn
    oxygen
    waydroid
    #xwaylandvideobridge
    #discord-screenaudio
    #ollama
    jq
    opusTools
    dpkg
    cmake
    pw-volume
    pwvucontrol
    alsa-lib
    pavucontrol
    #appimagekit
    appimage-run
    tun2socks
    shadowsocks-libev
    v2ray
    rofi-wayland
    systemd
    xorg.xdpyinfo
    xorg.xhost
    iptables
    jdk
    protobuf
    gpu-screen-recorder
    grim
    slurp
    gpu-screen-recorder-gtk
    wev
    swappy
    python312
    #python312Packages.slowapi
    python314
  #pannel
    wireplumber
    libgtop
    bluez
    networkmanager
    dart-sass
    wl-clipboard
    upower
    gvfs
  #text
    micro
    kate
    #(nerdfonts.override { fonts = [ "FiraCode" ]; })

  #gameing
    q4wine
    mangohud
    gamemode
    lutris
    lutris-unwrapped
    piper
    protonplus
    openrazer-daemon
    polychromatic #front-end to control of razer
    razergenie
    #inputs.umu.packages.${pkgs.system}.umu
    vulkan-memory-allocator
    ryujinx
    protontricks
    protonup-qt
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
    #mako            # Notification daemon for Wayland   #use service!!!
    slurp
    libnotify
    #swww
    #dunst
    #rofi-wayland
    swww
    #fuzzel
    hyprland
    #ags  #USE FLAKE
    notify
    gtk4
    astal.io
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
    #dunst
  #qt
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
  #VPN
    v2raya
    v2ray
    ndpi
    xray
    hiddify-app
    tor
    i2pd
    i2p
    unbound-full
    firejail
  #android
    android-tools
    aapt
    apksigner
#   #gnome
#     dconf-editor
#     gnome-tweaks
#     gnome-taquin
#     gnome-shell
#     gnome-shell-extensions
#     gnome-extension-manager
#
#     gnomeExtensions.arcmenu
#     gnomeExtensions.appindicator
#     gnomeExtensions.blur-my-shell
#     gnomeExtensions.dash-to-panel
#     gnomeExtensions.user-themes
  ];

#     programs.dconf = {
#       enable = true;
#       settings = {


   environment.sessionVariables.NIXOS_OZONE_WL = "1"; #chromium wayland support
#   caused crahes when pasting!!

  environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";

  nixpkgs.config.qt5 = {
  enable = true;
  platformTheme = "qt5ct";
    style = {
      package = pkgs.utterly-nord-plasma;
      name = "Utterly Nord Plasma";
    };
};

  programs.appimage = {
    enable = false;
    binfmt = false;
  };


  services.ratbagd.enable = true;

  services.cpupower-gui = {
    enable = false;
  };

  hardware.cpu.intel.updateMicrocode = true;

  #Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

#   services.ollama = {
#   enable = true;
#   acceleration = "cuda";
# };

    programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server

    extraCompatPackages = with pkgs; [
      proton-ge-bin
      steam-play-none
      # Add any other packages here that you need for compatibility
    ];
    package = pkgs.steam.override {
        extraPkgs = pkgs: [
          pkgs.vulkan-loader
          pkgs.vulkan-validation-layers
          pkgs.wineWow64Packages.waylandFull
          pkgs.atkmm
          pkgs.dbus
          pkgs.dbus-glib
          pkgs.glib
          pkgs.gtk3
          pkgs.dmidecode
          ];
  };

};


    nixpkgs.config.vesktop.commandLineArgs = "--enable-features=UseOzonePlatform,VaapiVideoDecodeLinuxGL,VaapiVideoEncoder,Vulkan,VulkanFromANGLE,DefaultANGLEVulkan,VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport,UseMultiPlaneFormatForHardwareVideo --ozone-  platform=wayland";

  programs.steam.gamescopeSession.enable = true;

  programs.gamemode.enable = true;

  programs.zsh.enable = true;

  programs.xwayland.enable = lib.mkForce false;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

   services.flatpak.enable = true;
   #https://github.com/gmodena/nix-flatpak

  # Open ports in the firewall.
   #networking.firewall.allowedTCPPorts = [ 10808 10809];
   #networking.firewall.allowedUDPPorts = [ 10808 10809];
  # Or disable the firewall altogether.
  networking = {
    firewall = {
      enable = false;
      #allowedTCPPorts = [ 10808 ]; # Allow the SOCKS proxy port
    };
   };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "nixos-unstable"; # Did you read the comment?

}
