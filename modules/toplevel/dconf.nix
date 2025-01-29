{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "dconf";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled = {
    services.dbus = {
      enable = true;
      packages = [ pkgs.dconf ];
    };

    programs.dconf = {
      enable = true;
    };
  };
}
