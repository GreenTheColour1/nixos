{
  delib,
  inputs,
  host,
  ...
}:
delib.module {
  name = "programs.apt";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = [
    inputs.greenpkgs.packages.x86_64-linux.awakened-poe-trade
  ];
}
