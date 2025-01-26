{ delib, pkgs, host, ... }:
delib.module {
  name = "programs.obs";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnable.programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      obs-tuna
      obs-pipeire-audio-capture
    ];
  };
}
