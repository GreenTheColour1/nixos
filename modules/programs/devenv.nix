{ delib, host, pkgs, ... }:
delib.module {
  name = "programs.devenv";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled = {
    environment.systemPackages = [
      pkgs.devenv
    ];

    programs.direnv = {
      package = pkgs.direnv;
      silent = false;
      loadInNixShell = true;
      direnvrcExtra = "";
      enableZshIntegration = true;
      nix-direnv = {
        enable = true;
        package = pkgs.nix-direnv;
      };
    };
  };
}
