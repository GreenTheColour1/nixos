{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.steam";

  options = delib.singleEnableOption host.gamingFeatured;

  nixos.ifEnabled.environment.systemPackages = [ pkgs.steam ];

  nixos.ifEnabled.programs.steam = {
    enable = true;

    package = pkgs.steam.override {
      extraEnv = {
        OBS_VKCAPTURE = 1;
      };
    };

    protontricks.enable = true;
  };

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        # Live perms are 0700 (session tokens).
        {
          directory = ".local/share/Steam";
          mode = "0700";
        }
        ".steam"
        ".factorio"
        ".renpy"
        ".config/unity3d"
        ".local/share/Larian Studios"
        ".local/share/SlayTheSpire2"
        ".local/share/Tabletop Simulator"
        ".local/share/SpeedRunners"
        ".local/share/Valve Corporation"
        ".local/share/Proton"
      ];
    };
}
