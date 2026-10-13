{
  delib,
  pkgs,
  host,
  inputs,
  ...
}:
delib.module {
  name = "programs.comma";

  options = delib.singleEnableOption host.cliFeatured;

  home.always.imports = [ inputs.nix-index-database.homeModules.nix-index ];

  home.ifEnabled = {
    programs.nix-index-database.comma.enable = true;
  };
}
