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
    services.ratbagd.enable = true;
    environment.systemPackages = with pkgs; [ piper ];
  };
}
