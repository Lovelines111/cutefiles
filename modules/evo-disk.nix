{ config, pkgs, ... }:
{
  fileSystems."/home/luvelyne/evo" = {
    device = "/dev/disk/by-uuid/cc51aae2-b605-434f-9e9d-6b67a2b61ad1";
    fsType = "ext4";
    options = [ "defaults" "noatime" "user" "rw" ]; 
  };
  
  systemd.tmpfiles.rules = [
  "d /home/luvelyne/evo 0770 luvelyne users -"
  ];
}
