{
  inputs,
  config,
  lib,
  pkgs,
  userSettings,
  systemSettings,
  ...
}:
{
  imports = [
    ../app/terminal/kitty.nix
    ./wayland/wlogout.nix
    ./wayland/rofi.nix
    ./wayland/waybar.nix

    #Hyprland spesific
    ./wayland/hyprland/scripts.nix
    ../services/xremap.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        "DP-1, 1920x1080@144, 0x0, 1"
        "DP-3, 1920x1080@75, -1920x0, 1"
        "HDMI-A-1, 1920x1080, 1920x0, 1"
      ];

      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "waybar"
        "webcord -m" # start discord minimized
      ];

      env = [
        "XCUROSR_SIZE,24"
        "XDG_SESSION_TYPE,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "GDK_BACKEND,wayland,x11"
        "SDL_VIDEODRIVER,wayland"
        "LIBVA_DRIVER_NAME,nvidia"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "WLR_NO_HARDWARE_CURSORS,1"
        "NVD_BACKEND,direct"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_STYLE_OVERRIDE=kvantum"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "_JAVA_AWT_WM_NONREPARENTING=1"
        "MOZ_DISABLE_RDD_SANDBOX,1"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;

        touchpad = {
          natural_scroll = "no";
        };

        sensitivity = 0;
        accel_profile = "flat";
      };

      general = {
        gaps_in = 5;
        gaps_out = 3;
        border_size = 2;
        "col.active_border" = lib.mkForce "rgba(D4BE98FF)";
        "col.inactive_border" = lib.mkForce "rgba(ebdbb211)";

        layout = "dwindle";
      };

      decoration = {
        rounding = 5;

        drop_shadow = "yes";
        shadow_range = 5;
        shadow_render_power = 3;
        "col.shadow" = lib.mkForce "rgba(000000BB)";

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

      cursor = {
        no_hardware_cursors = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      windowrule = [
        "opacity 0.7 override,^(kitty)$"
        "float,^(waypaper)$"
      ];

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, Return, exec, kitty"
        "$mainMod, W, exec, zen"
        "$mainMod SHIFT, W, exec, zen --private-window"
        "$mainMod, D, exec, rofi -show drun"
        "$mainMod, B, exec, waypaper"
        "$mainMod, ESCAPE, exec, wlogout -b 2"
        # "$mainMod, P, execr, .config/rofi/scripts/projects.sh"

        "$mainMod, F, fullscreen"
        "$mainMod, Q, killactive,"
        "$mainMod SHIFT, E, exit,"
        "$mainMod, V, togglefloating,"
        #"$mainMod, P, pseudo, # dwindle"
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

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
    xwayland.enable = true;
    systemd.enable = true;
  };

  home.packages = (
    with pkgs;
    [
      kitty
      hypridle
      hyprlock
      hyprshot
      qt6.qtwayland
      libsForQt5.qt5.qtwayland
      xdg-utils
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ]
  );
}
