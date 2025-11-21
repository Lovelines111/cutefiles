{ pkgs, inputs, ... }:
{
  services.openssh = {
  enable = true;
  ports = [10707 22];
  settings = {
    PasswordAuthentication = true;
    PermitRootLogin = "no";
    KbdInteractiveAuthentication = true;
  };
};
# services.fail2ban = {
#   enable = true;
#   maxretry = 5;
#   ignoreIP = [
#     "127.0.0.0/8"
#     "192.168.0.0/16" # Add your local network if needed
#   ];
#   # jails = {
#   #   sshd = ''
#   #     enabled = true
#   #     port = 10707
#   #     filter = sshd
#   #     logpath = /var/log/auth.log
#   #     maxretry = 3
#   #   '';
#   # };
# };

# users.users.luvelyne.openssh.authorizedKeys.keys = [
#   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILwvjsM2B7TY6pkzfw6BBbtGqSwS3YeZ0negs9D62Nun luvelyne@bigcomputer"
# ];

}
