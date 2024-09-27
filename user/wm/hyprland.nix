{ inputs, config, lib, pkgs, userSettings, systemSettings, ... }: let
  pkgs-hyprland = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    ../app/terminal/kitty.nix
    ./wayland/wlogout.nix
    ./wayland/rofi.nix
    ./wayland/waybar.nix

    #Hyprland spesific
    ./wayland/hyprland/scripts.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    settings = { };
    extraConfig = ''
      # Monitors
      monitor=DP-1, 1920x1080@144, 0x0, 1
      monitor=DP-3, 1920x1080@75, -1920x0, 1
      monitor=HDMI-A-1, 1920x1080, 1920x0, 1

      # Execute at launch
      #exec-once = swww-daemon
      #exec-once = $scripts/initEww.sh
      #exec-once = hypridle
      exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once = systemctl --user start plasma-polkit-agent
      exec-once = waybar

      # Some default env vars.
      env = XCURSOR_SIZE,24

      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_TYPE,wayland
      env = XDG_SESSION_DESKTOP,Hyprland

      env = GDK_BACKEND,wayland,x11
      env = SDL_VIDEODRIVER,wayland

      # If using NVIDIA graphics card uncomment these 4 lines!
      env = LIBVA_DRIVER_NAME,nvidia
      env = GBM_BACKEND,nvidia-drm
      env = __GLX_VENDOR_LIBRARY_NAME,nvidia
      env = WLR_NO_HARDWARE_CURSORS,1
      env = NVD_BACKEND,direct

      env = QT_QPA_PLATFORM,wayland;xcb
      env = QT_QPA_PLATFORMTHEME,qt6ct
      env = QT_AUTO_SCREEN_SCALE_FACTOR,1
      env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
      env = QT_STYLE_OVERRIDE=kvantum

      env = ELECTRON_OZONE_PLATFORM_HINT,auto
      env = _JAVA_AWT_WM_NONREPARENTING=1
      env = MOZ_DISABLE_RDD_SANDBOX,1


      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          follow_mouse = 1

          touchpad {
              natural_scroll = no
          }

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
          accel_profile = flat
      }

      general {
          gaps_in = 5
          gaps_out = 3
          border_size = 2
          col.active_border = rgba(D4BE98FF)
          col.inactive_border = rgba(ebdbb211)

          layout = dwindle
      }

      decoration {
          rounding = 5

          drop_shadow = yes
          shadow_range = 5
          shadow_render_power = 3
          col.shadow = rgba(000000BB)

          blur {
              enabled = true
              size = 10
              passes = 3
              ignore_opacity = true
              new_optimizations = true
          }
      }

      animations {
          enabled = yes

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

      dwindle {
          pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = yes # you probably want this
      }

      master {
          new_status = true
      }

      gestures {
          workspace_swipe = off
      }

      cursor {
          no_hardware_cursors = true
      }

      misc {
          disable_hyprland_logo = true
          disable_splash_rendering = true
          mouse_move_enables_dpms = true
          key_press_enables_dpms = true
      }

      windowrule = opacity 0.8 override,^(kitty)$
      windowrule = opacity 0.9 override,^(Code)$
      windowrule = float,^(waypaper)$

      # Keybinds
      $mainMod = SUPER

      bind = $mainMod, Return, exec, kitty
      #bind = $mainMod, W, exec, $scripts/startBrowser.sh
      bind = $mainMod, W, exec, zen
      bind = $mainMod SHIFT, W, exec, zen-browser --private-window
      bind = $mainMod, D, exec, rofi -show drun
      bind = $mainMod, B, exec, waypaper
      bind = $mainMod, ESCAPE, exec, wlogout -b 2
      bind = $mainMod, P, execr, .config/rofi/scripts/projects.sh

      bind = $mainMod, F, fullscreen
      bind = $mainMod, Q, killactive,
      bind = $mainMod SHIFT, E, exit,
      bind = $mainMod, V, togglefloating,
      # bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, Space, togglesplit, # dwindle


      # HYPRSHOT
      # Screenshot a window
      bind = $mainMod, PRINT, exec, hyprshot -m window
      # Screenshot a monitor
      bind = , PRINT, exec, hyprshot -m output
      # Screenshot a region
      bind = $mainMod SHIFT, PRINT, exec, hyprshot -m region

      # Move focus with mainMod + [H, L, K, J]
      bind = $mainMod, L, movefocus, r
      bind = $mainMod, H, movefocus, l
      bind = $mainMod, K, movefocus, u
      bind = $mainMod, J, movefocus, d

      # Move active window with mainMod + SHIFT + [H, L, K, J]
      bind = $mainMod SHIFT, H, movewindow, l
      bind = $mainMod SHIFT, L, movewindow, r
      bind = $mainMod SHIFT, K, movewindow, d
      bind = $mainMod SHIFT, J, movewindow, u

      # Resize active window with mainMod + ALT + [H, L, K, J]
      bind = $mainMod ALT, H, resizeactive, -30 0
      bind = $mainMod ALT, L, resizeactive, 30 0
      bind = $mainMod ALT, K, resizeactive, 0 -30
      bind = $mainMod ALT, J, resizeactive, 0 30

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

    '';
    xwayland.enable = true;
    systemd.enable = true;
  };


  home.packages = (with pkgs; [
    kitty
    # polkit-gnome
    hypridle
    hyprlock
    qt6.qtwayland
    libsForQt5.qt5.qtwayland
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    pamixer
  ]);

  home.file.".config/hypr/hypridle.conf".text = ''
    general {
      lock_cmd = pgrep hyprlock || hyprlock
      before_sleep_cmd = loginctl lock-session
      ignore_dbus_inhibit = false
    }

    # FIXME memory leak fries computer inbetween dpms off and suspend
    #listener {
    #  timeout = 150 # in seconds
    #  on-timeout = hyprctl dispatch dpms off
    #  on-resume = hyprctl dispatch dpms on
    #}
    listener {
      timeout = 300 # in seconds
      on-timeout = loginctl lock-session
    }
    listener {
      timeout = 600 # in seconds
      #timeout = 5400 # in seconds
      on-timeout = systemctl suspend
      on-resume = hyprctl dispatch dpms on
    }
  '';


  home.file.".config/hypr/hyprlock.conf".text = ''
    general {
      disable_loading_bar = false
    }

    background {
      monitor =
      path = screenshot
      color = rgba(25, 20, 20, 1.0)

        blur_passes = 1 # 0 disables blurring
        blur_size = 7
        noise = 0.0117
        contrast = 0.8916
        brightness = 0.8172
        vibrancy = 0.1696
        vibrancy_darkness = 0.0


    }

    input-field {
      monitor = DP-1
      size = 150, 30
      outline_thickness = 3
      outer_color = rgb(151515)
      inner_color = rgb(200, 200, 200)
      fade_on_empty = true
    }

    label {
      monitor =
      text = $TIME
      color = rgba(220, 220, 220, 1.0)
      position = 0, 200
      font_size = 50
      font_family = ''+userSettings.font+''

      halign = center
      valign = center


    }

    label {
        monitor = DP-1
        text = $USER
        color = rgba(220, 220, 220, 1.0)
        position = 0, 20                    # position is added to the halign and valign props. For absolute, use "none" in either.
        font_size = 15
        font_family = ''+userSettings.font+''

        halign = center                     # left, center, right, none
        valign = center                     # top, center, bottom, none
    }
  '';
}
