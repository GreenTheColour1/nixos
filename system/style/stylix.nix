{
  lib,
  pkgs,
  inputs,
  userSettings,
  ...
}:

let
  themePath = "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";
  themePolarity = "dark";
in
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix.enable = true;
  stylix.autoEnable = false;
  stylix.polarity = themePolarity;
  stylix.base16Scheme = themePath;
  stylix.fonts = {
    monospace = {
      name = userSettings.font;
      package = userSettings.fontPkg;
    };
    serif = {
      name = userSettings.font;
      package = userSettings.fontPkg;
    };
    sansSerif = {
      name = userSettings.font;
      package = userSettings.fontPkg;
    };
    emoji = {
      name = "Noto Color Emoji";
      package = pkgs.noto-fonts-emoji-blob-bin;
    };
  };

  stylix.targets = {
    chromium.enable = true;
    console.enable = true;
    grub.enable = true;
    gtk.enable = true;
    nixos-icons.enable = true;
  };
}
