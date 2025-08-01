{
  delib,
  host,
  ...
}:
delib.module {
  name = "programs.mpv";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.programs.mpv = {
    enable = true;
  };
}
