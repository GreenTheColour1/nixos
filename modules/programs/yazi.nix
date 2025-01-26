{ delib, host, pkgs, ... }:
delib.module {
  name = "programs.yazi";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled = {
    home.packages = with pkgs; [ yazi ];

    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        manager = {
          show_hidden = true;
          show_symlink = true;
        };
      };
    };
  };
}
