{
  delib,
  host,
  lib,
  ...
}:
delib.module {
  name = "programs.hyprland";

  home.ifEnabled =
    {
      cfg,
      myconfig,
      ...
    }:
    {
      wayland.windowManager.hyprland.settings =
        let
          lua = lib.generators.mkLuaInline;
          bezier = name: p1: p2: {
            _args = [
              name
              {
                type = "bezier";
                points = [
                  p1
                  p2
                ];
              }
            ];
          };
          env = name: value: {
            _args = [
              name
              value
            ];
          };
        in
        {

          mod = {
            _var = cfg.mod;
          };

          monitor = [
            {
              output = "DP-1";
              mode = "1920x1080@144";
              position = "0x0";
              vrr = 1;
            }
            {
              output = "DP-3";
              mode = "1920x1080@60";
              position = "-1920x0";
              vrr = 1;
            }
            {
              output = "HDMI-A-1";
              mode = "1920x1080";
              position = "1920x0";
              vrr = 1;
            }
          ];

          env = [
            (env "QT_QPA_PLATFORMTHEME" "qt5ct")
          ];

          curve = [
            (bezier "myBezier" [ 0.05 0.9 ] [ 0.1 1.05 ])
          ];

          animation = [
            {
              leaf = "windows";
              enabled = true;
              speed = 7;
              bezier = "myBezier";
            }
            {
              leaf = "windowsOut";
              enabled = true;
              speed = 7;
              bezier = "default";
              style = "popin 80%";
            }
            {
              leaf = "border";
              enabled = true;
              speed = 10;
              bezier = "default";
            }
            {
              leaf = "borderangle";
              enabled = true;
              speed = 8;
              bezier = "default";
            }
            {
              leaf = "fade";
              enabled = true;
              speed = 7;
              bezier = "default";
            }
            {
              leaf = "workspaces";
              enabled = true;
              speed = 6;
              bezier = "default";
            }
          ];

          config = {
            general = {
              gaps_in = cfg.gaps.inner;
              gaps_out = cfg.gaps.outer;
              border_size = cfg.border.size;

              layout = "dwindle";

              allow_tearing = true;
            };

            input = {
              kb_layout = "us";
              follow_mouse = 1;

              touchpad = {
                natural_scroll = false;
              };

              sensitivity = 0;
              accel_profile = "flat";
            };

            decoration = {
              rounding = 5;

              blur = {
                enabled = true;
                size = 10;
                passes = 3;
                ignore_opacity = true;
                new_optimizations = true;
              };
            };
            misc = {
              disable_hyprland_logo = true;
              disable_splash_rendering = true;
              mouse_move_enables_dpms = true;
              key_press_enables_dpms = true;
            };
          };

          # dwindle = {
          #   # pseudotile = "yes";
          #   preserve_split = "yes";
          # };
          #
          # master = {
          #   new_status = true;
          # };

        };
    };

}
