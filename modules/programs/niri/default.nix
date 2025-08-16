{
  delib,
  inputs,
  host,
  pkgs,
  config,
  lib,
  ...
}:
delib.module {
  name = "programs.niri";

  options = delib.singleEnableOption false;

  nixos.always.imports = [ inputs.niri-flake.nixosModules.niri ];

  nixos.ifEnabled = {
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
    niri-flake.cache.enable = true;
    nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];

    environment.sessionVariables = {
      GDK_BACKEND = "wayland,x11,*";
      QT_QPA_PLATFORM = "wayland;xcb";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";

      WLR_NO_HARDWARE_CURSORS = "1";

      DISPLAY = ":0";

      NIXOS_OZONE_WL = "1";
    };

    # programs.zsh.loginShellInit = ''
    #   if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    #     exec niri-session
    #   fi    '';
  };

  # home.always.imports = [
  #   inputs.niri-flake.homeModules.niri
  # ];

  home.ifEnabled =
    { myconfig, ... }:
    {
      programs.niri = {
        settings = {
          spawn-at-startup = [
            {
              command = [
                "swww-daemon"
              ];
            }
          ];

          environment = {
            DISPLAY = ":0";
          };

          binds = {
            "Mod+Return".action.spawn = "kitty";
            "Mod+w".action.spawn = "${myconfig.programs.browser.defaultBrowserBin}";
            "Mod+d".action.spawn = "fuzzel";

            "Mod+q".action.close-window = { };
            "Mod+f".action.maximize-column = { };
            "Mod+Shift+f".action.fullscreen-window = { };
            "Mod+Tab".action.toggle-overview = { };

            "Mod+1".action.focus-workspace = 1;
            "Mod+2".action.focus-workspace = 2;
            "Mod+3".action.focus-workspace = 3;
            "Mod+4".action.focus-workspace = 4;
            "Mod+5".action.focus-workspace = 5;
            "Mod+6".action.focus-workspace = 6;
            "Mod+7".action.focus-workspace = 7;
            "Mod+8".action.focus-workspace = 8;
            "Mod+9".action.focus-workspace = 9;
          };

          input = {
            focus-follows-mouse.enable = true;
            focus-follows-mouse.max-scroll-amount = "95%";
          };

          gestures = {
            hot-corners.enable = false;
          };

          xwayland-satellite = {
            enable = true;
            path = "${lib.getExe pkgs.xwayland-satellite-unstable}";
          };

          hotkey-overlay.skip-at-startup = true;
          prefer-no-csd = true;
        };
      };
    };

}
