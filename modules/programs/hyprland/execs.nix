{ delib, lib, ... }:
delib.module {
  name = "programs.hyprland";

  home.ifEnabled = {
    wayland.windowManager.hyprland.settings.on =
      let
        lua = lib.generators.mkLuaInline;
        on = event: body: {
          _args = [
            event
            (lua "function() ${body} end")
          ];
        };
        exec = cmd: ''hl.exec_cmd("${cmd}")'';
      in
      [
        (on "hyprland.start" ''
          ${exec "sleep 5; vesktop"}
          ${exec "clipse -listen"}
          ${exec "awww-daemon"}
        '')
      ];
  };
}
