{
  delib,
  host,
  inputs,
  homeconfig,
  ...
}:
delib.module {
  name = "wallpapers";

  options = delib.singleEnableOption host.guiFeatured;

  home.always.imports = [ inputs.mywallpapers.homeManagerModules.wallpapers ];

  home.ifEnabled = {
    wallpapers.enable = true;
    wallpapers.targetPath = "${homeconfig.home.homeDirectory}/Media/Pictures/Wallpapers";
  };
}
