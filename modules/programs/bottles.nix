{ delib, host, ... }:
delib.module {
  name = "programs.bottles";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled =
    { myconfig, ... }:
    {
      myconfig.programs.flatpak.packages = [ "com.usebottles.bottles" ];
    };
}
