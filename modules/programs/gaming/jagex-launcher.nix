{
  delib,
  host,
  inputs,
  ...
}:
delib.module {
  name = "programs.jagex-launcher";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled.home.packages = [ inputs.jagex-launcher.packages.x86_64-linux.default ];

}
