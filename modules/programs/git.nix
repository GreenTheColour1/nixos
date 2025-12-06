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

        settings = {
          user = {
            email = "dev@camerongreen.ca";
            name = myconfig.constants.gituser;
          };
        };
      };
    };

  nixos.ifEnabled.environment.systemPackages = [
    pkgs.git
    pkgs.lazygit
  ];
}
