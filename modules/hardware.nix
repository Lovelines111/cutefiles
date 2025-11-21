{ config, lib, pkgs, ... }:
{
  #Root partition
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e3786beb-b7fb-4139-91d1-83cd3c717f51";
      fsType = "ext4";
    };
  #EFI boot partition
  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/24B4-64A0";
      fsType = "vfat";
    };

  fileSystems."/home/luvelyne/evo" =
    { device = "/dev/disk/by-uuid/cc51aae2-b605-434f-9e9d-6b67a2b61ad1";
      fsType = "ext4";
      options = [ "defaults" "noatime" "user" "rw" "exec" ];
    };

  swapDevices =
  [ { device = "/dev/disk/by-uuid/d54775c7-028b-4478-8e19-b784b5084e50"; }
  ];
  
  #evo permissions
  # systemd.tmpfiles.rules = [
  #   "d /home/luvelyne/evo 0770 luvelyne users -"
  # ];

}
