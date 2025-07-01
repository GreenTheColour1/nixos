{ delib, pkgs, ... }:
delib.module {
  name = "programs.git";

  options.programs.git = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { myconfig, cfg, ... }:
    {
      programs.git = {
        enable = true;
        lfs.enable = true;

        userName = myconfig.constants.gituser;
        userEmail = "dev@camerongreen.ca";
      };
    };

  nixos.ifEnabled.environment.systemPackages = [
    pkgs.git
    pkgs.lazygit
  ];
}
