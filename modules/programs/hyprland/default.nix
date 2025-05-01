{ delib, host, ... }:
delib.module {
  name = "programs.hyprland";

  options.programs.hyprland = with delib; {
    enable = boolOption host.isDesktop; # FIXME

    mod = strOption "SUPER";

    gaps = {
      inner = intOption 5;
      outer = intOption 3;
    };

    border = {
      size = intOption 2;
      radius = intOption 0;
    };
  };

  nixos.ifEnabled = {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };

    environment.sessionVariables = {
      GDK_BACKEND = "wayland,x11,*";
      QT_QPA_PLATFORM = "wayland;xcb";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";

      WLR_NO_HARDWARE_CURSORS = "1";

      NIXOS_OZONE_WL = "1";
    };

  };
  home.ifEnabled.wayland.windowManager.hyprland.enable = true;
}
