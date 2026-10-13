{
  delib,
  host,
  inputs,
  ...
}:
delib.module {
  name = "programs.jagex-launcher";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled.home.packages = [ inputs.jagex-launcher.packages.x86_64-linux.default ];

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        {
          directory = ".config/Jagex Launcher";
          mode = "0700";
        }
        ".local/share/Jagex Launcher"
        ".runelite"
      ];
    };

}
