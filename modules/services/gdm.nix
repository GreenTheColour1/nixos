{ delib, pkgs, ... }:
delib.module {
  name = "services.gdm";

  options = delib.singleEnableOption false;

  nixos.ifEnabled =
    { myconfig, ... }:
    {
      services.displayManager = {
        gdm = {
          enable = true;
        };

        autoLogin.enable = true;
        autoLogin.user = myconfig.constants.username;
      };
    };
}
