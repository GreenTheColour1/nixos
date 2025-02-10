{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.qbittorrent";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled.environmnet.systemPackages = with pkgs; [ qbittorrent ];
}
