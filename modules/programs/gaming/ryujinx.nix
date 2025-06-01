{
  delib,
  pkgs,
  host,
  ...
}:
delib.modue {
  name = "programs.ryujinx";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.home.packages = with pkgs; [
    ryubing
  ];
}
