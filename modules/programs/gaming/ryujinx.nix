{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.ryujinx";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled.environment.systemPackages = with pkgs; [
    ryubing
  ];
}
