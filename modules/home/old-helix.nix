{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = [ pkgs.wezterm ];
    settings = {
      theme = "deep_lavender";
      editor = {
        line-number = "relative";
        cursorline = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        statusline = {
          left = ["mode" "spacer" "file-name" "spacer" "version-control"];
          center = ["spacer"];
          right = ["diagnostics" "spacer" "position" "file-encoding" "file-line-ending" "file-type"];
        };
        indent-guides = {
          render = true;
          character = "▏";
        };
      };
    };

    themes = {
      deep_lavender = {
        inherits = "default";
        
        "ui.background" = { bg = "none"; };
        "ui.text" = { fg = "#BFC8FE"; };
        "ui.text.focus" = { fg = "#FFFFFF"; };
        
        "ui.cursor" = { fg = "#341B4C"; bg = "#A490DC"; };
        "ui.cursorline.primary" = { bg = "#442B5C"; };
        "ui.selection" = { bg = "#543B6C"; };
        "ui.selection.primary" = { bg = "#644B7C"; };
        
        "ui.statusline" = { fg = "#BFC8FE"; bg = "#442B5C"; };
        "ui.statusline.inactive" = { bg = "#341B4C"; fg = "#8E8EAE"; };
        "ui.statusline.normal" = { bg = "#A490DC"; fg = "#341B4C"; modifiers = ["bold"]; };
        "ui.statusline.insert" = { bg = "#8EA8EE"; fg = "#341B4C"; modifiers = ["bold"]; };
        "ui.statusline.select" = { bg = "#C895DE"; fg = "#341B4C"; modifiers = ["bold"]; };
        
        "ui.linenr" = { fg = "#A490DC"; };
        "ui.linenr.selected" = { fg = "#C895DE"; bg = "#442B5C"; };
        
        "error" = { fg = "#FF9FBF"; };
        "warning" = { fg = "#FFDF95"; };
        "info" = { fg = "#8EA8EE"; };
        "hint" = { fg = "#C895DE"; };
        
        "keyword" = { fg = "#C895DE"; modifiers = ["italic"]; };
        "function" = { fg = "#8EA8EE"; };
        "type" = { fg = "#A490DC"; };
        "string" = { fg = "#D4BFFF"; };
        "variable" = { fg = "#BFC8FE"; };
        "constant" = { fg = "#FFDF95"; };
        "operator" = { fg = "#795395"; };
        "delimiter" = { fg = "#795395"; };
        
        "ui.help" = { bg = "#341B4C"; fg = "#BFC8FE"; };
        "ui.menu" = { bg = "#442B5C"; fg = "#BFC8FE"; };
        "ui.popup" = { bg = "#442B5C"; };
        "ui.window" = { bg = "#341B4C"; };
      };
    };
  };
}
