{ delib, pkgs, ... }:
delib.module {
  name = "programs.ssh";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.ssh = {
    enable = true;

    matchBlocks = {
      "git" = {
        host = "github.com";
        identitiesOnly = true;
        identityFile = [
          "~/.ssh/id_git"
        ];
      };
    };
  };
}
