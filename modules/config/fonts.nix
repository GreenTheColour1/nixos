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
      noto-fonts-cjk-sans
      noto-fonts-emoji

      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.iosevka

      font-awesome
      material-design-icons
    ];
  };
}
