{ delib, ... }:
delib.module {
  name = "programs.hyprland";

  home.ifEnabled = {
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "[workspace 4 silent] vesktop"
        "clipse -listen"
      ];
    };
  };
}
