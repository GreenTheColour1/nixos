{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.fuzzel";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled = {
    programs.fuzzel = {
      enable = true;
    };
  };
}
