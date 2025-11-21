{pkgs, inputs, ... }:
{
  boot.kernelModules = [ "kvm-amd" ];

  virtualisation = {
  kvmgt.enable = true; #gpu thing
  spiceUSBRedirection.enable = true;
  
  libvirtd = {
  enable = true;
  qemu = {
    package = pkgs.qemu_kvm;
    runAsRoot = true;
    swtpm.enable = true;
    # ovmf = {
    #   enable = true;
    #   packages = [(pkgs.OVMF.override {
    #     secureBoot = true;
    #     tpmSupport = true;
    #   }).fd];
    # verbatimConfig = ''
    #   nvram = ["${pkgs.OVMF}/FV/OVMF.fd:${pkgs.OVMF}/FV/OVMF_VARS.fd"]
    #   cgroup_device_acl = [
    #     "/dev/null", "/dev/full", "/dev/zero",
    #     "/dev/random", "/dev/urandom",
    #     "/dev/ptmx", "/dev/kvm", "/dev/kqemu",
    #     "/dev/rtc","/dev/hpet", "/dev/vfio/vfio"
    #   ]
    # '';
    };
  };
};

users.users.luvelyne = {
  extraGroups = [ "libvirtd" "kvm" ];
};

  environment.systemPackages = with pkgs; [
    qemu_kvm
    virt-manager
    spice
    spice-vdagent
];


}
