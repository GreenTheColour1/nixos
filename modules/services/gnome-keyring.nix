{ delib, host, ... }:
delib.module {
  name = "services.gnome-keyring";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled.services.gnome-keyring.enable = true;

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        {
          directory = ".local/share/keyrings";
          mode = "0700";
        }
      ];
    };
}
