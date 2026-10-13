{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.strilingpdf";

  # options = delib.singleEnableOption host.guiFeatured;
  options = delib.singleEnableOption false;

  home.ifEnabled.home.packages = with pkgs; [ stirling-pdf-desktop ];

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        ".config/Stirling-PDF"
        ".local/share/stirling.pdf.dev"
      ];
    };
}
