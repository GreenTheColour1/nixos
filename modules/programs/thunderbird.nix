{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.thunderbird";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled.programs.thunderbird = {
    enable = true;
  };
}
