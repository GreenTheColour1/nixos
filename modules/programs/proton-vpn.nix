{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.proton-vpn";
  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled.environment.systemPacakges = with pkgs; [ protonvpn-gui ];
}
