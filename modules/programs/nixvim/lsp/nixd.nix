{
  delib,
  pkgs,
  lib,
  ...
}:
let
  flake = ''(builtins.getFlake "github:GreenTheColour1/nixos")'';
in
delib.module {
  name = "programs.nixvim.lsp.nixd";

  options = delib.singleEnableOption true;

  home.ifEnabled =
    { myconfig, ... }:
    {
      programs.nixvim.plugins.lsp.servers.nixd = {
        enable = true;
        settings = {
          formatting.command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];

          options = {
            nixos = {
              expr = "${flake}.nixosConfigurations.nixos-fishy.options"; # FIXME
            };
            # home_manager = {
            #   expr = "${flake}.homeConfigurations.${myconfig.constants.username}@nixos-fishy.options"; # FIXME
            # };
            denix = {
              expr = "${flake}.inputs.denix.lib.options";
            };
          };
        };
      };
    };
}
