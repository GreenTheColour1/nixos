{ delib, host, pkgs, inputs, ... }:
delib.module {
  name = "programs.spotify";

  options = delib.singleEnableOption host.isDesktop;

  nixos.always.imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  home.ifEnabled.programs.spicetify = 
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        shuffle
        fullAppDisplay
      ];
      theme = spicePkgs.themes.dribbblish;
      colorScheme = "gruvbox-material-dark";
    };
}
