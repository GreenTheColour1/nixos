{ delib, ... }:
delib.host {
  name = "fishy-nixos";

  myconfig.programs.zsh.aliases = {
    ".." = "cd ..";
  };
}
