{ config, pkgs, inputs, ... }:

{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];  # Import the HyprPanel module


  home.packages = with pkgs; [
      #aylurs-gtk-shell-git
      wireplumber
      libgtop
      bluez
      #bluez-utils
      #networkmanager
      dart-sass
      #wl-clipboard
      upower
      gvfs
      #inputs.ags.packages.${pkgs.system}.io
      astal.io
  ];


  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;
    hyprland.enable = true;
    overwrite.enable = true;



    layout = {
      "bar.layouts" = {
        "0" = {
          "left" = ["dashboard" "workspaces" "windowtitle"];
          "middle" = ["media"];
          "right" = [
            "volume"
            "network"
            "bluetooth"
            "systray"
            "clock"
            "notifications"
          ];
        };
      };
      #"bar.clock.format" = "%a %b %d  %I:%M:%S %p"; #default clock
      "bar.clock.format" = "%I:%M:%S %p"; #clock

      "bar.systray.customIcons" = {
          "steam" = {
            "icon" = "󰓓";
            "color" = "#b88ada";
          };

          "chrome_status_icon_1" = {
            "icon" = "";
            "color" = "#b88ada";
          };

        "polychromatic-tray-applet" = {
            "icon" = "󰌌";
            "color" = "#b88ada";
          };

        "TelegramDesktop" = {
            "icon" = "";
            "color" = "#b88ada";
          };
        "webcord" = {
          "icon" = "󰰮";
          "color" = "#b88ada";
        };
        "Xwayland Video Bridge_pipewireToXProxy" = {
          "icon" = "󰋑";
          "color" = "#b88ada";
        };
        "spotify-client" = {
          "icon" = "󰓇";
          "color" = "#b88ada";
        };
        "obs" = {
          "icon" = "󰙦";
          "color" = "#b88ada";
        };
      };

    };
    override = {
      theme.bar.buttons.dashboard.icon = "#c061cb";
      theme.font.label = "FiraCode Nerd Font Propo Semi-Bold";
      notifications.autoDismiss = true;
      notifications.ignore = [
        "spotify"
        "obs-cmd"
        "obs-studio"
        "obs"
      ];

    };

    settings = {
      scalingPriority = "both";
      bar.customModules.updates.pollingInterval = 1440000;
      theme.font.name = "FiraCode Nerd Font Propo";
      theme.bar.floating = true;
      theme.bar.buttons.enableBorders = false;
      bar.launcher.icon = "󱄅";
      theme.notification.scaling = 100;
      theme.bar.menus.menu.dashboard.scaling = 100;
      theme.bar.menus.menu.power.scaling = 100;
      theme.osd.scaling = 100;
      theme.bar.margin_sides = "0.5em";
      theme.bar.dropdownGap = "2.9em";
      theme.bar.buttons.innerRadiusMultiplier = "0.4";
      theme.bar.outer_spacing = "0.6em";
      menus.dashboard.powermenu.avatar.image = "${../pics/pfpdash.png}";
      menus.dashboard.powermenu.avatar.name = "luvelyne";
      menus.dashboard.stats.enable_gpu = true;
      menus.dashboard.shortcuts.left.shortcut1.tooltip = "Librewolf";
      menus.dashboard.shortcuts.left.shortcut1.command = "librewolf";
      menus.dashboard.shortcuts.left.shortcut1.icon = "";
      menus.dashboard.shortcuts.left.shortcut2.command = "spotify";
      menus.dashboard.shortcuts.left.shortcut3.command = "vesktop";
      menus.dashboard.shortcuts.left.shortcut4.command = "fuzzel";
      #menus.dashboard.directories.left.directory3.label = "󰚝 Cutefiles";
      #menus.dashboard.directories.left.directory3.command = "bash $dolphin ~/cutefiles/" ;
      menus.power.showLabel = false;
      bar.workspaces.showApplicationIcons = false;
      bar.workspaces.showWsIcons = false;
      theme.bar.buttons.workspaces.enableBorder = false;
      bar.workspaces.show_icons = false;
      bar.workspaces.show_numbered = false;
      bar.battery.label = false;
      theme.bar.buttons.battery.spacing = "0.5em";
      bar.battery.hideLabelWhenFull = true;
      theme.bar.buttons.battery.enableBorder = false;
      theme.bar.buttons.systray.enableBorder = false;
      theme.bar.buttons.opacity = 100;
      theme.bar.buttons.background_opacity = 40;
      theme.bar.buttons.background_hover_opacity = 100;
      theme.bar.opacity = 90;
      menus.dashboard.directories.enabled = false;
      theme.bar.buttons.style = "split";
      bar.clock.showIcon = false;
      menus.volume.raiseMaximumVolume = false;
      menus.clock.weather.key = "";
      menus.clock.weather.location = "London";
      menus.clock.weather.enabled = false;
      theme.bar.buttons.modules.submap.enableBorder = false;
      theme.bar.buttons.modules.power.enableBorder = true;
      theme.osd.enable = true;
      notifications.showActionsOnHover = true;

    };
  };
}
