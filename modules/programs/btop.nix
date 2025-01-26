{ delib, host, pkgs, ... }:
delib.module {
  name = "programs.btop";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      vim_keys = true;
    };
    package = pkgs.btop.override { cudaSupport = true; };
  };
}
