{
  delib,
  inputs,
  host,
  lib,
  ...
}:
delib.module {
  name = "programs.exilence-ce";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled =
    { myconfig, ... }:
    {
      home.packages = [ inputs.greenpkgs.packages.x86_64-linux.exilence-ce ];
    };
}
