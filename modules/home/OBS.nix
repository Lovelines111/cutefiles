{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override (prevArgs: {
      ffmpeg = prevArgs.ffmpeg.override {
        withNvcodec = true;
        withHeadlessDeps = true;
      };
    });
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
    ];
  };
    home.packages = with pkgs; [
      obs-cmd
      wireplumber
  ];
}
