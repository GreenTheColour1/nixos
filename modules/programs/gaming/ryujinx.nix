{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.ryujinx";

  options = delib.singleEnableOption host.gamingFeatured;

  nixos.ifEnabled.environment.systemPackages = with pkgs; [
    ryubing
  ];
}
