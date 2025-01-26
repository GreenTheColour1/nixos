{
  delib,
  pkgs,
  host,
  inputs,
  ...
}:
delib.module {
  name = "programs.comma";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled = {
    imports = [ inputs.nix-index-database.hmModules.nix-index ];
    programs.nix-index-database.comma.enable = true;
  };
}
