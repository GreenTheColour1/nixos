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
    defaultFileBrowserPackage = packageOption pkgs.thunar;
  };

  nixos.ifEnabled = {
    programs.thunar = {
      enable = true;
    };
    programs.xfconf.enable = true;
    services.gvfs.enable = true;
  };
}
