{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.obs";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      obs-tuna
      obs-pipewire-audio-capture
    ];
  };
}
