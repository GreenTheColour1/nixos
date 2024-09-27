{ inputs, ... }: 
{
  imports = [ inputs.aagl.nixosModules.default ];

  nix.settings = inputs.aagl.nixConfig; #set up cachix

  programs.anime-game-launcher.enable = true;
  programs.sleepy-launcher.enable = true;
}
