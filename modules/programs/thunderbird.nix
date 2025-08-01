{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.thunderbird";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled.programs.thunderbird = {
    enable = true;
  };
}
