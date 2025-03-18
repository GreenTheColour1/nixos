{
  delib,
  host,
  ...
}:
delib.module {
  name = "programs.limo";

  options = delib.singleEnableOption host.isDesktop;

  myconfig.ifEnabled.services.flatpak.packages = [
    "io.github.limo_app.limo"
  ];
}
