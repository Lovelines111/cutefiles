{ config, pkgs, lib, ... }:

{
  # Enable the rtw_8812au driver
  boot.extraModulePackages = with config.boot.kernelPackages; [
    rtw88
  ];

  # Load the necessary kernel modules
  boot.kernelModules = [ "rtw_8812au" ];

  boot.blacklistedKernelModules = [ "rtl8xxxu" "rtw_8822bu" "rtw88_8821ce" ];

  boot.kernelParams = [ "pcie_aspm.policy=performance" ];

  boot.extraModprobeConfig = ''
  options rtw88_core disable_lps_deep=y
  options rtw88_pci disable_msi=y disable_aspm=y
  options rtw88_usb disable_aspm=y disable_lps_deep=y
'';


  # Disable power management for the Wi-Fi adapter
  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    interfaces = ["wlan0"];
    networks."MGTS_GPON5_AA86".psk = "4994730644";
    extraConfig = "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=wheel";
  };

  # Optional: Set up a static IP or other network configurations
  networking.interfaces.wlan0 = {
    useDHCP = true; # Use DHCP by default
  };

  # Optional: Add a udev rule to ensure the adapter is recognized
  services.udev.extraRules = ''
  ACTION=="add", SUBSYSTEM=="usb", ATTR{power/autosuspend}="-1"
  ACTION=="add", SUBSYSTEM=="net", ATTR{address}=="1c:61:b4:6d:26:c1", NAME="wlan0"
'';
}

#sudo dmesg | grep -i rtw
#"wlp0s29u1u5" "wlp0s29u1u6" "wlp0s29u1u7" "wlp0s29u1u8" "wlp0s29u1u9"
