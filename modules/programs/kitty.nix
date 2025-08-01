{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.kitty";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.programs.kitty = {
    enable = true;

    settings = {
      enable_audio_bell = false;
      modify_font = "cell_width 90%";
    };
  };
}
