{
  delib,
  pkgs,
  host,
  inputs,
  ...
}:
delib.module {
  name = "programs.browser";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = [
    pkgs.brave
    inputs.zen-browser.packages.x86-64-linux.default
  ];
}
