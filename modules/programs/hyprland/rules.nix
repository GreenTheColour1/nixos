{ delib, ... }:
delib.module {
  name = "programs.hyprland";

  home.ifEnabled =
    { myconfig, ... }:
    {
      wayland.windowManager.hyprland.settings = {
        window_rule = [
          {
            name = "terminal_opacity";
            match = {
              class = "^(kitty)$";
            };
            opacity = 0.7;
          }
          {
            name = "waypaper_float";
            match = {
              class = "^(waypaper)$";
            };
            float = true;
          }
          {
            name = "vesktop";
            match = {
              class = "^(vesktop)$";
            };
            workspace = "4 silent";
          }
          {
            name = "clipse";
            match = {
              class = "^(clipse)$";
            };
            float = true;
            size = [
              "622"
              "652"
            ];
          }

          # Hearthstone
          # "float, title:(HearthstoneOverlay)"
          # "center, title:(HearthstoneOverlay)"
          # "nofocus, title:(HearthstoneOverlay)"
          # "noinitialfocus, title:(HearthstoneOverlay)"
          # "noborder, title:(HearthstoneOverlay)"
          # "opacity 0.2, title:(HearthstoneOverlay)"
          # "stayfocused, title:^(Hearthstone)$"
        ];
        workspace_rule = [
          {
            workspace = "1";
            default = true;
            monitor = "DP-1";
            persistent = true;
          }
          {
            workspace = "2";
            default = true;
            monitor = "HDMI-A-1";
            persistent = true;
          }
          {
            workspace = "3";
            default = true;
            monitor = "DP-3";
            persistent = true;
          }
          {
            workspace = "4";
            monitor = "HDMI-A-1";
          }
        ];

      };
    };
}
