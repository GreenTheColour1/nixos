{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.tabby";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled = {
    home.packages = with pkgs; [
      tabby.override
      {
        cudaSupport = true;
        acceleration = "cuda";
      }
    ];
  };
}
