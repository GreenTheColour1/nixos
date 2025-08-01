{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.zathura";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.programs.zathura = {
    enable = true;
  };
}
