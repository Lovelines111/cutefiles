{pkgs, ...}:
{
  boot.blacklistedKernelModules = [ "nouveau" ];
  
  services.xserver.videoDrivers = ["nvidia"];


  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia-container-toolkit.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.powerManagement.finegrained = false;
  hardware.nvidia.open = false;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.forceFullCompositionPipeline = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
  

  
}
