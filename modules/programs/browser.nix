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
    inputs.zen-browser.packages.x86_64-linux.default
  ];

  nixos.ifEnabled.environment.sessionVariables = {
    MOZ_DISABLE_RDD_SANDBOX = 1;
  };
}
