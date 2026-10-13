{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.hardware.logitech";

  options = delib.singleEnableOption false;

  nixos.ifEnabled = {
    services.ratbagd.enable = true;
    environment.systemPackages = with pkgs; [ piper ];
  };

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [ ".config/solaar" ];
    };
}
