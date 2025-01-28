{delib, host, ...}:
delib.module {
  name = "programs.flatseal";

  options = delib.singleEnableOption host.isDesktop;

  myconfig.ifEnabled.programs.flatpak.packages = [
    "com.github.tchx84.Flatseal"
  ];
}
