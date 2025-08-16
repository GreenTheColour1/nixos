{ delib, ... }:
delib.host {
  name = "noksaek";

  rice = "gruvbox-dark-medium";
  type = "desktop";

  features = [
    "wireless"
    "powersave"
  ];

  myconfig = {
    nvidia.enablePrime = true;
    nvidia.useOpen = false;
    programs = {
      hyprland.enable = false;
      niri.enable = true;
    };
    services = {
      sddm.enable = false;
      gdm.enable = true;
      uwsm.enable = false;
    };
  };
}
