{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.libreoffice";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled = {
    home.packages = with pkgs; [
      libreoffice
      hunspell
      hunspellDicts.en_US
      hunspellDicts.en_CA
    ];
  };
}
