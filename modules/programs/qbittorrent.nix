{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.qbittorrent";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled.environment.systemPackages = with pkgs; [ qbittorrent ];
}
