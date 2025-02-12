{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.prism-launcher";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = with pkgs; [ prismlauncher ];
}
