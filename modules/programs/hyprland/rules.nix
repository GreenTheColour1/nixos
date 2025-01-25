{ delib, ... }:
delib.module {
  name = "programs.hyprland";

  home.ifEnabled = {myconfig, ...}: {
    wayland.windowManager.hyprland.settings = {
      windowrule = [
        "opacity 0.7 override,^(kitty)$"
        "float,^(waypaper)$"
        "workspace 4, ^(vesktop)$"
      ];
      
      windowrulev2 = [
        "float, class:(clipse)"
        "size 622 652, class:(clipse)"
        "maxsize 400 1000, class:(com.chatterino.)"
      ];
    };
  };
}
