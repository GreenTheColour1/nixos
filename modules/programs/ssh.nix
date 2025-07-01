{ delib, pkgs, ... }:
delib.module {
  name = "programs.ssh";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";

    matchBlocks = {
      "git" = {
        host = "github.com";
        user = "git";
        hostname = "github.com";
        identitiesOnly = true;
        identityFile = [
          "~/.ssh/id_git"
        ];
      };
    };
  };
}
