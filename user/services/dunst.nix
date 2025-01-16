{ pkgs, ... }:
{
  services.dunst = {
    enable = true;
    package = pkgs.dunst;
  };
}
