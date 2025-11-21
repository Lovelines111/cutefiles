{pkgs, ... }:
{
  programs.zsh.shellAliases = {
      eacon = "bash ~/nebula/eac/ON.sh";
      eacoff = "bash ~/nebula/eac/OFF.sh";
      huoffline = "bash ~/nebula/eac/hunt-offline.sh";
      huonline = "bash ~/nebula/eac/hunt-online.sh";
  };
}
