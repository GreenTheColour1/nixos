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

  nixos.ifEnabled.programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  home.ifEnabled.wayland.windowManager.hyprland.enable = true;
}
