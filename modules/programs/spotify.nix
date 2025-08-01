{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:
delib.module {
  name = "programs.spotify";

  options = delib.singleEnableOption host.guiFeatured;

  home.always.imports = [ inputs.spicetify-nix.homeManagerModules.spicetify ];

  home.ifEnabled.programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        shuffle
      ];
      theme = spicePkgs.themes.dribbblish;
      colorScheme = "gruvbox-material-dark";
    };
}
