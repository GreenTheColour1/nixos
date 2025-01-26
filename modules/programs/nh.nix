{ delib, pkgs, ... }:
delib.module {
  name = "programs.nh";

  options = delib.singleEnableOption true;

  home.ifEnabled = { myconfig, ... }: {
    home.packages = [ pkgs.nh ];
    programs.nh = {

    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/${myconfig.constants.username}/.dotfiles";
    };
  };
}
