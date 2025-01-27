{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.waybar";

  options = delib.singleEnableOption host.isDesktop;

  home.isEnabled = {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
    };

    home.packages = [ pkgs.playerctl ];
    services.playerctld.enable = true;
  };
}
