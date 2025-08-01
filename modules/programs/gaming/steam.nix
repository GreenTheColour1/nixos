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
}
