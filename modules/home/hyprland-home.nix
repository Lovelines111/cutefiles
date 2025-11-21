{ pkgs, lib, inputs, ... }:
{
  # Hyprland configuration through Home Manager
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true; 
    # plugins = [
    #   inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    # ];
    
    # You can add your hyprland.conf settings here if needed
    settings = {
      # plugin = {
      #   csgo-vulkan-fix = {
      #     fix_mouse = false;
      #       # vkfix-app = [
      #       #   "cs2, 1440, 1080"
      #       # ];
      #   };
      # };
      
      # Monitor configuration
      monitor = [
        "DP-3,1920x1080@170,0x0,1,vrr,0"
      ];

      # Program variables
      "$terminal" = "wezterm";
      "$fileManager" = "nautilus";
      "$bar" = "caelestia shell";
      "$mainMod" = "SUPER";
      "$discord" = "discord";

      # Autostart
      exec-once = [
        # "$terminal"
        # "$bar"
        # "hyprctl plugin load /nix/store/h5jb0acjbyf304sjasqd8cfwwmizzscl-csgo-vulkan-fix-0.51.0/lib/libcsgo-vulkan-fix.so"
        "$discord"
      ];

      # General settings
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(ffb7c5cc) rgba(ffc7d5cc) 45deg";
        "col.inactive_border" = "rgba(7a5a64aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      # Decoration settings
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        
        blur = {
          enabled = false;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # Animations
      animations = {
        enabled = true;
        
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];
        
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # Dwindle layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Master layout
      master = {
        new_status = "master";
      };

      # Misc settings
      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
        mouse_move_enables_dpms = true;
        focus_on_activate = true;
        mouse_move_focuses_monitor = true;
      };

      # Input configuration
      input = {
        kb_layout = "ch, ru";
        kb_variant = "de, ";
        kb_options = "grp:win_space_toggle";
        follow_mouse = 1;
        sensitivity = -3;
        
        touchpad = {
          natural_scroll = false;
        };
      };

      # Per-device configuration
      device = {
        name = "logitech-g502-hero-gaming-mouse";
        sensitivity = -3;
      };

      # Window rules
      windowrulev2 = [
        # Flameshot rules
        "noanim, class:^(flameshot)$"
        "noblur, class:^(flameshot)$"
        "noborder, class:^(flameshot)$"
        "animation fade, class:^(flameshot)$"
        "animation fadein, class:^(flameshot)$"
        "animation fadeout, class:^(flameshot)$"
        "float,class:^(flameshot)$,title:^(flameshot)$"
        "size 2160 1620, class:^(cs2)$"
        
        # Swappy rules
        "float, class:^(swappy)$"
        "center, class:^(swappy)$"
        "stayfocused, class:^(swappy)$"
        
        # General rule
        "suppressevent maximize, class:.*"
      ];

      # Keybindings
      bind = [
        # Basic window management
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, F, fullscreen,"
        
        # Custom scripts
        "$mainMod, SPACE, exec, sh ~/Documents/kb-led.sh"
        "Ctrl, f1, exec, obs-cmd replay save"
        "$mainMod, T, exec,  wl-copy '🏳‍⚧' && wl-paste"
        
        # Screenshot bindings
        "$mainMod, Print, exec, slurp | grim -l 0 -g - - | wl-copy"
        "$mainMod, F12, exec, grim - | wl-copy"
        "$mainMod, F11, exec, slurp | grim -g - - | swappy -f -"
        "$mainMod SHIFT, F, exec, hyprpicker --autocopy"
        
        # Focus movement
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        
        # Workspace switching
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        
        # Move window to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        
        # Special workspaces
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, A, togglespecialworkspace, bugaga"
        "$mainMod SHIFT, A, movetoworkspace, special:bugaga"
        
        # Mouse workspace switching
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod, mouse_right, workspace, e+1"
        "$mainMod, mouse_left, workspace, e-1"
        
        # Volume controls
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        
        # Global keybinds
        "Super, W, global, caelestia:launcher"
        "Super, Z, global, caelestia:session"
      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindl = ", mouse:282, exec, obs-cmd replay save";
    };
  };

  home.packages = with pkgs; [
    kitty
    nautilus
    fuzzel
    # wl-clipboard #controlled frome home.nix
    swww
    slurp
    grim
    swappy
    imv
    jq
    libnotify
    pavucontrol
    # xdg-desktop-portal-hyprland
    # xdg-desktop-portal-gtk
    wtype
  ];

  # XDG portal configuration
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
    config = {
      common = {
        default = ["gtk"];
      };
      hyprland = {
        default = ["hyprland" "gtk"];
      };
    };
  };
}
