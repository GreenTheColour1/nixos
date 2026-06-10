{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:
delib.module {
  name = "services.sddm";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled =
    { myconfig, ... }:
    {
      qt.enable = true;
      services.displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
        };
        autoLogin.enable = true;
        autoLogin.user = myconfig.constants.username;
      };
    };
}
