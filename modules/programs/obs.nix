{
  delib,
  pkgs,
  host,
  lib,
  ...
}:
delib.module {
  name = "programs.obs";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled.programs.obs-studio = {
    enable = true;

    package = pkgs.obs-studio.override {
      cudaSupport = true;
    };

    plugins = with pkgs.obs-studio-plugins; [
      obs-tuna
      obs-pipewire-audio-capture
      obs-vkcapture
    ];
  };
}
