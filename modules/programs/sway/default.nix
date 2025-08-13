{
  delib,
  lib,
  ...
}:
delib.module {
  name = "programs.sway";

  options = delib.singleEnableOption false;

  nixos.ifEnabled = {
    environment.loginShellInit = ''
      [[ "$(tty)" == /dev/tty1 ]] && sway
    '';

    environment.sessionVariables = {
      GDK_BACKEND = "wayland,x11,*";
      QT_QPA_PLATFORM = "wayland;xcb";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";

      WLR_NO_HARDWARE_CURSORS = "1";

      NIXOS_OZONE_WL = "1";
    };

    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      extraPackages = lib.mkForce [ ];
    };
  };

  home.ifEnabled =
    { myconfig, ... }:
    {
      wayland.windowManager.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
        config = rec {
          modifier = "Mod4";
          terminal = "kitty";
          menu = "fuzzel";

          input = {
            "touchpad" = {
              dwt = "enabled";
              tap = "enabled";
              natural_scroll = "enabled";
              middle_emulation = "enabled";
            };

            "keyboard" = {
              xkb_layout = "us";
            };
          };

          keybindings = {
            "${modifier}+Return" = "exec kitty";
            "${modifier}+w" = "exec ${myconfig.programs.browser.defautlBrowserBin}";
            "${modifier}+d" = "exec ${menu}";

            # Workspaces
            "${modifier}+1" = "workspace number 1";
            "${modifier}+2" = "workspace number 2";
            "${modifier}+3" = "workspace number 3";
            "${modifier}+4" = "workspace number 4";
            "${modifier}+5" = "workspace number 5";
            "${modifier}+6" = "workspace number 6";
            "${modifier}+7" = "workspace number 7";
            "${modifier}+8" = "workspace number 8";
            "${modifier}+9" = "workspace number 9";

            "${modifier}+Shift+1" = "move container to workspace number 1";
            "${modifier}+Shift+2" = "move container to workspace number 2";
            "${modifier}+Shift+3" = "move container to workspace number 3";
            "${modifier}+Shift+4" = "move container to workspace number 4";
            "${modifier}+Shift+5" = "move container to workspace number 5";
            "${modifier}+Shift+6" = "move container to workspace number 6";
            "${modifier}+Shift+7" = "move container to workspace number 7";
            "${modifier}+Shift+8" = "move container to workspace number 8";
            "${modifier}+Shift+9" = "move container to workspace number 9";

            # Layout
            "${modifier}+f" = "fullscreen";
            "${modifier}+v" = "floating toggle";

            # Resize
            "${modifier}+r" = "mode resize";
          };
        };
      };
    };
}
