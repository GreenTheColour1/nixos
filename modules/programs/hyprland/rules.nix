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

          # Hearthstone
          # "float, title:(HearthstoneOverlay)"
          # "center, title:(HearthstoneOverlay)"
          # "nofocus, title:(HearthstoneOverlay)"
          # "noinitialfocus, title:(HearthstoneOverlay)"
          # "noborder, title:(HearthstoneOverlay)"
          # "opacity 0.2, title:(HearthstoneOverlay)"
          # "stayfocused, title:^(Hearthstone)$"
        ];
        windowrulev2 = [
          "float, title:(HearthstoneOverlay)"
          "center, title:(HearthstoneOverlay)"
          "noblur, title:(HearthstoneOverlay)"
          "noshadow, title:(HearthstoneOverlay)"
          "noanim, title:(HearthstoneOverlay)"
          "nodim, title:(HearthstoneOverlay)"
          "nofocus, title:(HearthstoneOverlay)"
          "noinitialfocus, title:(HearthstoneOverlay)"
          "opacity 0.5, title:(HearthstoneOverlay)"
          "tile, title:(Hearthstone)"
        ];
      };
    };
}
