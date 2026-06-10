{ delib, pkgs, ... }:
delib.module {
  name = "services.ly";

  options = delib.singleEnableOption false;

  nixos.ifEnabled =
    { myconfig, ... }:
    {
      services.displayManager = {
        ly = {
          enable = true;
          x11Support = false;

          # settings = {
          #   animation = "cascade";
          # };
        };

        autoLogin.enable = true;
        autoLogin.user = myconfig.constants.username;
      };
    };
}
