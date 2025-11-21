{pkgs, ... }:
{
  programs.firejail = {
  enable = true;
  wrappedBinaries = {
    prism-launcher = {
      executable = "${pkgs.prismlauncher}/bin/prismlauncher";
      profile = "${pkgs.firejail}/etc/firejail/prismlauncher.profile";
      extraArgs = [
        "--net=wlp0s20f0u5"
        "--noprofile"
        # Required for U2F USB stick
        # "--ignore=private-dev"
        # Enforce dark mode
        "--env=GTK_THEME=Adwaita:dark"
        # Enable system notifications
        # "--dbus-user.talk=org.freedesktop.Notifications"
      ];
    };
  };
  };
}
