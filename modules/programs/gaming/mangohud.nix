{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.mangohud";

  options = delib.singleEnableOption host.gamingFeatured;

  nixos.ifEnabled.environment.systemPackages = [ pkgs.mangohud ];
}
