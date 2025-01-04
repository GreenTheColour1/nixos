{ pkgs, inputs, ... }:
{
  # imports = [ inputs.nixcord.homeManagerModules.nixcord ];
  #
  # programs.nixcord = {
  #   enable = true;
  # config = {
  #   themeLinks = [
  #     "https://raw.githubusercontent.com/refact0r/midnight-discord/refs/heads/master/flavors/midnight-vencord.theme.css"
  #   ];
  #
  #   frameless = true;
  # };
  # };

  home.packages = with pkgs; [
    webcord
  ];
}
