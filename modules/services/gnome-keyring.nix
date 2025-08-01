{ delib, host, ... }:
delib.module {
  name = "services.gnome-keyring";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.services.gnome-keyring.enable = true;
}
