{
  config,
  lib,
  pkgs,
  inputs,
  userSettings,
  ...
}:

let
  themePath = "../../../themes/" + userSettings.theme + "/" + userSettings.theme + ".yaml";
  themePolarity = "dark";
  wallpaperImage = ../../themes/wallpapers/latenight-urban.jpg;
in
{

  imports = [ inputs.stylix.homeManagerModules.stylix ];

  home.file.".currenttheme".text = userSettings.theme;
  stylix.enable = true;
  stylix.autoEnable = true;
  stylix.polarity = themePolarity;
  stylix.image = wallpaperImage;
  stylix.base16Scheme = ./. + themePath;

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
      name = "Noto Emoji";
      package = pkgs.noto-fonts-monochrome-emoji;
    };
    sizes = {
      terminal = 12;
      applications = 10;
      popups = 10;
      desktop = 10;
    };
  };

  stylix.targets.gtk.enable = true;
  stylix.targets.nixvim.enable = false;
  home.packages = with pkgs; [
    libsForQt5.qt5ct
    pkgs.libsForQt5.breeze-qt5
    libsForQt5.breeze-icons
    pkgs.noto-fonts-monochrome-emoji
  ];
  qt = {
    enable = true;
    style.package = pkgs.libsForQt5.breeze-qt5;
    style.name = "breeze-dark";
    platformTheme.name = "kde";
  };
  fonts.fontconfig.defaultFonts = {
    monospace = [ userSettings.font ];
    sansSerif = [ userSettings.font ];
    serif = [ userSettings.font ];
  };
}
