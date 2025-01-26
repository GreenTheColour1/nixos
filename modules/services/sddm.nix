{ delib, host, ... }:
delib.module {
  name = "services.sddm";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled = { myconfig, ... }: {
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
