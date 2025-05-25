{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.tabby";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled = {
    services.tabby = {
      enable = true;
      port = 8042;
      package = pkgs.tabby.override { cudaSupport = true; };
      acceleration = "cuda";
    };
  };
}
