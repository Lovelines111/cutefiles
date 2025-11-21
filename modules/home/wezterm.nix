{ pkgs, ... }: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'

      local function load_caelestia_colors()
        local file = io.open(os.getenv("HOME") .. "/.local/state/caelestia/scheme.json", "r")
        if not file then 
          return nil
        end
        
        local content = file:read("*a")
        file:close()
        
        local success, data = pcall(wezterm.json_parse, content)
        if not success then
          return nil
        end
        
        local colors = data.colours
        
        return {
          foreground = colors.text,
          background = colors.base,
          cursor_bg = colors.primary,
          cursor_fg = colors.onPrimary,
          selection_bg = colors.surfaceContainerHighest,
          selection_fg = colors.onSurface,
          
          ansi = {
            colors.term0,  -- black
            colors.term1,  -- red  
            colors.term2,  -- green
            colors.term3,  -- yellow
            colors.term4,  -- blue
            colors.term5,  -- magenta
            colors.term6,  -- cyan
            colors.term7,  -- white
          },
          
          brights = {
            colors.term8,  -- bright black
            colors.term9,  -- bright red
            colors.term10, -- bright green
            colors.term11, -- bright yellow
            colors.term12, -- bright blue
            colors.term13, -- bright magenta
            colors.term14, -- bright cyan
            colors.term15, -- bright white
          },

          tab_bar = {
            background = colors.base,

            active_tab = {
              bg_color = colors.primary,
              fg_color = colors.onPrimary,
              intensity = "Bold",
            },

            inactive_tab = {
              bg_color = colors.surfaceContainerLow,  -- Slightly darker than surfaceContainer
              fg_color = colors.onSurfaceVariant,     -- Softer text color
            },

            new_tab = {
              bg_color = colors.base,
              fg_color = colors.text,
            },

            inactive_tab_hover = {
              bg_color = colors.surfaceContainerHigh,
              fg_color = colors.primary,
              italic = true
            },

            new_tab_hover = {
              bg_color = colors.primaryFixedDim,      -- Dimmer primary variant
              fg_color = colors.onPrimaryFixed,       -- Text for dim primary
            }
          }
        }
      end

        wezterm.on("update-status", function(window, pane)
          -- Check if colors need updating every few seconds
          local overrides = window:get_config_overrides() or {}
          local new_colors = load_caelestia_colors()
          if new_colors and (not overrides.colors or wezterm.json_encode(new_colors) ~= wezterm.json_encode(overrides.colors)) then
            overrides.colors = new_colors
            window:set_config_overrides(overrides)
            -- Force GUI refresh
            window:perform_action(wezterm.action.ReloadConfiguration, pane)
          end
        end)      

      return {
        -- Initial colors (will be overridden when file changes)
        colors = load_caelestia_colors(),
        
        -- Font size reduced by 1 from default
        font_size = 11.4,
        
        window_frame = {
          active_titlebar_bg = "#2a1a1f",
          inactive_titlebar_bg = "#2a1a1f",
          button_fg = "#2a1a1f",
          button_bg = "#2a1a1f",
          button_hover_fg = "#f5d7dc",
          button_hover_bg = "#ffb7c5",
        },
        force_reverse_video_cursor = true,
        default_cursor_style = "SteadyBlock",
        cursor_blink_rate = 0,
        hide_mouse_cursor_when_typing = false,
        enable_wayland = true,
        use_fancy_tab_bar = false,
        keys = {
          { key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
          { key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(1) },
        },
        
        -- Optional: Watch the Caelestia file for changes and auto-reload
      }
    '';
  };
}
