{
  delib,
  pkgs,
  inputs,
  ...
}:
let
  themePath = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  themePolarity = "dark";
in
delib.rice {
  name = "gruvbox-dark-medium";

  nixos = {
    imports = [ inputs.stylix.nixosModules.stylix ];

    stylix = {
      enable = true;
      autoEnable = false;
      polarity = themePolarity;
      base16Scheme = themePath;
      fonts = {
        monospace = {
          name = "Fira Nerd Font Mono";
          package = pkgs.nerd-fonts.fira-mono;
        };
        serif = {
          name = "FiraCode Nerd Font";
          package = pkgs.nerd-fonts.fira-code;
        };
        sansSerif = {
          name = "FiraCode Nerd Font";
          package = pkgs.nerd-fonts.fira-code;
        };
      };

      targets = {
        chromium.enable = true;
        console.enable = true;
        grub.enable = true;
        gtk.enable = true;
        nixos-icons.enable = true;
      };

      homeManagerIntegration.autoImport = false;
      homeManagerIntegration.followSystem = false;
    };
  };

  home = {
    imports = [ inputs.stylix.homeManagerModules.stylix ];

    stylix = {
      enable = true;
      autoEnable = false;
      polarity = themePolarity;
      image = ../../wallpapers/latenight-urban.jpg;
      base16Scheme = themePath;

      fonts = {
        monospace = {
          name = "Fira Nerd Font Mono";
          package = pkgs.nerd-fonts.fira-mono;
        };
        serif = {
          name = "FiraCode Nerd Font";
          package = pkgs.nerd-fonts.fira-code;
        };
        sansSerif = {
          name = "FiraCode Nerd Font";
          package = pkgs.nerd-fonts.fira-code;
        };
        sizes = {
          terminal = 12;
          applications = 10;
          popups = 10;
          desktop = 10;
        };
      };

      targets = {
        gtk.enable = true;
        gtk.flatpakSupport.enable = true;
        # nixvim.enable = false;
        bat.enable = true;
        btop.enable = true;
        hyprland.enable = true;
        hyprland.hyprpaper.enable = true;
        kitty.enable = true;
        lazygit.enable = true;
        rofi.enable = true;
        yazi.enable = true;
      };

      cursor = {
        package = pkgs.quintom-cursor-theme;
        name = "Quintom_Ink";
        size = 24;
      };
    };
  };
}
