{pkgs, ... }:
{
  hardware.cpu.amd.updateMicrocode = true;

  # AMD-specific kernel params
  boot.kernelParams = [
    "amd_pstate=active"        
  ];
  # Enable transparent hugepages
  boot.kernel.sysctl = {
    "vm.swappiness" = 1;
  };

  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="nvme[0-9]n[0-9]", ATTR{queue/scheduler}="none"
  '';
}
