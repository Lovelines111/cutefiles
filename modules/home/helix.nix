{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "terminal-inherit";
      editor = {
        line-number = "relative";
        cursorline = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
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
      terminal-inherit = {
        # Use terminal defaults for everything
        "ui.background" = {};
        "ui.text" = {};
        
        # Line numbers use terminal colors
        "ui.linenr" = {};
        "ui.linenr.selected" = { modifiers = ["bold"]; };
        
        # Gutter transparent
        "ui.gutter" = {};
        
        # Selection - use terminal's selection colors (usually works automatically)
        "ui.selection" = { modifiers = ["reversed"]; };
        "ui.selection.primary" = { modifiers = ["reversed"]; };
        
        # Cursor
        "ui.cursor" = { modifiers = ["reversed"]; };
        "ui.cursor.primary" = { modifiers = ["reversed"]; };
        "ui.cursor.match" = { modifiers = ["underlined"]; };
        "ui.cursorline" = {};
        
        # Statusline
        "ui.statusline" = { modifiers = ["reversed"]; };
        "ui.statusline.inactive" = {};
        
        # Syntax - use terminal ANSI colors
        "keyword" = "magenta";
        "keyword.control" = "magenta";
        "function" = "blue";
        "function.method" = "blue";
        "string" = "green";
        "comment" = "bright-black";
        "constant" = "cyan";
        "constant.builtin" = "cyan";
        "variable" = "white";
        "variable.builtin" = "cyan";
        "type" = "yellow";
        "type.builtin" = "yellow";
        "operator" = "white";
        "property" = "blue";
        "attribute" = "yellow";
        "namespace" = "yellow";
        "number" = "cyan";
        "boolean" = "cyan";
      };
    };
  };
}
