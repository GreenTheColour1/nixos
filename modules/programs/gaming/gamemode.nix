{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.gamemode";

  options = delib.singleEnableOption host.gamingFeatured;

  nixos.ifEnabled.environment.systemPackages = [ pkgs.gamemode ];
  nixos.ifEnabled.programs.gamemode.enable = true;
}
