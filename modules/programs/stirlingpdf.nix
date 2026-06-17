{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.strilingpdf";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.home.packages = with pkgs; [ stirling-pdf-desktop ];
}
