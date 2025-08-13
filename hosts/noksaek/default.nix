{ delib, ... }:
delib.host {
  name = "noksaek";

  rice = "gruvbox-dark-medium";
  type = "desktop";

  features = [
    "wireless"
  ];

  myconfig = {
    nvidia-prime.enable = true;
    programs = {
      hyprland.enable = false;
      sway.enable = true;
    };
    services = {
      sddm.enable = false;
      getty.enable = true;
    };
  };
}
