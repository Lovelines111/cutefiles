{pkgs, ... }:
{
  services.pulseaudio.enable = false;
  services.pipewire.wireplumber.enable = true;
  
  security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 1024;
      "default.clock.min-quantum" = 32;
      "default.clock.max-quantum" = 2048;
      "default.clock.quantum-limit" = 8192;
    };
  };
}
