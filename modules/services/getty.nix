{ delib, host, ... }:
delib.module {
  name = "services.getty";

  options = delib.singleEnableOption false;

  nixos.ifEnabled =
    { myconfig, ... }:
    {
      services.getty = {
        autologinUser = myconfig.constants.username;
        autologinOnce = true;
      };
    };
}
