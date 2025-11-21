{ pkgs, lib, config, ... }:

let
  # Shared color palette
  colors = {
    background = "#2a1a1f";
    foreground = "#f5d7dc";
    light-pink = "#ffd7e2";  # New lighter pink for top bar
    accent = "#ffb7c5";
    muted = "#5a3a44";
  };
in {
  programs.librewolf = {
    enable = true;
    
    # Core settings
    settings = {
      # Enable UI customization
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "browser.tabs.inTitlebar" = 1;
      "svg.context-properties.content.enabled" = true;
      
      # Light pink top bar
      "browser.uiCustomization.state" = ''
        {"placements":{"widget-overflow-fixed-list":[],"nav-bar":["back-button","forward-button","stop-reload-button","home-button","urlbar-container","downloads-button","library-button","ublock0_raymondhill_net-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["personal-bookmarks"]},"seen":["developer-button","ublock0_raymondhill_net-browser-action"],"dirtyAreaCache":["nav-bar","toolbar-menubar","TabsToolbar","PersonalToolbar"],"currentVersion":18}
      '';
    };
  };

  # Full CSS theming
  home.file.".librewolf/profile.default/chrome/userChrome.css".text = ''
    /* Light pink navigation bar */
    #nav-bar {
      background: ${colors.light-pink} !important;
      color: ${colors.background} !important;
      box-shadow: none !important;
    }

    /* Tab bar matches terminal */
    #TabsToolbar {
      background: ${colors.background} !important;
    }

    .tab-background {
      background: ${colors.muted} !important;
      border: none !important;
    }

    .tab-background[selected] {
      background: ${colors.accent} !important;
    }

    /* URL bar styling */
    #urlbar {
      background: rgba(255,255,255,0.7) !important;
      color: ${colors.background} !important;
    }

    /* Sidebar matches helix */
    #sidebar-box {
      background: ${colors.background} !important;
      color: ${colors.foreground} !important;
    }
  '';

  # Create directory structure
  home.activation.ensureLibrewolfChromeDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p "${config.home.homeDirectory}/.librewolf/profile.default/chrome"
  '';
}
