{ config, pkgs, ... }:
{
  boot.extraModulePackages = with config.boot.kernelPackages; [ 
    rtl88xxau-aircrack
  ];
  
  boot.kernelModules = [ "rtl8812au" ];
  # boot.extraModprobeConfig = ''
  #   options 88xxbu rtw_power_mgnt=0 rtw_enusbss=0 rtw_ips_mode=1
  # '';
  
  networking.networkmanager.wifi.powersave = false;
  # boot.kernelParams = [ "cfg80211.ieee80211_regdom=DE" ]; # Change to your country
  hardware.enableRedistributableFirmware = true;
}
