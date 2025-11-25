{inputs, pkgs, lib, config, ... }:
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  programs.caelestia = {
    enable = true;
    systemd = {
      enable = true; # "false" if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [];
    };
    settings = {
      bar.status = {
        showBattery = false;
      };
      paths.wallpaperDir = "~/Wallpapers/";
      services.weatherLocation = "Moscow";
      workspaces.showWindows = false;
      workspaces.shown = 10;
      status.showAudio = true;
      status.showBluetooth = false;
      utilities.toasts.kbLayoutChanged = false;
      notifs = {
        actionOnClick = true;
        clearThreshold = 0.3;
        defaultExpireTimeout = 5000;
        expandThreshold = 20;
        expire = true;
      };
      osd = {
        enabled = true;
        enableBrightness = false;
        enableMicrophone = true;
        hideDelay = 2000;
      };
      bar = {
        clock.showIcon = false;
        workspaces.showWindows = false;
        workspaces.shown = 5;
        status.showAudio = true;
        # status.showMicrophone = true; #same as showAudio
        status.showLockStatus = true;
        status.showBluetooth = true;
        tray.recolour = false;

        dragThreshold = 20;
        entries = [
          {
            id = "logo";
            enabled = true;
          }
          {
            id = "workspaces";
            enabled = true;
          }
          {
            id = "spacer";
            enabled = true;
          }
          {
            id = "spacer";
            enabled = true;
          }
          {
            id = "spacer";
            enabled = true;
          }
          {
            id = "tray";
            enabled = true;
          }
          {
            id = "clock";
            enabled = true;
          }
          {
            id = "statusIcons";
            enabled = true;
          }
          {
            id = "power";
            enabled = true;
          }
        ]; #bar.entries
      }; #bar
    # launcher = {
    #     actionPrefix = ">";
    #     actions = [
    #         {
    #             name = "cs2";
    #             command = ["bash firejail --net=wlp6s0f3u4  --noprofile steam steam://rungameid/730/"];
    #             enabled = true;
    #         }
    #     ];
    # };
    }; # Settings end
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableTerm = true;
        theme.enableHypr = true;
        theme.enableSpicetirfy = true;
        theme.enableGtk = true;
        theme.enableQt = true;
      };
    };
  };

}
