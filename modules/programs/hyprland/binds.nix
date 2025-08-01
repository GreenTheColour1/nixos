{ delib, ... }:
delib.module {
  name = "programs.hyprland";

  home.ifEnabled =
    { myconfig, ... }:
    {
      wayland.windowManager.hyprland.settings = {
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
        bind = [
          "$mainMod, Return, exec, kitty"
          "$mainMod, W, exec, zen-beta"
          "$mainMod SHIFT, W, exec, zen-beta --private-window"
          "$mainMod, D, exec, rofi -show drun"
          "$mainMod, C, exec, kitty --class clipse -e clipse"
          "$mainMod, ESCAPE, exec, wlogout -b 2"
          "$mainMod, P, exec, startdevshell"

          "$mainMod, F, fullscreen"
          "$mainMod, Q, killactive,"
          "$mainMod SHIFT, E, exec, uwsm stop,"
          "$mainMod, V, togglefloating,"
          "$mainMod, Space, togglesplit, # dwindle"

          # Screenshot a window
          "$mainMod, PRINT, exec, hyprshot -m window"
          # Screenshot a monitor
          ", PRINT, exec, hyprshot -m output"
          # Screenshot a region
          "$mainMod SHIFT, PRINT, exec, hyprshot -m region"

          # Move focus with mainMod + [H, L, K, J]
          "$mainMod, L, movefocus, r"
          "$mainMod, H, movefocus, l"
          "$mainMod, K, movefocus, u"
          "$mainMod, J, movefocus, d"

          # Move active window with mainMod + SHIFT + [H, L, K, J]
          "$mainMod SHIFT, H, movewindow, l"
          "$mainMod SHIFT, L, movewindow, r"
          "$mainMod SHIFT, K, movewindow, d"
          "$mainMod SHIFT, J, movewindow, u"

          # Resize active window with mainMod + ALT + [H, L, K, J]
          "$mainMod ALT, H, resizeactive, -30 0"
          "$mainMod ALT, L, resizeactive, 30 0"
          "$mainMod ALT, K, resizeactive, 0 -30"
          "$mainMod ALT, J, resizeactive, 0 30"

          # Switch workspaces with mainMod + [0-9]
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"

          # Scroll through existing workspaces with mainMod + scroll
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
        ];
      };
    };
}
