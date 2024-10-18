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
  wallpaperImage = ../../themes/wallpapers/qipao-city.jpg;
in
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix.enable = true;
  stylix.autoEnable = true;
  stylix.polarity = themePolarity;
  stylix.image = wallpaperImage;
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

  stylix.targets.console.enable = true;
}
