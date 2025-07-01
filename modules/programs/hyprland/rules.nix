{ delib, ... }:
delib.module {
  name = "programs.hyprland";

  home.ifEnabled =
    { myconfig, ... }:
    {
      wayland.windowManager.hyprland.settings = {
        windowrule = [
          "opacity 0.7 override,class:^(kitty)$"
          "float,class:^(waypaper)$"
          "workspace 4, class:^(vesktop)$"
          "float, class:(clipse)"
          "size 622 652, class:(clipse)"
        ];
      };
    };
}
