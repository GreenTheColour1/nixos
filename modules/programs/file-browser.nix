{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.file-browser";

  options.programs.file-browser = with delib; {
    enable = boolOption host.guiFeatured;
    defaultFileBrowserPackage = packageOption pkgs.kdePackages.dolphin;
  };

  home.ifEnabled.home.packages = [ pkgs.kdePackages.dolphin ];
}
