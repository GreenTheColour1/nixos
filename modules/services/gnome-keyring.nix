{ delib, host, ... }:
delib.module {
  name = "services.gnome-keyring";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.services.gnome-keyring.enable = true;
}
