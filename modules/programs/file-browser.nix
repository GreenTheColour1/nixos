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
    defaultFileBrowserDesktop = strOption "dolphin";
  };

  nixos.ifEnabled = {
    environment.systemPackages = with pkgs; [
      kdePackages.dolphin
      kdePackages.qtsvg
    ];
    # programs.xfconf.enable = true;
    # services.gvfs.enable = true;
  };

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username} = {
        directories = [
          ".local/share/dolphin"
        ];
        files = [ ".local/share/user-places.xbel" ];
      };
    };
}
