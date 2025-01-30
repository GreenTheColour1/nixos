{ delib, host, ... }:
delib.module {
  name = "programs.hyprland";

  home.ifEnabled =
    {
      cfg,
      myconfig,
      ...
    }:
    {
      wayland.windowManager.hyprland.settings = {

        "$mainMod" = cfg.mod;

        monitor = [
          "DP-1, 1920x1080@144, 0x0, 1, vrr, 1"
          "DP-3, 1920x1080@75, -1920x0, 1"
          "HDMI-A-1, 1920x1080, 1920x0, 1"
        ];

        # env = [
        #   "XDG_SESSION_TYPE,wayland"
        #   "XDG_CURRENT_DESKTOP,Hyprland"
        #   "XDG_SESSION_DESKTOP,Hyprland"
        #   "GDK_BACKEND,wayland,x11"
        #   "SDL_VIDEODRIVER,wayland"
        #   "LIBVA_DRIVER_NAME,nvidia"
        #   "GBM_BACKEND,nvidia-drm"
        #   "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        #   "WLR_NO_HARDWARE_CURSORS,1"
        #   "NVD_BACKEND,direct"
        #   "QT_QPA_PLATFORM,wayland;xcb"
        #   "QT_QPA_PLATFORMTHEME,qt6ct"
        #   # "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        #   "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        #   # "QT_STYLE_OVERRIDE=kvantum"
        #   "ELECTRON_OZONE_PLATFORM_HINT,auto"
        #   "_JAVA_AWT_WM_NONREPARENTING=1"
        #   "MOZ_DISABLE_RDD_SANDBOX,1"
        # ];

        general = {
          gaps_in = cfg.gaps.inner;
          gaps_out = cfg.gaps.outer;
          border_size = cfg.border.size;

          layout = "dwindle";
        };

        input = {
          kb_layout = "us";
          follow_mouse = 1;

          touchpad = {
            natural_scroll = "no";
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

        animations = {
          enabled = "yes";
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };

        dwindle = {
          pseudotile = "yes";
          preserve_split = "yes";
        };

        master = {
          new_status = true;
        };

        gestures = {
          workspace_swipe = "off";
        };

        workspace = [
          "1, default:true, monitor:DP-1, persistent:true"
          "2, default:true, monitor:HDMI-A-1, persistent:true"
          "3, default:true, monitor:DP-3, persistent:true"
          "4, monitor:HDMI-A-1"
        ];

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          mouse_move_enables_dpms = true;
          key_press_enables_dpms = true;
        };
      };
    };

}
