{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "kvantum-flatpak";

  # options = delib.singleEnableOption host.guiFeatured;
  options = delib.singleEnableOption false;

  myconfig.ifEnabled.services.flatpak.packages = [
    { appId = "org.kde.KStyle.Kvantum"; }
  ];
}
