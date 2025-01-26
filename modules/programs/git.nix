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

        userName = myconfig.constants.username;
        userEmail = myconfig.constants.useremail;
      };
    };

  nixos.ifEnabled.environment.systemPackages = [ pkgs.git ];
}
