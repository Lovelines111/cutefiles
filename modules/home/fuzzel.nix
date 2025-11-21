{ pkgs, ... }: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Fira Code:size=12";
        line-height = 24;
        width = 40;
        horizontal-pad = 16;
        vertical-pad = 8;
      };
      colors = {
        background = "341b4ce6";  # #341B4C with 90% opacity (e6)
        text = "bfc8feff";        # #BFC8FE (your Helix text)
        match = "a490dcff";       # #A490DC (cursor color)
        selection = "795395ff";    # #795395 (brackets color)
        selection-text = "bfc8feff";
        border = "4f3b63ff";       # #4F3B63 (darker purple)
      };
      border = {
        width = 2;
        radius = 8;
      };
      dmenu = {
        mode = "text";
      };
    };
  };
}
