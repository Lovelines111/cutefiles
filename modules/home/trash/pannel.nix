{ inputs, ... }:
{
  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
    dontAssertNotificationDaemons = true;
    
    settings = {
      # ============================================================================
      # LAYOUTS
      # ============================================================================
      "bar.layouts" = {
        "0" = {
          left = [ "dashboard" "systray" "cava" ];
          middle = [ "workspaces" ];
          right = [ "media" "volume" "clock" "network" "notifications" ];
        };
        "1" = {
          left = [ "dashboard" "workspaces" "windowtitle" ];
          middle = [ "media" ];
          right = [ "volume" "clock" "notifications" ];
        };
        "2" = {
          left = [ "dashboard" "workspaces" "windowtitle" ];
          middle = [ "media" ];
          right = [ "volume" "clock" "notifications" ];
        };
      };


      # ============================================================================
      # BAR CONFIGURATION
      # ============================================================================
      
      # Bar - General
      "bar.autoHide" = "fullscreen";
      
      # Bar - Custom Modules
      "bar.customModules.storage.paths" = [ "/" ];
      
      # Bar - Cava Module
      "bar.customModules.cava.icon" = "";
      "bar.customModules.cava.showIcon" = false;
      "bar.customModules.cava.spaceCharacter" = "";
      "bar.customModules.cava.stereo" = false;
      "bar.customModules.cava.bars" = 10;
      
      # Bar - Workspaces
      "bar.workspaces.ignored" = "^-\\d+$";
      "bar.workspaces.show_icons" = false;
      "bar.workspaces.show_numbered" = true;
      "bar.workspaces.showWsIcons" = false;
      "bar.workspaces.applicationIconOncePerWorkspace" = false;
      "bar.workspaces.showAllActive" = true;
      "bar.workspaces.numbered_active_indicator" = "underline";
      "bar.workspaces.monitorSpecific" = false;
      "bar.workspaces.workspaceMask" = false;
      
      # Bar - Workspace Icon Colors
      "bar.workspaces.workspaceIconMap.1.color" = "#ffb7c5";
      "bar.workspaces.workspaceIconMap.2.color" = "#ffc7d5";
      "bar.workspaces.workspaceIconMap.3.color" = "#ffe7ec";
      "bar.workspaces.workspaceIconMap.4.color" = "#f8b7c2";
      "bar.workspaces.workspaceIconMap.6.color" = "#ffb7c5";
      "bar.workspaces.workspaceIconMap.7.color" = "#ffc7d5";
      "bar.workspaces.workspaceIconMap.8.color" = "#ffe7ec";
      
      # Bar - Launcher
      "bar.launcher.icon" = "💜";
      "bar.launcher.autoDetectIcon" = false;
      
      # Bar - Network
      "bar.network.showWifiInfo" = true;
      "bar.network.truncation" = true;
      "bar.network.label" = false;


      # ============================================================================
      # THEME CONFIGURATION
      # ============================================================================
      
      # Theme - Bar Appearance
      "theme.bar.location" = "top";
      "theme.bar.floating" = false;
      "theme.bar.scaling" = 70;
      "theme.bar.transparent" = false;
      "theme.bar.opacity" = 100;
      "theme.bar.layer" = "top"; #mind this one is any glitches occur.
      "theme.bar.dropdownGap" = "2.3em";
      "theme.bar.margin_sides" = "0.6em";
      "theme.bar.margin_bottom" = "0em";
      "theme.bar.outer_spacing" = "0.4em";
      "theme.bar.background" = "#2a1a1f";
      
      # Theme - Bar Border
      "theme.bar.border.location" = "none";
      "theme.bar.border.color" = "#ffb7c5";
      
      # Theme - Bar Buttons General
      "theme.bar.buttons.style" = "default";
      "theme.bar.buttons.monochrome" = true;
      "theme.bar.buttons.opacity" = 100;
      "theme.bar.buttons.background" = "#5a3a44";
      "theme.bar.buttons.background_opacity" = 100;
      "theme.bar.buttons.enableBorders" = false;
      "theme.bar.buttons.borderColor" = "#ffb7c5";
      "theme.bar.buttons.y_margins" = "0.4em";
      "theme.bar.buttons.spacing" = "0.25em";
      "theme.bar.buttons.padding_y" = "0.2rem";
      "theme.bar.buttons.hover" = "#7a5a64";
      "theme.bar.buttons.icon" = "#ffb7c5";
      "theme.bar.buttons.icon_background" = "#ffb7c5";
      "theme.bar.buttons.text" = "#ffb7c5";
      
      # Theme - Bar Buttons - Dashboard
      "theme.bar.buttons.dashboard.enableBorder" = false;
      "theme.bar.buttons.dashboard.background" = "#ffc7d5";
      "theme.bar.buttons.dashboard.border" = "#ffc7d5";
      "theme.bar.buttons.dashboard.color" = "#2a1a1f";
      "theme.bar.buttons.dashboard.icon" = "#2a1a1f";
      
      # Theme - Bar Buttons - Window Title
      "theme.bar.buttons.windowtitle.enableBorder" = false;
      "theme.bar.buttons.windowtitle.background" = "#5a3a44";
      "theme.bar.buttons.windowtitle.border" = "#f8b7c2";
      "theme.bar.buttons.windowtitle.icon" = "#2a1a1f";
      "theme.bar.buttons.windowtitle.icon_background" = "#f8b7c2";
      "theme.bar.buttons.windowtitle.text" = "#f8b7c2";
      
      # Theme - Bar Buttons - Workspaces
      "theme.bar.buttons.workspaces.active" = "#ffb7c5";
      "theme.bar.buttons.workspaces.available" = "#7a5a64";
      "theme.bar.buttons.workspaces.background" = "#5a3a44";
      "theme.bar.buttons.workspaces.border" = "#ffb7c5";
      "theme.bar.buttons.workspaces.hover" = "#8a6a74";
      "theme.bar.buttons.workspaces.numbered_active_highlighted_text_color" = "#2a1a1f";
      "theme.bar.buttons.workspaces.numbered_active_underline_color" = "#ffb7c5";
      "theme.bar.buttons.workspaces.occupied" = "#ffc7d5";
      
      # Theme - Bar Buttons - Media
      "theme.bar.buttons.media.background" = "#5A3A44";
      "theme.bar.buttons.media.border" = "#ffb7c5";
      "theme.bar.buttons.media.icon" = "#2a1a1f";
      "theme.bar.buttons.media.icon_background" = "#ffb7c5";
      "theme.bar.buttons.media.text" = "#ffb7c5";
      
      # Theme - Bar Buttons - Volume
      "theme.bar.buttons.volume.background" = "#5a3a44";
      "theme.bar.buttons.volume.border" = "#ffc7d5";
      "theme.bar.buttons.volume.icon" = "#2a1a1f";
      "theme.bar.buttons.volume.icon_background" = "#ffc7d5";
      "theme.bar.buttons.volume.text" = "#ffc7d5";
      
      # Theme - Bar Buttons - Clock
      "theme.bar.buttons.clock.background" = "#5a3a44";
      "theme.bar.buttons.clock.border" = "#f8b7c2";
      "theme.bar.buttons.clock.icon" = "#2a1a1f";
      "theme.bar.buttons.clock.icon_background" = "#f8b7c2";
      "theme.bar.buttons.clock.text" = "#f8b7c2";
      
      # Theme - Bar Buttons - Network
      "theme.bar.buttons.network.background" = "#5a3a44";
      "theme.bar.buttons.network.border" = "#ffb7c5";
      "theme.bar.buttons.network.icon" = "#2a1a1f";
      "theme.bar.buttons.network.icon_background" = "#ffb7c5";
      "theme.bar.buttons.network.text" = "#ffb7c5";
      
      # Theme - Bar Buttons - Notifications
      "theme.bar.buttons.notifications.background" = "#5a3a44";
      "theme.bar.buttons.notifications.border" = "#ffb7c5";
      "theme.bar.buttons.notifications.icon" = "#2a1a1f";
      "theme.bar.buttons.notifications.icon_background" = "#ffb7c5";
      "theme.bar.buttons.notifications.total" = "#ffb7c5";
      
      # Theme - Bar Buttons - Battery
      "theme.bar.buttons.battery.background" = "#5a3a44";
      "theme.bar.buttons.battery.border" = "#ffc7d5";
      "theme.bar.buttons.battery.icon" = "#2a1a1f";
      "theme.bar.buttons.battery.icon_background" = "#ffc7d5";
      "theme.bar.buttons.battery.text" = "#ffc7d5";
      
      # Theme - Bar Buttons - Bluetooth
      "theme.bar.buttons.bluetooth.background" = "#5a3a44";
      "theme.bar.buttons.bluetooth.border" = "#ffb7c5";
      "theme.bar.buttons.bluetooth.icon" = "#2a1a1f";
      "theme.bar.buttons.bluetooth.icon_background" = "#ffb7c5";
      "theme.bar.buttons.bluetooth.text" = "#ffb7c5";
      
      # Theme - Bar Buttons - Systray
      "theme.bar.buttons.systray.background" = "#5a3a44";
      "theme.bar.buttons.systray.border" = "#ffb7c5";
      "theme.bar.buttons.systray.customIcon" = "#f5d7dc";
      
      # Theme - Bar Buttons - Separator
      "theme.bar.buttons.separator.width" = "0.1em";
      
      # Theme - Bar Buttons - Cava Module
      "theme.bar.buttons.modules.cava.spacing" = "0.0em";
      "theme.bar.buttons.modules.cava.enableBorder" = false;
      
      # Theme - Menus General
      "theme.bar.menus.monochrome" = true;
      "theme.bar.menus.opacity" = 100;
      "theme.bar.menus.card_radius" = "0.5em";
      "theme.bar.menus.enableShadow" = false;
      "theme.bar.menus.background" = "#2a1a1f";
      "theme.bar.menus.text" = "#f5d7dc";
      "theme.bar.menus.label" = "#ffb7c5";
      "theme.bar.menus.cards" = "#5a3a44";
      "theme.bar.menus.dimtext" = "#7a5a64";
      "theme.bar.menus.feinttext" = "#7a5a64";
      
      # Theme - Menus Border
      "theme.bar.menus.border.color" = "#7a5a64";
      
      # Theme - Menus Buttons
      "theme.bar.menus.buttons.active" = "#ffc7d5";
      "theme.bar.menus.buttons.default" = "#ffb7c5";
      "theme.bar.menus.buttons.disabled" = "#7a5a64";
      "theme.bar.menus.buttons.text" = "#2a1a1f";
      
      # Theme - Menus Icon Buttons
      "theme.bar.menus.iconbuttons.active" = "#ffb7c5";
      "theme.bar.menus.iconbuttons.passive" = "#f5d7dc";
      
      # Theme - Menus Icons
      "theme.bar.menus.icons.active" = "#ffb7c5";
      "theme.bar.menus.icons.passive" = "#7a5a64";
      
      # Theme - Menus List Items
      "theme.bar.menus.listitems.active" = "#ffb7c5";
      "theme.bar.menus.listitems.passive" = "#f5d7dc";
      
      # Theme - Menus Check/Radio Buttons
      "theme.bar.menus.check_radio_button.active" = "#ffb7c5";
      "theme.bar.menus.check_radio_button.background" = "#7a5a64";
      
      # Theme - Menus Dropdown
      "theme.bar.menus.dropdownmenu.background" = "#2a1a1f";
      "theme.bar.menus.dropdownmenu.divider" = "#5a3a44";
      "theme.bar.menus.dropdownmenu.text" = "#f5d7dc";
      
      # Theme - Menus Popover
      "theme.bar.menus.popover.background" = "#2a1a1f";
      "theme.bar.menus.popover.border" = "#2a1a1f";
      "theme.bar.menus.popover.text" = "#ffb7c5";
      "theme.bar.menus.popover.scaling" = 70;
      
      # Theme - Menus Progress Bar
      "theme.bar.menus.progressbar.background" = "#7a5a64";
      "theme.bar.menus.progressbar.foreground" = "#ffb7c5";
      
      # Theme - Menus Slider
      "theme.bar.menus.slider.background" = "#462D35";
      "theme.bar.menus.slider.backgroundhover" = "#462D35";
      "theme.bar.menus.slider.primary" = "#FFB7C5";
      "theme.bar.menus.slider.puck" = "#BE8B9C";
      
      # Theme - Menus Switch
      "theme.bar.menus.switch.disabled" = "#7a5a64";
      "theme.bar.menus.switch.enabled" = "#ffb7c5";
      "theme.bar.menus.switch.puck" = "#8a6a74";
      
      # Theme - Menus Tooltip
      "theme.bar.menus.tooltip.background" = "#2a1a1f";
      "theme.bar.menus.tooltip.text" = "#f5d7dc";
      
      # Theme - Menus Scaling - Dashboard
      "theme.bar.menus.menu.dashboard.scaling" = 70;
      "theme.bar.menus.menu.dashboard.confirmation_scaling" = 80;
      
      # Theme - Menus Scaling - Volume
      "theme.bar.menus.menu.volume.scaling" = 70;
      
      # Theme - Menus Scaling - Network
      "theme.bar.menus.menu.network.scaling" = 80;
      
      # Theme - Menus Scaling - Media
      "theme.bar.menus.menu.media.scaling" = 70;
      "theme.bar.menus.menu.media.card.tint" = 0;
      
      # Theme - Menus Scaling - Bluetooth
      "theme.bar.menus.menu.bluetooth.scaling" = 70;
      
      # Theme - Menus Scaling - Battery
      "theme.bar.menus.menu.battery.scaling" = 70;
      
      # Theme - Menus Scaling - Clock
      "theme.bar.menus.menu.clock.scaling" = 70;
      
      # Theme - Menus Scaling - Notifications
      "theme.bar.menus.menu.notifications.scaling" = 70;
      
      # Theme - Menus Scaling - Power
      "theme.bar.menus.menu.power.scaling" = 70;
      
      # Theme - Notifications
      "theme.notification.scaling" = 80;
      "theme.notification.background" = "#5a3a44";
      "theme.notification.border" = "#7a5a64";
      "theme.notification.label" = "#ffb7c5";
      "theme.notification.labelicon" = "#ffb7c5";
      "theme.notification.text" = "#f5d7dc";
      "theme.notification.time" = "#8a6a74";
      
      # Theme - Notification Actions
      "theme.notification.actions.background" = "#ffb7c5";
      "theme.notification.actions.text" = "#2a1a1f";
      
      # Theme - Notification Close Button
      "theme.notification.close_button.background" = "#ffb7c5";
      "theme.notification.close_button.label" = "#2a1a1f";
      
      # Theme - OSD
      "theme.osd.scaling" = 70;
      "theme.osd.bar_color" = "#ffb7c5";
      "theme.osd.bar_container" = "#2a1a1f";
      "theme.osd.bar_empty_color" = "#7a5a64";
      "theme.osd.bar_overflow_color" = "#ffb7c5";
      "theme.osd.icon" = "#2a1a1f";
      "theme.osd.icon_container" = "#ffb7c5";
      "theme.osd.label" = "#ffb7c5";
      
      # Theme - Tooltip
      "theme.tooltip.scaling" = 70;
      
      # Theme - Font
      "theme.font.weight" = 600;
      "theme.font.size" = "1.2rem";
      "theme.font.name" = "FiraCode Nerd Font Propo";
      "theme.font.label" = "FiraCode Nerd Font Propo Bold";
      
      # Theme - Color Scheme
      "theme.matugen" = false;
      "theme.matugen_settings.mode" = "dark";
      "theme.matugen_settings.scheme_type" = "fidelity";


      # ============================================================================
      # MENUS & DIALOGS
      # ============================================================================
      
      "menus.transition" = "crossfade";
      # "menus.dashboard.powermenu.avatar.image" = "/home/luvelyne/Downloads/dash3.jpg";


      # ============================================================================
      # WALLPAPER
      # ============================================================================
      
      "wallpaper.enable" = true;
      "wallpaper.pywal" = false;
      "wallpaper.image" = "/home/luvelyne/Wallpapers/cherry4.jpg";


      # ============================================================================
      # NOTIFICATIONS
      # ============================================================================
      
      "notifications.showActionsOnHover" = true;
      "notifications.ignore" = [ "spotify" ];


      # ============================================================================
      # MISC
      # ============================================================================
      
      "scalingPriority" = "both";
      "weather_api_key" = "./weather-api.json";
    };
  };
}
