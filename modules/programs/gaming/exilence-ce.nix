{
  delib,
  inputs,
  host,
  lib,
  ...
}:
delib.module {
  name = "programs.exilence-ce";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled =
    { myconfig, ... }:
    {
      home.packages = [ inputs.greenpkgs.packages.x86_64-linux.exilence-ce ];
    };
}
