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

  nixos.always = {
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
    };
  };

  home.always = {
    imports = [ inputs.stylix.homeManagerModules.stylix ];

    stylix = {
      enable = true;
      autoEnable = false;
      polarity = themePolarity;
      image = ../../wallpapers/latenight-urban.jpg;
      base16Scheme = themePath;
    };
  };
}
