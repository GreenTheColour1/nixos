{
  delib,
  host,
  ...
}:
delib.module {
  name = "programs.mpv";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.programs.mpv = {
    enable = true;
  };
}
