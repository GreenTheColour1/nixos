{ delib, pkgs, homeconfig, ... }:
delib.module {
  name = "programs.nh";

  options = delib.singleEnableOption true;

  home.ifEnabled.home.packages = [pkgs.nh];
  home.ifEnabled.programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "${homeconfig.home.homeDirectory}/.dotfiles";
  };
}
