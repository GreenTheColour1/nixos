{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.hardware.logitech";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled = {
    services.ratbag.enable = true;
    environemnt.systemPackages = with pkgs; [ piper ];
  };
}
