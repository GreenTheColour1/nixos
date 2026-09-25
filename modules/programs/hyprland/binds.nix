{ delib, lib, ... }:
delib.module {
  name = "programs.hyprland";

  home.ifEnabled =
    { myconfig, ... }:
    {
      wayland.windowManager.hyprland.settings =
        let
          lua = lib.generators.mkLuaInline;
          bind = key: action: {
            _args = [
              key
              (lua action)
            ];
          };
          exec = cmd: ''hl.dsp.exec_cmd("${cmd}")'';
          mvws = ws: ''hl.dsp.focus({ workspace = "${ws}"})'';
          mvwd = ws: ''hl.dsp.window.move({ workspace = "${ws}"})'';
          mvwddr = dr: ''hl.dsp.window.move({ direction = "${dr}"})'';
          fs = mode: ''hl.dsp.window.fullscreen({ mode = "${mode}"})'';
          focusdr = dr: ''hl.dsp.focus({ direction = "${dr}"})'';

        in
        {
          bind = [
            #mouse binds
            (bind "SUPER + mouse:272" "hl.dsp.window.drag()")
            (bind "SUPER + mouse:273" "hl.dsp.window.resize()")

            #execs
            (bind "SUPER + Return" (exec "kitty"))
            (bind "SUPER + W" (exec "${myconfig.programs.browser.defaultBrowserBin}"))
            (bind "SUPER + SHIFT + W" (exec "${myconfig.programs.browser.defaultBrowserBin} --private-window"))
            (bind "SUPER + D" (exec "rofi --show drun"))
            (bind "SUPER + C" (exec "kitty --class clipse -e clipse"))
            (bind "SUPER + ESCAPE" (exec "wlogout -b 2"))
            (bind "SUPER + P" (exec "startdevshell"))

            #windows
            (bind "SUPER + F" (fs "fullscreen"))
            (bind "SUPER + Q" "hl.dsp.window.close()")
            (bind "SUPER + V" "hl.dsp.window.float()")

            #Screenshot
            (bind "SUPER + PRINT" (exec "hyprshot -m window"))
            (bind "PRINT" (exec "hyprshot -m output"))
            (bind "SUPER + SHIFT + PRINT" (exec "hyprshot -m region"))

            #Move window focus
            (bind "SUPER + L" (focusdr "right"))
            (bind "SUPER + H" (focusdr "left"))
            (bind "SUPER + K" (focusdr "up"))
            (bind "SUPER + J" (focusdr "down"))

            #Move window
            (bind "SUPER + SHIFT + H" (mvwddr "left"))
            (bind "SUPER + SHIFT + L" (mvwddr "right"))
            (bind "SUPER + SHIFT + K" (mvwddr "down"))
            (bind "SUPER + SHIFT + J" (mvwddr "up"))

            #Workspaces
            (bind "SUPER + 1" (mvws "1"))
            (bind "SUPER + 2" (mvws "2"))
            (bind "SUPER + 3" (mvws "3"))
            (bind "SUPER + 4" (mvws "4"))
            (bind "SUPER + 5" (mvws "5"))
            (bind "SUPER + 6" (mvws "6"))
            (bind "SUPER + 7" (mvws "7"))
            (bind "SUPER + 8" (mvws "8"))
            (bind "SUPER + 9" (mvws "9"))
            (bind "SUPER + 0" (mvws "10"))

            #Move window to workspace
            (bind "SUPER + SHIFT + 1" (mvwd "1"))
            (bind "SUPER + SHIFT + 2" (mvwd "2"))
            (bind "SUPER + SHIFT + 3" (mvwd "3"))
            (bind "SUPER + SHIFT + 4" (mvwd "4"))
            (bind "SUPER + SHIFT + 5" (mvwd "5"))
            (bind "SUPER + SHIFT + 6" (mvwd "6"))
            (bind "SUPER + SHIFT + 7" (mvwd "7"))
            (bind "SUPER + SHIFT + 8" (mvwd "8"))
            (bind "SUPER + SHIFT + 9" (mvwd "9"))
            (bind "SUPER + SHIFT + 0" (mvwd "10"))
          ];
        };
    };
}
