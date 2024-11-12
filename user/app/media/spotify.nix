{ pkgs, inputs, ... }:
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];
  home.packages = with pkgs; [
    # spotify
  ];

  programs.spicetify =
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
