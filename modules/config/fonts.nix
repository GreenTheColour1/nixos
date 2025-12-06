{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "fonts";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled = {
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji

      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.iosevka
      nerd-fonts.iosevka-term

      font-awesome
      material-design-icons
    ];
  };
}
