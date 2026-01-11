{ delib, host, ... }:
delib.module {
  name = "gtk";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled = {
    gtk = {
      enable = true;
      colorScheme = "dark";
    };
  };
}
