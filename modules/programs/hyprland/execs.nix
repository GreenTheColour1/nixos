{ delib, ... }:
delib.module {
  name = "programs.hyprland";

  home.ifEnabled = {
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "sleep 5; discord" # Doesn't launch correctly if launched too fast
        "clipse -listen"
      ];
    };
  };
}
