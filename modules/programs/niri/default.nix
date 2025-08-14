{
  delib,
  inputs,
  host,
  pkgs,
  config,
  ...
}:
delib.module {
  name = "programs.niri";

  options = delib.singleEnableOption false;

  nixos.always.imports = [ inputs.niri-flake.nixosModules.niri ];

  nixos.ifEnabled = {
    programs.niri = {
      enable = true;
      package = pkgs.niri;

      cache.enable = false;
    };
  };

  home.always.imports = [
    inputs.niri-flake.homeModule.niri
  ];

  home.ifEnabled =
    { myconfig, ... }:
    {
      programs.niri = {
        enable = true;
        package = pkgs.niri;

        settings = with config.lib.niri.actions; {
          "Mod+Enter".action = spawn "kitty";
          "Mod+w".action = spawn "${myconfig.programs.browser.defaultBrowserbin}";
          "Mod+d".action = spawn "fuzzel";

          "Mod+q".action = close-window;
          "Mod+f".action = maximize-column;
          "Mod+Shift+f".action = fullscreen-window;
          "Mod+Tab".action = toggle-overview;

          "Mod+1".action = focus-workspace 1;
          "Mod+2".action = focus-workspace 2;
          "Mod+3".action = focus-workspace 3;
          "Mod+4".action = focus-workspace 4;
          "Mod+5".action = focus-workspace 5;
          "Mod+6".action = focus-workspace 6;
          "Mod+7".action = focus-workspace 7;
          "Mod+8".action = focus-workspace 8;
          "Mod+9".action = focus-workspace 9;

          input = {
            focus-follows-mouse.enable = true;
            focus-follows-mouse.max-scroll-amount = "95%";
          };

          hotkey-overlay.skip-at-startup = true;
        };
      };
    };

}
