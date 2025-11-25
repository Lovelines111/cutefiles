{ pkgs, ... }:

{
            #######
            #SHELL#
            #######
  programs.starship.enable = true;
  programs.fzf.enable = true;
  # programs.thefuck.enable = true;
  programs.zoxide.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    enableVteIntegration = true;

    shellAliases = {
      run-with-xwayland = "env -u WAYLAND_DISPLAY";
      ls = "ls --color=auto";
      ll = "ls -la";
      update = "sudo nixos-rebuild switch --flake .";
      clean = "sudo nix-collect-garbage -d";
      gs = "git status";
      gp = "git push";
      ga = "git add";
      gc = "git commit";
      ".." = "cd ..";
      "..." = "cd ../..";
      sysinfo = "macchina";
      temp = "sensors";
      bunnyfetch = "bunnyfetch 2>/dev/null";
      mini="~/mini-moulinette/mini-moul.sh";
      over-vpn = "sudo firejail --net=wlan0 --noprofile";
      # HUNT = "sudo firejail --net=wlp6s0f3u2 --noprofile sudo -u luvelyne steam steam://rungameid/594650";
      cs2 = "firejail --net=wlp6s0f3u4  --noprofile steam steam://rungameid/730/";
      hunt = "firejail --net=wlp6s0f3u4  --noprofile steam steam://rungameid/594650/";
      unload = "sudo /home/luvelyne/nebula/unload.sh";
      eacon = "bash ~/nebula/eac/ON.sh";
      eacoff = "bash ~/nebula/eac/OFF.sh";
      crosshair-evening = "wl-crosshair /home/luvelyne/Pictures/sometrash/Round-Pink-dark.png --layer overlay &> /dev/null";
      crosshair-dawn = "wl-crosshair /home/luvelyne/Pictures/sometrash/Round-Pink.png --layer overlay &> /dev/null";
      kill-hunt = "kill -9 $(pidof Main)";
      warframe = "firejail --net=wlp6s0f3u4 --noprofile steam steam://rungameid/230410";
      hyprconfig = "hx ~/.config/hypr/hyprland.conf";
      # yprac = "sed -i -e 's/PremiumOnly:!0/PremiumOnly:!1/g' -e 's/somebitchreal/gayfaggotsexy/g' /home/luvelyne/evo/SteamLibrary/steamapps/common/Counter-Strike\ Global\ Offensive/game/csgo/scripts/bootstrap.vts_c";
      yprac = "/home/luvelyne/nebula/modules/home/yprac.sh";
      terraria = "systemd-run --user --scope -p MemoryMax=4G -p MemorySwapMax=4G steam steam://rungameid/105600";
      space = "ncdu";
    };

    plugins = [
      {
        name = "zsh-vi-mode";
        file = "./share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        src = pkgs.zsh-vi-mode;
      }
      {
        name = "zsh-autosuggestions";
        file = "./share/zsh-autosuggestions/zsh-autosuggestions.zsh";
        src = pkgs.zsh-autosuggestions;
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
        };
      }
    ];

    # initExtra = ''
    initContent = ''
      HISTSIZE=10000
      SAVEHIST=10000
      setopt SHARE_HISTORY
      setopt HIST_IGNORE_DUPS
      setopt AUTO_PUSHD
      setopt PUSHD_IGNORE_DUPS
      setopt PUSHD_SILENT
      setopt COMPLETE_ALIASES
      eval "$(direnv hook zsh)"
      eval "$(starship init zsh)"
    '';
  };
}
