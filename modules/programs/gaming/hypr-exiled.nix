{
  delib,
  inputs,
  host,
  ...
}:
delib.module {
  name = "programs.hypr-exiled";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled.home.packages = [
    inputs.hypr-exiled.packages.x86_64-linux
  ];
}
