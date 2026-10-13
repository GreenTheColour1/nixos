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

  nixos.ifEnabled = {
    environment.systemPackages = with pkgs; [
      kdePackages.dolphin
      kdePackages.qtsvg
    ];
    # programs.xfconf.enable = true;
    # services.gvfs.enable = true;
  };
}
